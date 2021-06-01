# Available Options

## Flutter config file location

This is the location of `pubspec.yaml` to read the version information from relative to the location of `fastlane` directory because that is the `cwd` when `fastlane` executes.

It can be passed into `flutter_version` with the `pubspec_location` argument.

Normally, if the `pubspec.yaml` file locates in `[app_root]/pubspec.yaml`, the `fastlane` will be either `[app_root]/android/fastlane` or `[app_root]/ios/fastlane`, so it defaults to `../pubspec.yaml`.

If, for some reason, the `fastlane` for the `Android` delegate of your `Flutter` project locates in `[app_root]/delegates/android/fastlane`, then you will need to override this value like this:

```ruby
flutter_version(pubspec_location='../../pubspec.yaml')
```

## Version code omission

Normally, a Flutter project will have a version that looks like `vX.X.X+X`, but the last `X`, the build number, is not required for all projects, especially if the project doesn't target Android (Google Play Store relies on the build number to roll out).

For example, `vX.X.X` is also a valid Flutter version.

If that is the case for you, pass `should_omit_version_code` as `true` into `flutter_version`, and it will not complain about it and set the build number to `NOT_FOUND`.

Here is an example:

```yaml
# Assuming this is the pubspec.yaml file
name: example Flutter project
version: 1.0.7
```

```ruby
# The following code will return "1.0.7".
flutter_version(should_omit_version_code: true)["version_name"]

# The following code will return "NOT_FOUND".
flutter_version(should_omit_version_code: true)["version_code"]

# The following code will error out.
flutter_version()["version_code"]
```
