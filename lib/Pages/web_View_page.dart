import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewPage extends StatelessWidget {
  late WebViewController _webViewController;
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.facebook.com/FHFahim00/videos/210223798591964?idorvanity=215182494583907')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://www.facebook.com/FHFahim00/videos/210223798591964?idorvanity=215182494583907'));
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          body: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse("https://www.youtube.com/watch?v=nZIR2kWqj48")), 
            onWebViewCreated: ((InAppWebViewController controller) {
 _webViewController = controller as WebViewController; 
            }),
          )
          
          
          ),
    );
  }
}
