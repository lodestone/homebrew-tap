# Kronuz Homebrew

## Formulas

### xapiand

This formula makes it easy to install `xapiand` on any modern OS X system.

Just `brew install Kronuz/tap/nginx`.

The [project's page](http://kronuz.io/Xapiand) goes into detail about it.


# To Build Bottles

```sh
brew update

brew install --build-bottle Kronuz/tap/xapiand
brew bottle Kronuz/tap/xapiand

brew install --build-bottle Kronuz/tap/nginx
brew bottle Kronuz/tap/nginx
```

# Copyright

Copyright © 2018 Germán Méndez Bravo (Kronuz)

Code released under the [MIT License](LICENSE).
