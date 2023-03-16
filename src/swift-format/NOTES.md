## Version Selection

The swift-format feature selects the version of swift-format based off what version of Swift you have installed.

| Swift Version | `swift-format` Tags |
|:--------------|:--------------------|
| Swift 5.7     | `0.50700.*`         |
| Swift 5.6     | `0.50600.*`         |
| Swift 5.5     | `0.50500.*`         |
| Swift 5.4     | `0.50400.*`         |
| Swift 5.3     | `0.50300.*`         |
| Swift 5.2     | `0.50200.*`         |

If you are using a development version of swift it will use the `main` branch of swift-format.

You can override this by setting the version option when including the feature.
```jsonc
"features": {
    "ghcr.io/swift-server-community/swift-devcontainer-features/swift-format:0": {
        "version": "0.50600.0"
    }
}
```