import 'package:anical/constants/colors.dart';
import 'package:anical/views/result_view.dart';
import 'package:anical/views/start_view.dart';
import 'package:flutter/material.dart';
import 'package:anical/constants/title_subtitle.dart';

class MilligrammView extends StatefulWidget {
  const MilligrammView({
    Key? key,
  }) : super(key: key);

  @override
  State<MilligrammView> createState() => _MilligrammViewState();
}

class _MilligrammViewState extends State<MilligrammView> {
  final shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(60),
  );
  var colorStateButton1 = const Color.fromRGBO(66, 70, 86, 1);
  var colorStateButton2 = const Color.fromRGBO(255, 255, 255, 1);

  bool isMgKgHVisible = true;
  bool isMlHVisible = false;
  bool _validate = false;

  late final kilogramController = TextEditingController();
  late final milligramPerMilliLitersController = TextEditingController();
  late final milliLitersPerHourController = TextEditingController();
  late final miligramPerKilogramPerHourController = TextEditingController();

  String kilogramm = '';
  String milligramPerMilliLiters = '';
  String milliLitersPerHour = '';

  double kilogramAsInt = 0;
  double milligramPerMilliLitersAsInt = 0;
  double milliLitersPerHourAsInt = 0;
  late double result;
  final String valueNameMgHour = 'mg/kg/h';
  final String valueNameMgMin = 'mg/kg/min';

  final String valueNameMilligrammMlHour = 'ml/h';
  final String valueNameMilligrammMlMin = 'ml/min';

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
              color: textPrimaryColor,
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
              subtitle('Berechne die Laufzeit in\nmg/kg/h, oder ml/h.'),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: colorStateButton2, backgroundColor: colorStateButton1,
                      shape: shape,
                      minimumSize: const Size(160, 40),
                      side: const BorderSide(
                        width: 1.5,
                        color: textPrimaryColor,
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          colorStateButton2 =
                              const Color.fromRGBO(255, 255, 255, 1);
                          colorStateButton1 =
                              const Color.fromRGBO(66, 70, 86, 1);
                          isMgKgHVisible = true;
                          isMlHVisible = false;
                        },
                      );
                    },
                    child: const Text(
                      'mg/kg/h',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: colorStateButton1, backgroundColor: colorStateButton2,
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
                          isMgKgHVisible = false;
                          isMlHVisible = true;
                        },
                      );
                    },
                    child: const Text(
                      'ml/h',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
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
                      onChanged: (value) => setState(
                        () => {
                          kilogramm = value,
                        },
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'kg',
                        errorText:
                            _validate ? 'Bitte gebe einen Wert ein' : null,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: milligramPerMilliLitersController,
                      onChanged: (value) =>
                          setState(() => milligramPerMilliLiters = value),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'mg/ml',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Visibility(
                      visible: isMgKgHVisible,
                      child: TextField(
                        controller: milliLitersPerHourController,
                        onChanged: (value) => setState(() => milliLitersPerHour = value,),
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
                        onChanged: (value) => setState(
                          () => milliLitersPerHour = value,),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          labelText: 'mg/kg/h',
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
                foregroundColor: textWhiteColor, backgroundColor: buttonPrimaryColor, splashFactory: NoSplash.splashFactory,
                minimumSize: const Size(365, 52),
                shape: shape,
              ),
              onPressed: () {
                getResult();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ResultView(
                    result: result,
                    valueNameOne: isMlHVisible
                        ? valueNameMilligrammMlHour
                        : valueNameMgHour,
                    valueNameTwo: isMlHVisible
                        ? valueNameMilligrammMlMin
                        : valueNameMgMin,
                  ),
                ));
              },
              child: const Text(
                'Berechnen',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }

  getResult() {
    var kilogramAsInt = double.parse(kilogramm.replaceAll(',', '.'));
    var milligramPerMilliLitersAsInt =
        double.parse(milligramPerMilliLiters.replaceAll(',', '.'));
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

  checkIsEmpty() {
    if (kilogramm.isEmpty) {
      _validate = true;
    } else {
      _validate = false;
    }
  }
}
