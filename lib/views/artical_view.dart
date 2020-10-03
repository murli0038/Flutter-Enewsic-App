import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticalView extends StatefulWidget {

  final String NewsUrl;

  ArticalView({this.NewsUrl});


  @override
  _ArticalViewState createState() => _ArticalViewState();
}

class _ArticalViewState extends State<ArticalView> {

  final Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("E",style: TextStyle(fontFamily: 'marafont'),),
            Text(
              "newsic",
              style: TextStyle(
                color: Colors.red,
                  fontFamily: 'marafont'
              ),)
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(
                icon: Icon(Icons.share),
                onPressed: (){
                  Share.share(widget.NewsUrl);
                },
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.NewsUrl,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
