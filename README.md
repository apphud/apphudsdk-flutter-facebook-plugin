<p align="center">
<img src="https://apphud.com/images/logo-header.svg" alt="Apphud" width="50%" height="50%"/>
 </p>

## Greetings!

Apphud Facebook SDK is an open-source library for iOS and Android to integrate Apphud Flutter SDK with Facebook.

<p align="center">
<img src="https://apphud.com/images/greetings.webp" width="30%" height="30%" />
</p>

## Integrations

## Setting things up

You must first create an app at Facebook for developers: https://developers.facebook.com/

1. Get your app id (referred to as `[APP_ID]` below)
2. Get your client token (referred to as `[CLIENT_TOKEN]` below).
   See "[Facebook Doc: Client Tokens](https://developers.facebook.com/docs/facebook-login/guides/access-tokens#clienttokens)" for more information and how to obtain it.


### Configure Android

Read through the "[Getting Started with App Events for Android](https://developers.facebook.com/docs/app-events/getting-started-app-events-android)" tutorial and in particular, follow [step 3](https://developers.facebook.com/docs/app-events/getting-started-app-events-android#step-3--integrate-the-facebook-sdk-in-your-android-app) by adding the following into `android/app/src/main/res/values/strings.xml` (or into respective `debug` or `release` build flavor)

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
  <string name="facebook_app_id">[APP_ID]</string>
  <string name="facebook_client_token">[CLIENT_TOKEN]</string>
</resources>
```

After that, add that string resource reference to your main `AndroidManifest.xml` file, directly under the `<application>` tag.

```xml
<application android:label="@string/app_name" ...>
    ...
   	<meta-data android:name="com.facebook.sdk.ApplicationId" android:value="@string/facebook_app_id"/>
   	<meta-data android:name="com.facebook.sdk.ClientToken" android:value="@string/facebook_client_token"/>
    ...
</application>
```

### Configure iOS

Read through the "[Getting Started with App Events for iOS](https://developers.facebook.com/docs/app-events/getting-started-app-events-ios)" tutorial and in particular, follow [step 5](https://developers.facebook.com/docs/app-events/getting-started-app-events-ios#step-5--configure-your-project) by opening `info.plist` "As Source Code" and add the following

- If your code does not have `CFBundleURLTypes`, add the following just before the final `</dict>` element:

```xml
<key>CFBundleURLTypes</key>
<array>
  <dict>
  <key>CFBundleURLSchemes</key>
  <array>
    <string>fb[APP_ID]</string>
  </array>
  </dict>
</array>
<key>FacebookAppID</key>
<string>[APP_ID]</string>
<key>FacebookClientToken</key>
<string>[CLIENT_TOKEN]</string>
<key>FacebookDisplayName</key>
<string>[APP_NAME]</string>
```

- If your code already contains `CFBundleURLTypes`, insert the following:

```xml
<array>
 <dict>
 <key>CFBundleURLSchemes</key>
 <array>
   <string>fb[APP_ID]</string>
 </array>
 </dict>
</array>
<key>FacebookAppID</key>
<string>[APP_ID]</string>
<key>FacebookClientToken</key>
<string>[CLIENT_TOKEN]</string>
<key>FacebookDisplayName</key>
<string>[APP_NAME]</string>
```
