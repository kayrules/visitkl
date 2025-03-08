import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';
import 'fullscreen_dialog.dart';

class HomeScreen extends StatefulWidget {
  final String? ssoToken;

  const HomeScreen({super.key, this.ssoToken});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late final WebViewController controller;
  bool isLoading = true;
  String? ssoToken;

  @override
  void initState() {
    super.initState();

    // Get SSO token from widget or from Get parameters
    ssoToken = widget.ssoToken ?? Get.parameters['sso_token'];

    if (ssoToken != null) {
      print('SSO Token received: ${ssoToken!.substring(0, 10)}...');
    }

    // Initialize the WebViewController
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });

            // If we have an SSO token, we can inject it into the webpage if needed
            if (ssoToken != null) {
              injectSSOToken();
            }
          },
          onWebResourceError: (WebResourceError error) {
            print('WebView error: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse('https://visitkualalumpur.com/'));
  }

  // Function to inject the SSO token into the webpage if needed
  void injectSSOToken() {
    if (ssoToken == null) return;

    // Example of how to inject the token into localStorage
    // You can modify this based on how the website needs to use the token
    controller.runJavaScript('''
      try {
        localStorage.setItem('sso_token', '$ssoToken');
        console.log('SSO token injected successfully');
      } catch (e) {
        console.error('Failed to inject SSO token: ' + e);
      }
    ''');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visit Kuala Lumpur'),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFFDC3263),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              controller.reload();
            },
          ),
          IconButton(
            icon: const Icon(Icons.fullscreen),
            onPressed: () {
              Get.to(
                () => const FullscreenDialog(),
                fullscreenDialog: true,
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFDC3263),
              ),
            ),
        ],
      ),
    );
  }
}
