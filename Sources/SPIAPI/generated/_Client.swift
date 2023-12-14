//// Generated by swift-openapi-generator, do not modify.
// @_spi(Generated) import OpenAPIRuntime
// #if os(Linux)
//    @preconcurrency import struct Foundation.Data
//    @preconcurrency import struct Foundation.Date
//    @preconcurrency import struct Foundation.URL
// #else
//    import struct Foundation.Data
//    import struct Foundation.Date
//    import struct Foundation.URL
// #endif
// import HTTPTypes
///// Swift Package Index API
// public struct Client: APIProtocol {
//    /// The underlying HTTP client.
//    private let client: UniversalClient
//    /// Creates a new client.
//    /// - Parameters:
//    ///   - serverURL: The server URL that the client connects to. Any server
//    ///   URLs defined in the OpenAPI document are available as static methods
//    ///   on the ``Servers`` type.
//    ///   - configuration: A set of configuration values for the client.
//    ///   - transport: A transport that performs HTTP operations.
//    ///   - middlewares: A list of middlewares to call before the transport.
//    public init(
//        serverURL: Foundation.URL,
//        configuration: Configuration = .init(),
//        transport: any ClientTransport,
//        middlewares: [any ClientMiddleware] = []
//    ) {
//        client = .init(
//            serverURL: serverURL,
//            configuration: configuration,
//            transport: transport,
//            middlewares: middlewares
//        )
//    }
//
//    private var converter: Converter {
//        client.converter
//    }
//
//    /// /api/version
//    ///
//    /// Get the site's version.
//    ///
//    /// - Remark: HTTP `GET /api/version`.
//    /// - Remark: Generated from `#/paths//api/version/get(getApiVersion)`.
//    public func getApiVersion(_ input: Operations.getApiVersion.Input) async throws -> Operations.getApiVersion.Output {
//        try await client.send(
//            input: input,
//            forOperation: Operations.getApiVersion.id,
//            serializer: { input in
//                let path = try converter.renderedPath(
//                    template: "/api/version",
//                    parameters: []
//                )
//                var request: HTTPTypes.HTTPRequest = .init(
//                    soar_path: path,
//                    method: .get
//                )
//                suppressMutabilityWarning(&request)
//                converter.setAcceptHeader(
//                    in: &request.headerFields,
//                    contentTypes: input.headers.accept
//                )
//                return (request, nil)
//            },
//            deserializer: { response, responseBody in
//                switch response.status.code {
//                case 200:
//                    let contentType = converter.extractContentTypeIfPresent(in: response.headerFields)
//                    let body: Operations.getApiVersion.Output.Ok.Body
//                    let chosenContentType = try converter.bestContentType(
//                        received: contentType,
//                        options: [
//                            "application/json",
//                        ]
//                    )
//                    switch chosenContentType {
//                    case "application/json":
//                        body = try await converter.getResponseBodyAsJSON(
//                            Components.Schemas.APIVersion.self,
//                            from: responseBody,
//                            transforming: { value in
//                                .json(value)
//                            }
//                        )
//                    default:
//                        preconditionFailure("bestContentType chose an invalid content type.")
//                    }
//                    return .ok(.init(body: body))
//                default:
//                    return .undocumented(
//                        statusCode: response.status.code,
//                        .init()
//                    )
//                }
//            }
//        )
//    }
//
//    /// /api/builds/{id}/doc-report
//    ///
//    /// Send a documentation generation report.
//    ///
//    /// - Remark: HTTP `POST /api/builds/{id}/doc-report`.
//    /// - Remark: Generated from `#/paths//api/builds/{id}/doc-report/post(postApiBuildsByIdDoc-report)`.
//    public func postApiBuildsByIdDoc_hyphen_report(_ input: Operations.postApiBuildsByIdDoc_hyphen_report.Input) async throws -> Operations.postApiBuildsByIdDoc_hyphen_report.Output {
//        try await client.send(
//            input: input,
//            forOperation: Operations.postApiBuildsByIdDoc_hyphen_report.id,
//            serializer: { input in
//                let path = try converter.renderedPath(
//                    template: "/api/builds/{}/doc-report",
//                    parameters: [
//                        input.path.id,
//                    ]
//                )
//                var request: HTTPTypes.HTTPRequest = .init(
//                    soar_path: path,
//                    method: .post
//                )
//                suppressMutabilityWarning(&request)
//                converter.setAcceptHeader(
//                    in: &request.headerFields,
//                    contentTypes: input.headers.accept
//                )
//                let body: OpenAPIRuntime.HTTPBody?
//                switch input.body {
//                case let .json(value):
//                    body = try converter.setRequiredRequestBodyAsJSON(
//                        value,
//                        headerFields: &request.headerFields,
//                        contentType: "application/json; charset=utf-8"
//                    )
//                }
//                return (request, body)
//            },
//            deserializer: { response, responseBody in
//                switch response.status.code {
//                case 200:
//                    let contentType = converter.extractContentTypeIfPresent(in: response.headerFields)
//                    let body: Operations.postApiBuildsByIdDoc_hyphen_report.Output.Ok.Body
//                    let chosenContentType = try converter.bestContentType(
//                        received: contentType,
//                        options: [
//                            "application/json",
//                        ]
//                    )
//                    switch chosenContentType {
//                    case "application/json":
//                        body = try await converter.getResponseBodyAsJSON(
//                            Swift.Int64.self,
//                            from: responseBody,
//                            transforming: { value in
//                                .json(value)
//                            }
//                        )
//                    default:
//                        preconditionFailure("bestContentType chose an invalid content type.")
//                    }
//                    return .ok(.init(body: body))
//                default:
//                    return .undocumented(
//                        statusCode: response.status.code,
//                        .init()
//                    )
//                }
//            }
//        )
//    }
//
//    /// /api/packages/{owner}/{repository}/badge
//    ///
//    /// Get shields.io badge for the given repository.
//    ///
//    /// - Remark: HTTP `GET /api/packages/{owner}/{repository}/badge`.
//    /// - Remark: Generated from `#/paths//api/packages/{owner}/{repository}/badge/get(getApiPackagesByOwnerByRepositoryBadge)`.
//    public func getApiPackagesByOwnerByRepositoryBadge(_ input: Operations.getApiPackagesByOwnerByRepositoryBadge.Input) async throws -> Operations.getApiPackagesByOwnerByRepositoryBadge.Output {
//        try await client.send(
//            input: input,
//            forOperation: Operations.getApiPackagesByOwnerByRepositoryBadge.id,
//            serializer: { input in
//                let path = try converter.renderedPath(
//                    template: "/api/packages/{}/{}/badge",
//                    parameters: [
//                        input.path.owner,
//                        input.path.repository,
//                    ]
//                )
//                var request: HTTPTypes.HTTPRequest = .init(
//                    soar_path: path,
//                    method: .get
//                )
//                suppressMutabilityWarning(&request)
//                try converter.setQueryItemAsURI(
//                    in: &request,
//                    style: .form,
//                    explode: true,
//                    name: "type",
//                    value: input.query._type
//                )
//                converter.setAcceptHeader(
//                    in: &request.headerFields,
//                    contentTypes: input.headers.accept
//                )
//                return (request, nil)
//            },
//            deserializer: { response, responseBody in
//                switch response.status.code {
//                case 200:
//                    let contentType = converter.extractContentTypeIfPresent(in: response.headerFields)
//                    let body: Operations.getApiPackagesByOwnerByRepositoryBadge.Output.Ok.Body
//                    let chosenContentType = try converter.bestContentType(
//                        received: contentType,
//                        options: [
//                            "application/json",
//                        ]
//                    )
//                    switch chosenContentType {
//                    case "application/json":
//                        body = try await converter.getResponseBodyAsJSON(
//                            Components.Schemas.Badge.self,
//                            from: responseBody,
//                            transforming: { value in
//                                .json(value)
//                            }
//                        )
//                    default:
//                        preconditionFailure("bestContentType chose an invalid content type.")
//                    }
//                    return .ok(.init(body: body))
//                default:
//                    return .undocumented(
//                        statusCode: response.status.code,
//                        .init()
//                    )
//                }
//            }
//        )
//    }
//
//    /// /api/packages/{owner}/{repository}
//    ///
//    /// Get package details.
//    ///
//    /// - Remark: HTTP `GET /api/packages/{owner}/{repository}`.
//    /// - Remark: Generated from `#/paths//api/packages/{owner}/{repository}/get(getApiPackagesByOwnerByRepository)`.
//    public func getApiPackagesByOwnerByRepository(_ input: Operations.getApiPackagesByOwnerByRepository.Input) async throws -> Operations.getApiPackagesByOwnerByRepository.Output {
//        try await client.send(
//            input: input,
//            forOperation: Operations.getApiPackagesByOwnerByRepository.id,
//            serializer: { input in
//                let path = try converter.renderedPath(
//                    template: "/api/packages/{}/{}",
//                    parameters: [
//                        input.path.owner,
//                        input.path.repository,
//                    ]
//                )
//                var request: HTTPTypes.HTTPRequest = .init(
//                    soar_path: path,
//                    method: .get
//                )
//                suppressMutabilityWarning(&request)
//                converter.setAcceptHeader(
//                    in: &request.headerFields,
//                    contentTypes: input.headers.accept
//                )
//                return (request, nil)
//            },
//            deserializer: { response, responseBody in
//                switch response.status.code {
//                case 200:
//                    let contentType = converter.extractContentTypeIfPresent(in: response.headerFields)
//                    let body: Operations.getApiPackagesByOwnerByRepository.Output.Ok.Body
//                    let chosenContentType = try converter.bestContentType(
//                        received: contentType,
//                        options: [
//                            "application/json",
//                        ]
//                    )
//                    switch chosenContentType {
//                    case "application/json":
//                        body = try await converter.getResponseBodyAsJSON(
//                            Components.Schemas.APIPackageControllerGetRouteModel.self,
//                            from: responseBody,
//                            transforming: { value in
//                                .json(value)
//                            }
//                        )
//                    default:
//                        preconditionFailure("bestContentType chose an invalid content type.")
//                    }
//                    return .ok(.init(body: body))
//                default:
//                    return .undocumented(
//                        statusCode: response.status.code,
//                        .init()
//                    )
//                }
//            }
//        )
//    }
//
//    /// /api/versions/{id}/build-report
//    ///
//    /// Send a build report.
//    ///
//    /// - Remark: HTTP `POST /api/versions/{id}/build-report`.
//    /// - Remark: Generated from `#/paths//api/versions/{id}/build-report/post(postApiVersionsByIdBuild-report)`.
//    public func postApiVersionsByIdBuild_hyphen_report(_ input: Operations.postApiVersionsByIdBuild_hyphen_report.Input) async throws -> Operations.postApiVersionsByIdBuild_hyphen_report.Output {
//        try await client.send(
//            input: input,
//            forOperation: Operations.postApiVersionsByIdBuild_hyphen_report.id,
//            serializer: { input in
//                let path = try converter.renderedPath(
//                    template: "/api/versions/{}/build-report",
//                    parameters: [
//                        input.path.id,
//                    ]
//                )
//                var request: HTTPTypes.HTTPRequest = .init(
//                    soar_path: path,
//                    method: .post
//                )
//                suppressMutabilityWarning(&request)
//                converter.setAcceptHeader(
//                    in: &request.headerFields,
//                    contentTypes: input.headers.accept
//                )
//                let body: OpenAPIRuntime.HTTPBody?
//                switch input.body {
//                case let .json(value):
//                    body = try converter.setRequiredRequestBodyAsJSON(
//                        value,
//                        headerFields: &request.headerFields,
//                        contentType: "application/json; charset=utf-8"
//                    )
//                }
//                return (request, body)
//            },
//            deserializer: { response, responseBody in
//                switch response.status.code {
//                case 200:
//                    let contentType = converter.extractContentTypeIfPresent(in: response.headerFields)
//                    let body: Operations.postApiVersionsByIdBuild_hyphen_report.Output.Ok.Body
//                    let chosenContentType = try converter.bestContentType(
//                        received: contentType,
//                        options: [
//                            "application/json",
//                        ]
//                    )
//                    switch chosenContentType {
//                    case "application/json":
//                        body = try await converter.getResponseBodyAsJSON(
//                            Swift.Int64.self,
//                            from: responseBody,
//                            transforming: { value in
//                                .json(value)
//                            }
//                        )
//                    default:
//                        preconditionFailure("bestContentType chose an invalid content type.")
//                    }
//                    return .ok(.init(body: body))
//                default:
//                    return .undocumented(
//                        statusCode: response.status.code,
//                        .init()
//                    )
//                }
//            }
//        )
//    }
//
//    /// /api/package-collections
//    ///
//    /// Generate a signed package collection.
//    ///
//    /// - Remark: HTTP `POST /api/package-collections`.
//    /// - Remark: Generated from `#/paths//api/package-collections/post(postApiPackage-collections)`.
//    public func postApiPackage_hyphen_collections(_ input: Operations.postApiPackage_hyphen_collections.Input) async throws -> Operations.postApiPackage_hyphen_collections.Output {
//        try await client.send(
//            input: input,
//            forOperation: Operations.postApiPackage_hyphen_collections.id,
//            serializer: { input in
//                let path = try converter.renderedPath(
//                    template: "/api/package-collections",
//                    parameters: []
//                )
//                var request: HTTPTypes.HTTPRequest = .init(
//                    soar_path: path,
//                    method: .post
//                )
//                suppressMutabilityWarning(&request)
//                converter.setAcceptHeader(
//                    in: &request.headerFields,
//                    contentTypes: input.headers.accept
//                )
//                let body: OpenAPIRuntime.HTTPBody?
//                switch input.body {
//                case let .json(value):
//                    body = try converter.setRequiredRequestBodyAsJSON(
//                        value,
//                        headerFields: &request.headerFields,
//                        contentType: "application/json; charset=utf-8"
//                    )
//                }
//                return (request, body)
//            },
//            deserializer: { response, responseBody in
//                switch response.status.code {
//                case 200:
//                    let contentType = converter.extractContentTypeIfPresent(in: response.headerFields)
//                    let body: Operations.postApiPackage_hyphen_collections.Output.Ok.Body
//                    let chosenContentType = try converter.bestContentType(
//                        received: contentType,
//                        options: [
//                            "application/json",
//                        ]
//                    )
//                    switch chosenContentType {
//                    case "application/json":
//                        body = try await converter.getResponseBodyAsJSON(
//                            Components.Schemas.PackageCollectionModelV1SignedCollection.self,
//                            from: responseBody,
//                            transforming: { value in
//                                .json(value)
//                            }
//                        )
//                    default:
//                        preconditionFailure("bestContentType chose an invalid content type.")
//                    }
//                    return .ok(.init(body: body))
//                default:
//                    return .undocumented(
//                        statusCode: response.status.code,
//                        .init()
//                    )
//                }
//            }
//        )
//    }
//
//    /// /api/search
//    ///
//    /// Execute a search.
//    ///
//    /// - Remark: HTTP `GET /api/search`.
//    /// - Remark: Generated from `#/paths//api/search/get(getApiSearch)`.
//    public func getApiSearch(_ input: Operations.getApiSearch.Input) async throws -> Operations.getApiSearch.Output {
//        try await client.send(
//            input: input,
//            forOperation: Operations.getApiSearch.id,
//            serializer: { input in
//                let path = try converter.renderedPath(
//                    template: "/api/search",
//                    parameters: []
//                )
//                var request: HTTPTypes.HTTPRequest = .init(
//                    soar_path: path,
//                    method: .get
//                )
//                suppressMutabilityWarning(&request)
//                try converter.setQueryItemAsURI(
//                    in: &request,
//                    style: .form,
//                    explode: true,
//                    name: "query",
//                    value: input.query.query
//                )
//                try converter.setQueryItemAsURI(
//                    in: &request,
//                    style: .form,
//                    explode: true,
//                    name: "page",
//                    value: input.query.page
//                )
//                try converter.setQueryItemAsURI(
//                    in: &request,
//                    style: .form,
//                    explode: true,
//                    name: "pageSize",
//                    value: input.query.pageSize
//                )
//                converter.setAcceptHeader(
//                    in: &request.headerFields,
//                    contentTypes: input.headers.accept
//                )
//                return (request, nil)
//            },
//            deserializer: { response, responseBody in
//                switch response.status.code {
//                case 200:
//                    let contentType = converter.extractContentTypeIfPresent(in: response.headerFields)
//                    let body: Operations.getApiSearch.Output.Ok.Body
//                    let chosenContentType = try converter.bestContentType(
//                        received: contentType,
//                        options: [
//                            "application/json",
//                        ]
//                    )
//                    switch chosenContentType {
//                    case "application/json":
//                        body = try await converter.getResponseBodyAsJSON(
//                            Components.Schemas.SearchResponse.self,
//                            from: responseBody,
//                            transforming: { value in
//                                .json(value)
//                            }
//                        )
//                    default:
//                        preconditionFailure("bestContentType chose an invalid content type.")
//                    }
//                    return .ok(.init(body: body))
//                default:
//                    return .undocumented(
//                        statusCode: response.status.code,
//                        .init()
//                    )
//                }
//            }
//        )
//    }
// }
