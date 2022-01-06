import 'package:flutter/material.dart';
import 'package:zendesk_sdk_flutter/zendesk_messaging.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String androidChannelKey =
      '';
  final String iosChannelKey =
      '';

  @override
  void initState() {
    super.initState();
    ZendeskMessaging.initialize(
      androidChannelKey: androidChannelKey,
      iosChannelKey: iosChannelKey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Zendesk Messaging Example'),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                const BoxShadow(
                  color: Colors.grey,
                  offset: Offset(2.0, 2.0),
                )
              ],
            ),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      print("tap");
                      ZendeskMessaging.show();
                    },
                    child: Text("Messaging")),
                ElevatedButton(
                    onPressed: () {
                      // ZendeskMessaging.invalidate();
                    },
                    child: Text("invalidate")),
                ElevatedButton(
                    onPressed: () {
                      /*ZendeskMessaging.initialize(
                        androidChannelKey: androidChannelKey,
                        iosChannelKey: iosChannelKey,
                      );*/
                    },
                    child: Text("init"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
