import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(title: 'Contador de pessoas', home: Home()));
}

class ImageGradient extends StatelessWidget {
  const ImageGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          "images/restaurante.jpeg",
          fit: BoxFit.fill,
        ),
        const DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.bottomCenter,
                    end: FractionalOffset.topCenter,
                    colors: [
              Colors.black,
              Colors.black54,
            ]))),
      ],
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int peopleQuantity = 0;
  String message = "Pode entrar!";

  void _changePeopleQuantity(int value) {
    setState(() {
      peopleQuantity += value;

      if (peopleQuantity >= 20) {
        message = "Lotado, não pode entrar.";
        peopleQuantity = 20;
      } else if (peopleQuantity < 0) {
        message = "Pode entrar!";
        peopleQuantity = 0;
      } else {
        message = "Pode entrar!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        const ImageGradient(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: width * .9,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    message,
                    style: GoogleFonts.raleway(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text("Pessoas: $peopleQuantity",
                      style: GoogleFonts.workSans(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 4, color: Colors.white),
                        padding: const EdgeInsets.all(16.0),
                        minimumSize: Size(width * 0.4, height * 0.4),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16)))),
                    onPressed: (() {
                      _changePeopleQuantity(1);
                    }),
                    child: const Icon(Icons.person_add_rounded,
                        color: Colors.white, size: 48)),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 4, color: Colors.white),
                        padding: const EdgeInsets.all(16.0),
                        minimumSize: Size(width * 0.4, height * 0.4),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16)))),
                    onPressed: (() {
                      _changePeopleQuantity(-1);
                    }),
                    child: const Icon(Icons.person_remove_rounded,
                        color: Colors.white, size: 48))
              ],
            )
          ],
        )
      ],
    );
  }
}
