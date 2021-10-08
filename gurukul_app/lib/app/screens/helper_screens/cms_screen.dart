import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gurukul_app/app/providers/serviceProvider.dart';
import 'package:gurukul_app/app/utils/constants.dart';
import 'package:gurukul_app/app/utils/enums.dart';
import 'package:gurukul_app/app/utils/no_data_found_view.dart';
import 'package:gurukul_app/app/views/loading_small.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CMSScreen extends StatefulWidget {

  CMSScreen({required this.type});

  final CMSType type;

  @override
  _CMSScreenState createState() => _CMSScreenState();
}

class _CMSScreenState extends State<CMSScreen> {
  String get screenTitle {
    switch(widget.type){
      case CMSType.privacyPolicy:
        return 'Privacy Policy';
      case CMSType.terms:
        return 'Terms & Conditions';
      case CMSType.aboutUs:
        return 'About Us';
      default:
        return 'Nope';
    }
  }

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    // get_cms_pages

    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  loadHTMLContent(String htmlContent) async {
    final String contentBase64 =
    base64Encode(const Utf8Encoder().convert(htmlContent));

    final controller = await _controller.future;

    await controller.loadUrl('data:text/html;base64,$contentBase64');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
      ),
      body: SafeArea(
        child: buildWebView(),
      ),
    );
  }

  Widget buildWebView() {
    final provider = Provider.of<ServiceProviderImpl>(context);

    final htmlString = provider.cmsRes?.data?.data?.dataDetails ?? "";

    switch(provider.cmsRes?.state){
      case Status.LOADING:
        return Center(child: LoadingSmall(color: kPrimaryColor,));
      case Status.COMPLETED:
        return WebView(
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
              loadHTMLContent("""<!DOCTYPE html>
    <html>
      <head><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
      <body style='"margin: 0; padding: 0;'>
        <div>
          $htmlString
        </div>
      </body>
    </html>""");
            },
            onProgress: (int progress) {
              print("WebView is loading (progress : $progress%)");
            },
            navigationDelegate: (NavigationRequest request)  {
              if(request.url.contains("mailto:") || request.url.contains("tel:")) {
                try{
                  launch(request.url);
                }catch(e){
                  print(e);
                }
                return NavigationDecision.prevent;
              }
              if (request.url.startsWith('https://www.youtube.com/')) {
                print('blocking navigation to $request}');
                return NavigationDecision.prevent;
              }
              print('allowing navigation to $request');
              return NavigationDecision.navigate;
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            }
        );
      case Status.ERROR:
        return Center(child: NoDataFoundView());
      case Status.UNAUTHORISED:
        // TODO: Handle this case.
        break;
      default:
        break;
    }
    return Container(
      color: Colors.white,
    );
  }
}

enum CMSType{
  privacyPolicy,
  terms,
  aboutUs
}