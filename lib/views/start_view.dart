import 'package:anical/constants/colors.dart';
import 'package:anical/constants/title_subtitle.dart';
import 'package:anical/views/mikrogramm_view.dart';
import 'package:anical/views/milligramm_view.dart';
import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  final keyIsFirstLoaded = 'is_first_loaded';

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final keyIsFirstLoaded = 'is_first_loaded';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      feedbackDialog();
    });
  }

  Future<dynamic> feedbackDialog() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
    if (isFirstLoaded == null) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Feedback'),
          content: const Text(
            'Wenn Du Ideen zur Verbesserung, oder Funktionserweiterung der App hast, melde Dich gern unter totakudesign@gmail.com!',
          ),
          actions: [
            TextButton(
              onPressed: () {
                //if (!mounted) return;
                Navigator.of(context).pop();
                prefs.setBool(keyIsFirstLoaded, false);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 80,
          ),
          titles('AniCal'),
          subtitle('Anästhesie Perfusorenrechner'),
          const SizedBox(
            height: 80,
          ),
          Align(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MilligrammView(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                backgroundColor: buttonPrimaryColor,
                minimumSize: const Size(120, 120),
                shape: const CircleBorder(),
                elevation: 2.5,
                shadowColor: textPrimaryColor,
              ),
              child: const Text(
                'mg',
                style: TextStyle(
                  color: textWhiteColor,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Align(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MikrogrammView(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    backgroundColor: buttonPrimaryColor, // 255, 56, 101, 166
                    minimumSize: const Size(120, 120),
                    shape: const CircleBorder(),
                    elevation: 2.5,
                    shadowColor: textPrimaryColor),
                child: const Text(
                  'µg',
                  style: TextStyle(
                    color: textWhiteColor,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white10,
        elevation: 0.0,
        child: TextButton.icon(
          onPressed: sendMail,
          icon: const Icon(Icons.feedback_outlined),
          label: const Text('Feedback'),
        ),
      ),
    );
  }

  void sendMail() async {
    EmailContent email = EmailContent(
      to: [
        'totakudesign@gmail.com',
      ],
      subject: 'Hey, ich hab Feedback zu AniCal',
    );

    OpenMailAppResult result = await OpenMailApp.composeNewEmailInMailApp(
        nativePickerTitle: 'Select email app to compose', emailContent: email);
    if (!result.didOpen && !result.canOpen) {
      showNoMailAppsDialog(context);
    } else if (!result.didOpen && result.canOpen) {
      showDialog(
        context: context,
        builder: (_) => MailAppPickerDialog(
          mailApps: result.options,
          emailContent: email,
        ),
      );
    }
  }

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Open Mail App"),
          content: const Text("No mail apps installed"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
