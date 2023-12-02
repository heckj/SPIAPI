import OpenAPIRuntime
import OpenAPIURLSession

#if os(Linux)
    @preconcurrency import struct Foundation.Data
    @preconcurrency import struct Foundation.Date
    @preconcurrency import struct Foundation.URL
#else
    import struct Foundation.Data
    import struct Foundation.Date
    import struct Foundation.URL
#endif

// let client = Client(
//    serverURL: try Servers.server2(),
//    transport: URLSessionTransport()
// )
let staging = URL(string: "https://staging.swiftpackageindex.com/")!
let packageindexclient = Client(
    serverURL: staging,
    transport: OpenAPIURLSession.URLSessionTransport()
)

public func search(terms _: String) async throws {
    let apiResponse = try await packageindexclient.getApiSearch(
        Operations.getApiSearch.Input(
            query: .init(query: "CRDT",
                         page: 0,
                         pageSize: 50),
            headers: .init(accept: [])
        )
    )

    switch apiResponse {
    case let .ok(responseBody):
        let searchResult: Components.Schemas.SearchResponse = try responseBody.body.json
        print(searchResult)
        let repliedTerms = searchResult.searchTerm
        print(repliedTerms)
        let results: Components.Schemas.SearchResponse.resultsPayload = searchResult.results
        // the same as []
        for individualResult: Components.Schemas.SearchResponse.resultsPayloadPayload in results {
            print(individualResult) // OpenAPI schema information breaks down here with existing schema
            // Ideally we'd be getting a list of packages decoded and returned, but the schema drops
            // to any in the generated code.
            
            // Based on what I've learned about VaporToOpenAPI, this can be mitigated with a more
            // thorough example in the upstream code where the schema is being determined.
        }
        

    // if we want access to the status code for this unexpected scenario:
    case let .undocumented(statusCode: statusCode, _):
        print("Unexpected response with status code: \(statusCode)")
        // throw some error?

    // otherwise:
    default:
        print("Ooops") // something went wrong - throw error
    }
}
