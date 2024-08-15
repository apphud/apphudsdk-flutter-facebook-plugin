import 'package:apphud_facebook_sdk/apphud_facebook_data.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:apphud_facebook_sdk/apphud_facebook_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ApphudFacebookData? _data;
  final _apphudFacebookSdkPlugin = ApphudFacebookSdk();

  @override
  void initState() {
    super.initState();
    init();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> init() async {
    ApphudFacebookData? data;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      data = await _apphudFacebookSdkPlugin.getFacebookData();
    } on PlatformException {
      // ignore
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: _data == null
              ? const Text('Facebook data has not been fetched yet')
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('anonID: ${_data?.anonId}'),
                      const SizedBox(height: 20),
                      Text('extInfo: ${_data?.extInfo}'),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
