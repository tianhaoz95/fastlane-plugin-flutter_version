# flutter_version plugin
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-2-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-flutter_version)
[![Gitpod Ready-to-Code](https://img.shields.io/badge/Gitpod-Ready--to--Code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/tianhaoz95/fastlane-plugin-flutter_version) 

flutter_version is a Fastlane plugin to retrieve version code from Flutter projects which can be used to release changlogs and other metadata to marketplaces.

## Installation

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-flutter_version`, add it to your project by adding the following lines in `Gemfile`:

### From GitHub registry

Check out the instructions [here](https://github.com/tianhaoz95/fastlane-plugin-flutter_version/packages/143774).

### Directly from Github

```Gemfile
gem "fastlane-plugin-flutter_version", git: "https://github.com/tianhaoz95/fastlane-plugin-flutter-version"
```

## About flutter_version

A plugin to retrieve versioning information for Flutter projects.

## Example

The following example releases a Android app to Google Play Store without needing to manually specify the app version:

```ruby
desc "submit to internal track in Google Play Store"
lane :internal do
  gradle(task: 'bundle', build_type: 'Release')
  upload_to_play_store(
    track: 'internal',
    version_code: flutter_version()["version_code"],
    aab: '../build/app/outputs/bundle/release/app-release.aab',
    skip_upload_screenshots: true,
    skip_upload_images: true
  )
end
```

The line `flutter_version()` fetches the version information from the `pubspec.yaml` file from the Flutter project and parses the version information from the file. This is convenient for continuous integration because it saves the effort for developers to keep track of version information in multiple places.

For more details, check out the [example project configuration](https://github.com/tianhaoz95/photochat/blob/master/photochatapp/android/fastlane/Fastfile).

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use

```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://www.shunkakinoki.com/"><img src="https://avatars0.githubusercontent.com/u/39187513?v=4" width="100px;" alt=""/><br /><sub><b>Shun Kakinoki</b></sub></a><br /><a href="https://github.com/tianhaoz95/fastlane-plugin-flutter_version/commits?author=shunkakinoki" title="Code">💻</a></td>
    <td align="center"><a href="http://tianhaoz.com"><img src="https://avatars3.githubusercontent.com/u/16887772?v=4" width="100px;" alt=""/><br /><sub><b>Tianhao Zhou</b></sub></a><br /><a href="https://github.com/tianhaoz95/fastlane-plugin-flutter_version/commits?author=tianhaoz95" title="Code">💻</a></td>
  </tr>
</table>

<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!