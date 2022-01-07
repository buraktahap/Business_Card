import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:business_card/profile_item.dart';
import 'package:mailto/mailto.dart';

void main() {
  runApp(const MyApp());
}

_makingPhoneCall(number) async {
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}

_whatsapp(number) async {
  await launch(
      "https://wa.me/$number?text=Hi, how are you?\n Can we meet sometimes?");
}

_mail(eMail) async {
  final mailtoLink = Mailto(
      to: ["$eMail"],
      subject: "mail example",
      body: "Nice app but needs some improvement.");
  await launch("$mailtoLink");
}

_instagram(username) async {
  await launch("https://www.instagram.com/$username/");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'business_card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'home page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Business Card",
            textAlign: TextAlign.right,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          const Expanded(
            flex: 2,
            child: CircleAvatar(
              radius: 105,
              backgroundImage: AssetImage("images/pp.jpg"),
            ),
          ),
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await _makingPhoneCall("+909090909090");
                    },
                    child: const ProfileItem(
                      title: "Call Me Maybe",
                      icon: Icons.call,
                    ),
                  ),
                  GestureDetector(
                      onTap: () async {
                        _whatsapp("+41798931892");
                      },
                      child: const ProfileItem(
                          title: "WhatsApp", icon: Icons.message)),
                  GestureDetector(
                    onTap: () async {
                      await _mail("test@test.com");
                    },
                    child: const ProfileItem(
                      title: "E-mail",
                      icon: Icons.mail,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        _instagram("instagram");
                      },
                      child: const ProfileItem(
                        title: "Instagram",
                        icon: Icons.camera,
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
