import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("./assets/images/splash.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Text(
              "Healthy food recipes",
              style: GoogleFonts.ptSans(
                textStyle: const TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "sharing flavors: uniting tastes through recipes.",
                  style: GoogleFonts.ptSans(
                    textStyle: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.topRight,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 253, 87),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ), // Adjust as needed
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: Text(
                    '5 ingredients',
                    style: GoogleFonts.ptSans(
                      textStyle: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            )),
            Expanded(
                child: Align(
              alignment: Alignment.topLeft,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 253, 87),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(0.0),
                  ), //  // Adjust as needed
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: Text(
                    '10 mins',
                    style: GoogleFonts.ptSans(
                      textStyle: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            )),
            Expanded(
                child: Align(
              alignment: Alignment.topRight,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 253, 87),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(20.0),
                  ), //  // Adjust as needed
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: Text(
                    'full of meat and vegan',
                    style: GoogleFonts.ptSans(
                      textStyle: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            )),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(
                          Color.fromARGB(255, 255, 253, 87)),
                      padding: WidgetStatePropertyAll(
                          EdgeInsets.fromLTRB(115.0, 15.0, 115.0, 15.0))),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Text(
                    'start now',
                    style: GoogleFonts.ptSans(
                      textStyle:
                          const TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                  )),
            )),
          ],
        ),
      ),
    );
  }
}
