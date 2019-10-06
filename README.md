# NYTimes Articles

This sample project is an example how to fetch data from an API and displaying it in a master detail controllers.

# Technology!

  - MVVM Architecture.
  - Protocol Oriented Programming.
  - TDD.
  - Localization.
  - Fastlane Integration to generate unit tests reports. [How?][fastlane]
  - Slather Integration to generate code coverage reports. [How?][slather]

# Dependencies
I used below cocoapods:
* [Alamofire][alamorefire] for networking.
* [SDWebImage][sdwebimage] for image loading.
* [MBProgressHUD][mbprogresshud] for UI loader.

# Installation

After cloning project do following steps:

* Install the dependencies.
in your project root open terminal and type:

```sh
$ pod install
```

# Unit Tests 
To generate unit tests report.
in your project root open terminal and type:

```sh
$ fastlane test
```
Test report can be found in your Fastlane folder inside project root folder

# Code Coverage
To generate code coverage report.
in your project root open terminal and type:

```sh
$ slather coverage -s --scheme NYTimesArticles --workspace NYTimesArticles.xcworkspace NYTimesArticles.xcodeproj
```

License
----

MIT
**Free Code, Hell Yeah!**

   [fastlane]: <https://docs.fastlane.tools/getting-started/ios/setup>
   [slather]: <https://github.com/SlatherOrg/slather>
   [alamorefire]: <https://github.com/Alamofire/Alamofire>
   [sdwebimage]: <https://github.com/SDWebImage/SDWebImage>
   [mbprogresshud]: <https://github.com/jdg/MBProgressHUD>
