# VisitKL Package

A Flutter package that provides a WebView to access the Visit Kuala Lumpur website.

## Features

- WebView integration to display https://visitkualalumpur.com/
- Loading indicator while the page is loading
- Refresh button to reload the page
- Fullscreen dialog option
- SSO token integration for authentication

## Requirements

### iOS

For iOS, you need to add the following to your Info.plist file:

```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
    <key>NSAllowsArbitraryLoadsInWebContent</key>
    <true/>
</dict>
```

### Android

For Android, ensure you have the INTERNET permission in your AndroidManifest.xml:

```xml
<uses-permission android:name="android.permission.INTERNET" />
```

## Usage

### Basic Usage

Simply include the VisitKL package in your app and navigate to the HomeScreen:

```dart
import 'package:visitkl/visitkl.dart';

// ...

Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const HomeScreen()),
);
```

### With SSO Token

You can pass an SSO token to the HomeScreen:

```dart
import 'package:visitkl/visitkl.dart';

// ...

// Direct instantiation
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => HomeScreen(ssoToken: 'your_sso_token')),
);

// Or using the start method
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => Visitkl.start(ssoToken: 'your_sso_token')),
);
```

### Using Get Navigation with SSO Token

```dart
import 'package:get/get.dart';
import 'package:dbklsso/dbklsso.dart';

// ...

// Navigate to the VisitKL module with SSO token
Get.toNamed('/visitkl?sso_token=${DBKLSSO.getSSOToken()}');
```

## Dependencies

- webview_flutter: ^4.10.0
- get: ^4.6.6
