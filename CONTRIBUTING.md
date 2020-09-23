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