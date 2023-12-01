# Swift Package Index API package

API package generated through Swift OpenAPI Generator.

## Production API:

- URL https://swiftpackageindex.com/openapi/openapi.json
- [Documentation](https://redocly.github.io/redoc/?url=https://swiftpackageindex.com/openapi/openapi.json#tag/api/operation/postApiVersionsByIdBuild-report)

## Development API

- URL: https://staging.swiftpackageindex.com/openapi/openapi.json
- [Documentation](https://redocly.github.io/redoc/?url=https://staging.swiftpackageindex.com/openapi/openapi.json#tag/api/operation/postApiVersionsByIdBuild-report)


Manual generation using the swift-openapi-generator

```
cd ~/src/swift-openapi-generator
swift run swift-openapi-generator generate --mode types --mode client --output-directory ~/src/SPIAPI/Sources/SPIAPI/generated/ --config ~/src/SPIAPI/Sources/SPIAPI/openapi-generator-config.yaml --access-modifier public ~/src/SPIAPI/Sources/SPIAPI/staging.openapi.json
```

