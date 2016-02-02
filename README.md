# saml-ios-app [![Build Status](https://travis-ci.org/feedhenry-templates/saml-ios-app.png)](https://travis-ci.org/feedhenry-templates/saml-ios-app)

Simple native iOS app to work with [```SAML Service``` connector service](https://github.com/feedhenry-templates/saml-service). To configure the service in your RHMAP platform read the [SAML notes](https://github.com/feedhenry-templates/saml-service/blob/master/NOTES.md)

|                 | Project Info  |
| --------------- | ------------- |
| License:        | Apache License, Version 2.0  |
| Build:          | Embedded FH.framework  |
| Documentation:  | http://docs.feedhenry.com/v3/dev_tools/sdks/ios.html|

## Build

1. Clone this project

2. Populate ```saml-ios-app/fhconfig.plist``` with your values as explained [here](http://docs.feedhenry.com/v3/dev_tools/sdks/ios.html#ios-configure).

3. open saml-ios-app.xcodeproj

## Example Usage

### Using FHCloudRequest
In this example we used ```FHCloudRequest``` to make request on the REST endpoint setup to deal with SAML authentication.

### iOS9 and non TLS1.2 backend

If your RHMAP is depoyed without TLS1.2 support, open as source  ```saml-ios-app/saml-ios-appr-Info.plist``` add the exception lines:

```
  <key>NSAppTransportSecurity</key>
  <dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
  </dict>
  ```
