import 'package:flutter/material.dart';

Widget buildSliderLoadWidget() {
  return Center(
    child: Column(
      children: [
        LinearProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.greenAccent[400]),
        ),
      ],
    ),
  );
}
