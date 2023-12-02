# Swift Package Index API package

API package generated through Swift OpenAPI Generator.

## Production API:

- URL https://swiftpackageindex.com/openapi/openapi.json
- [Documentation](https://redocly.github.io/redoc/?url=https://swiftpackageindex.com/openapi/openapi.json#tag/api/operation/postApiVersionsByIdBuild-report)

## Development API

- URL: https://staging.swiftpackageindex.com/openapi/openapi.json
- [Documentation](https://redocly.github.io/redoc/?url=https://staging.swiftpackageindex.com/openapi/openapi.json#tag/api/operation/postApiVersionsByIdBuild-report)

## Manually Generating Code

You can manually generate the code using [swift-openapi-generator](https://github.com/apple/swift-openapi-generator) instead of relying on the build plugin to do the work.
However, if you later enable the build plugin, then you'll have duplicate classes and things will get munged up - so pretty much choose one path or the other.
Here's my recipe to invoke the manual generation, with some built-in assumptions (all my sources reside in `~/src` and this repository is checked out at `~/src/SPIAPI`.

```
git clone https://github.com/apple/swift-openapi-generator)
cd ~/src/swift-openapi-generator
swift run swift-openapi-generator generate --mode types --mode client --output-directory ~/src/SPIAPI/Sources/SPIAPI/generated/ --config ~/src/SPIAPI/Sources/SPIAPI/openapi-generator-config.yaml --access-modifier public ~/src/SPIAPI/Sources/SPIAPI/staging.openapi.json
```

The recipe above includes one additional bit of configuration over the `openapi-generator-config.yaml` [file](Sources/SPIAPI/openapi-generator-config.yaml): `--access-modifier public`.
This sets the default access levels to public, instead of package, which is important for this project,
intended to be a standalone library that can be imported and used in another project.
