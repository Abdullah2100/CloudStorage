import 'package:cloudapp/View/Pages/Profile/clsProfileShape.dart';
import 'package:flutter/material.dart';

class clsSettingScrean extends StatefulWidget {
  const clsSettingScrean({super.key});

  @override
  State<clsSettingScrean> createState() => _clsSettingScreanState();
}

class _clsSettingScreanState extends State<clsSettingScrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(right: 15,top: 15,left: 14),
          child: Column(
            children: [
              clsProfileShape(context: context)
            ],
          ),
        ),
      ),
    );
  }
}
