import 'package:anical/constants/colors.dart';
import 'package:anical/constants/title_subtitle.dart';
import 'package:anical/views/result_view.dart';
import 'package:anical/views/start_view.dart';
import 'package:flutter/material.dart';

class MikrogrammView extends StatefulWidget {
  const MikrogrammView({Key? key}) : super(key: key);

  @override
  State<MikrogrammView> createState() => _MikrogrammViewState();
}

class _MikrogrammViewState extends State<MikrogrammView> {
  final shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(60),
  );

  var colorStateButton1 = const Color.fromRGBO(66, 70, 86, 1);
  var colorStateButton2 = const Color.fromRGBO(255, 255, 255, 1);

  bool isMicrogramKgHVisible = true;
  bool isMlHVisible = false;

  late final kilogramController = TextEditingController();
  late final microgramPerMilliLitersController = TextEditingController();
  late final milliLitersPerHourController = TextEditingController();
  late final miligramPerKilogramPerHourController = TextEditingController();

  String kilogramm = '';
  String microgramPerMilliLiters = '';
  String milliLitersPerHour = '';

  double kilogramAsInt = 0;
  double microgramPerMilliLitersAsInt = 0;
  double milliLitersPerHourAsInt = 0;

  late double result;
  final String valueNameMikrogrammHour = 'µg/kg/h';
  final String valueNameMikrogrammMin = 'µg/kg/min';

  final String valueNameMikrogrammMlHour = 'ml/h';
  final String valueNameMikrogrammMlMin = 'ml/min';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Color.fromRGBO(66, 70, 86, 1),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 105,
                ),
                titles('AniCal'),
                subtitle('Berechne die Laufzeit in\nµg/kg/h, oder ml/h.'),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: colorStateButton2,
                        backgroundColor: colorStateButton1,
                        shape: shape,
                        minimumSize: const Size(160, 40),
                        side: const BorderSide(
                            width: 1.5, color: Color.fromRGBO(66, 70, 86, 1)),
                      ),
                      onPressed: () {
                        setState(
                          () {
                            colorStateButton2 =
                                const Color.fromRGBO(255, 255, 255, 1);
                            colorStateButton1 =
                                const Color.fromRGBO(66, 70, 86, 1);
                            isMicrogramKgHVisible = true;
                            isMlHVisible = false;
                          },
                        );
                      },
                      child: const Text(
                        'µg/kg/h',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: colorStateButton1,
                        backgroundColor: colorStateButton2,
                        shape: shape,
                        minimumSize: const Size(160, 40),
                        side: const BorderSide(
                          width: 1.5,
                          color: Color.fromRGBO(66, 70, 86, 1),
                        ),
                      ),
                      onPressed: () {
                        setState(
                          () {
                            colorStateButton2 =
                                const Color.fromRGBO(66, 70, 86, 1);
                            colorStateButton1 =
                                const Color.fromRGBO(255, 255, 255, 1);
                            isMicrogramKgHVisible = false;
                            isMlHVisible = true;
                          },
                        );
                      },
                      child: const Text(
                        'ml/h',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: kilogramController,
                        onChanged: (value) => setState(() => {
                              kilogramm = value,
                              //kilogramController.text = value.toString()
                            }),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'kg',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: microgramPerMilliLitersController,
                        onChanged: (value) =>
                            setState(() => microgramPerMilliLiters = value),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'µg/ml',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Visibility(
                        visible: isMicrogramKgHVisible,
                        child: TextField(
                          controller: milliLitersPerHourController,
                          onChanged: (value) => setState(() => {
                                milliLitersPerHour = value,
                                // milliLitersPerHourController.text = value.toString()
                              }),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            labelText: 'ml/h',
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isMlHVisible,
                        child: TextField(
                          controller: milliLitersPerHourController,
                          onChanged: (value) => setState(() => {
                                milliLitersPerHour = value,
                                // milliLitersPerHourController.text = value.toString()
                              }),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            labelText: 'µg/kg/h',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.white10,
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 16,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    minimumSize: const Size(365, 52),
                    shape: shape,
                    primary: buttonPrimaryColor,
                    onPrimary: textWhiteColor),
                onPressed: () {
                  getResult();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ResultView(
                      result: result,
                      valueNameOne: isMlHVisible
                          ? valueNameMikrogrammMlHour
                          : valueNameMikrogrammHour,
                      valueNameTwo: isMlHVisible
                          ? valueNameMikrogrammMlMin
                          : valueNameMikrogrammMin,
                    ),
                  ));
                },
                child: const Text(
                  'Berechnen',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          )),
    );
  }

  getResult() {
    var kilogramAsInt = double.parse(kilogramm.replaceAll(',', '.'));
    var milligramPerMilliLitersAsInt =
        double.parse(microgramPerMilliLiters.replaceAll(',', '.'));
    var milliLitersPerHourAsInt =
        double.parse(milliLitersPerHour.replaceAll(',', '.'));

    if (isMlHVisible == true) {
      result = (kilogramAsInt * milliLitersPerHourAsInt) /
          milligramPerMilliLitersAsInt;
    } else {
      result = (milliLitersPerHourAsInt * milligramPerMilliLitersAsInt) /
          kilogramAsInt;
    }
  }
}
