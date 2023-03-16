# Swift Dev Container Features

A series of devcontainer features for Swift development.

Details for each feature can be found in their related READMEs

- [foundationnetworking](/src/foundationnetworking/README.md)
- [jemalloc](/src/jemalloc/README.md)
- [sqlite](/src/sqlite/README.md)
- [swift-format](/src/swift-format/README.md)
- [SwiftFormat](/src/SwiftFormat/README.md)

Devcontainer features are added to a devcontainer as follows

```jsonc
{
    "image": "swift:5.7",
    "features": {
        "ghcr.io/swift-server-community/swift-devcontainer-features/jemalloc:1": { },
        "ghcr.io/swift-server-community/swift-devcontainer-features/swiftformat:0": { }
    }
}
```

## Testing

Using the devcontainer CLI:

```bash
devcontainer features test --skip-autogenerated -f <feature name> -i swift:5.7 .
devcontainer features test --skip-scenarios -f <feature name> -i swift:5.7 .

devcontainer features test --global-scenarios-only -i swift:5.7 .
```
