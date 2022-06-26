import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';

class WebViewWidget extends StatefulWidget {
  final String? url;
  final String? title;
  final AppBar? appBar;
  final bool enableForward;
  final bool isHtmlTrue;
  const WebViewWidget(
      {Key? key,
      this.title,
      required this.url,
      this.appBar,
      this.enableForward = false,
      this.isHtmlTrue = false})
      : super(key: key);

  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar ??
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: const IconThemeData(color: Colors.black),
            title: Text(
              widget.title ?? '',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
            ),
            centerTitle: true,
          ),
      body: Builder(builder: (BuildContext context) {
        return SfPdfViewer.network(widget.url.toString());
      }),
    );
  }
}
