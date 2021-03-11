import 'package:flutter/material.dart';
import 'package:pomodoro/ui/components/button_widget.dart';
import 'package:pomodoro/utils/colors.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _buttons() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: SimpleButton(
              text: 'Cadastre-se',
              textColor: ColorsModel.white,
              backgroundColor: ColorsModel.red,
            ),
          ),
          Flexible(
            child: SimpleButton(
              text: 'Faça login',
              textColor: ColorsModel.white,
              backgroundColor: ColorsModel.purple,
            ),
          ),
        ],
      );
    }

    _welcomeMessage() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Seja bem vindo ao \nPomodoro",
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Text(
                  "Você utilizará a tecnologia em um game divertido para focar no trabalho enquanto se exercita e mantém a saúde em dia.",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  textAlign: TextAlign.left),
            ),
          ],
        ),
      );
    }

    _imageAppLogo() {
      return Container(
          alignment: Alignment.center,
          height: 100,
          child: Image.network(
              'https://www.pngitem.com/pimgs/m/61-615463_transparent-ringing-alarm-clock-png-transparent-background-timer.png'));
    }

    return Scaffold(
      body: Container(
        color: ColorsModel.white,
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Stack(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 150),
                child: _imageAppLogo()),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 150,
                child: _welcomeMessage(),
              ),
            ),
            Align(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: _buttons(),
              ),
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      ),
    );
  }
}
