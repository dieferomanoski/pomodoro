import 'package:flutter/material.dart';
import 'package:pomodoro/ui/components/button_widget.dart';
import 'package:pomodoro/ui/pages/login/login_page.dart';
import 'package:pomodoro/ui/pages/signup/signup_page.dart';
import 'package:pomodoro/utils/assets.dart';
import 'package:pomodoro/utils/colors.dart';
import 'package:pomodoro/utils/push.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsModel.white,
        padding: EdgeInsets.only(left: 40, right: 40, top: 80, bottom: 40),
        child: Stack(
          children: [
            _imageAppLogo(),
            _welcomeMessage(),
            _buttons(context),
          ],
        ),
      ),
    );
  }

  _imageAppLogo() {
    return Align(
      alignment: Alignment.topCenter,
      child: Image.asset(
        AssetsModel.timerLogo,
        height: 200,
        width: 200,
      ),
    );
  }

  _welcomeMessage() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        height: 150,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Seja bem vindo ao \nPomodoro",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    fontFamily: 'Montserrat-SemiBold'),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                  "Você utilizará a tecnologia em um game divertido para focar no trabalho enquanto se exercita e mantém a saúde em dia.",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      fontFamily: 'Montserrat-Regular'),
                  textAlign: TextAlign.left),
            ),
          ],
        ),
      ),
    );
  }

  _buttons(context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: SimpleButton(
              onTap: (){
                push(context,SignUp());
              },
              text: 'Cadastre-se',
              textColor: ColorsModel.white,
              backgroundColor: ColorsModel.red,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Flexible(
            child: SimpleButton(
              onTap: () {
                push(context, Login());
              },
              text: 'Faça login',
              textColor: ColorsModel.white,
              backgroundColor: ColorsModel.purple,
            ),
          ),
        ],
      ),
    );
  }
}
