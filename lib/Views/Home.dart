import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flutter",
              style: GoogleFonts.nunito(fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w600, color: Colors.red),
            ),
          ],
        ),
        elevation: 0,
      ),
    );
  }
}
