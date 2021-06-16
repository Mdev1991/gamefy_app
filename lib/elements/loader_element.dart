import 'package:flutter/material.dart';

Widget buildLoadingWidget() {
  return Center(
    child: Column(
      children: [
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.greenAccent[400]),
        ),
      ],
    ),
  );
}
