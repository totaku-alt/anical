import 'package:anical/views/start_view.dart';
import 'package:flutter/material.dart';

class ResultView extends StatefulWidget {
  final dynamic result;
  final String valueNameOne;
  final String valueNameTwo;

  const ResultView(
      {Key? key,
      required this.result,
      required this.valueNameOne,
      required this.valueNameTwo})
      : super(key: key);

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  final shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(60),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 150,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(7, 8),
                    )
                  ]),
              height: 350,
              width: 350,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 3,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Text(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 80,
                            color: Color.fromARGB(255, 47, 193, 147),
                          ),
                          '${widget.result.toStringAsFixed(2)}'),
                    ),
                    Text(
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(66, 70, 86, 1),
                        ),
                        '${widget.valueNameOne}'),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                        style: TextStyle(
                          fontSize: 56,
                          color: Color.fromRGBO(66, 70, 86, 1),
                        ),
                        '${(widget.result / 60).toStringAsFixed(3)}'),
                    Text(
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(66, 70, 86, 1),
                        ),
                        '${widget.valueNameTwo}'),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset(0.5, 0.93),
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.replay,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(365, 52),
                  shape: shape,
                  primary: const Color.fromRGBO(0, 143, 248, 1),
                  onPrimary: const Color.fromRGBO(255, 255, 255, 1),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                label: Text(
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    'Neue Rechnung'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
