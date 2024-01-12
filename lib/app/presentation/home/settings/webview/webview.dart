import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  late InAppWebViewController _webViewController;
  double _proGress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri.uri(Uri.parse('https://neonapps.co/')),
              ),
              onWebViewCreated: (InAppWebViewController controller) {
                _webViewController = controller;
              },
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                setState(() {
                  _proGress = progress / 100;
                });
              },
            ),
            _proGress < 1
                ? LinearProgressIndicator(
                    color: const Color(0xFF535FD8),
                    value: _proGress,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  void refreshPage() {
    _webViewController.reload();
  }
}
