import 'package:flutter/material.dart';
import 'package:igdb/bloc/get_slider_bloc.dart';
import 'package:igdb/elements/error_element.dart';
import 'package:igdb/elements/loader_element.dart';
import 'package:igdb/model/game.dart';
import 'package:igdb/model/game_response.dart';
import 'package:igdb/style/theme.dart' as Style;
import 'package:page_indicator/page_indicator.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({key}) : super(key: key);
  static const Color backgroundColor = const Color(0XFF37474F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://uploaddeimagens.com.br/images/003/290/917/thumb/1677b46b6ce14772be144dc9628c7a6f.png?1623855798"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
