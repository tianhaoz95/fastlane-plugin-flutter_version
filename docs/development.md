# For developers

## Install dependencies

```bash
bundle install
```

If the command above complains about permission issue, use:

```bash
sudo bundle install --path ./vendor/bundle
```

## Run tests for this plugin

To run both the tests, and code style validation, run

```bash
bunlde exec rake
```

To automatically fix many of the styling issues, use

```bash
bundle exec rake rubocop:auto_correct -a
```

## VS code

### Remote container developement

To set git actor automatically every time a new container is built, set `VSCODE_CONTAINER_GIT_EMAIL` and `VSCODE_CONTAINER_GIT_USER` as environment variables, and add them into `~/.bashrc` if needed.
