import 'package:auth_buttons/res/buttons/google_auth_button.dart';
import 'package:auth_buttons/res/shared/auth_button.dart';
import 'package:auth_buttons/res/shared/auth_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/firebase/firebase_auth.dart';
import 'package:pomodoro/services/api_response.dart';
import 'package:pomodoro/ui/components/button_widget.dart';
import 'package:pomodoro/ui/components/textfield_widget.dart';
import 'package:pomodoro/utils/assets.dart';
import 'package:pomodoro/utils/colors.dart';

class Login extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(body: _buildBody(context),backgroundColor: Colors.white);
  }

  _buildBody(context) {
    return ListView(
      children: [
        _buildTopIcon(),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.15,
        ),
        _buildGreetings(),
        _buildFormFields(context),
        _buildButtons(context),
      ],
    );
  }

  _buildTopIcon() {
    return Padding(
      padding: EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Image.asset(AssetsModel.timerLogo,width: 50,height: 50,)],
      ),
    );
  }

  _buildGreetings() {
    return Container(
      padding: EdgeInsets.only(left: 60),
      child: Column(children: [
        Row(
          children: [
            Text("Olá my Friend!",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat-SemiBold')),
          ],
        ),
        Row(
          children: [
            Text("Sentimos a sua Falta!",
                style:
                    TextStyle(fontSize: 28, fontFamily: 'Montserrat-Regular')),
          ],
        ),
      ]),
    );
  }

  _buildFormFields(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: AppText("Insira seu e-mail", "E-mail"),
          ),
          Container(
            padding: EdgeInsets.only(top: 14),
            width: MediaQuery.of(context).size.width * 0.7,
            child: AppText("Insira a sua Senha", "Senha",password: true,),
          )
        ],
      ),
    );
  }

  _buildButtons(context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(top: 18),
            width: MediaQuery.of(context).size.width * 0.7,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500],
                        offset: Offset(3, 5),
                        blurRadius: 5,
                      )
                    ]),
                child: SimpleButton(
                  onTap: () { 
                    emlLogin();
                  },
                  text: "Logar",
                  backgroundColor: ColorsModel.purple,
                  textColor: Colors.white,
                ))),
        Container(
            padding: EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width * 0.7,
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400],
                      offset: Offset(3, 5),
                      blurRadius: 5,
                    )
                  ]),
              child: GoogleAuthButton(
                iconSize: 20,
                text: "Logar com o google",
                textStyle: TextStyle(fontFamily: 'Montserrat-Regular',color: Colors.black87),
                borderRadius: 16,
                onPressed: () {googleLogin();},
                darkMode: false,
                iconStyle: AuthIconStyle.outlined,
              ),
            )),
      ],
    );
  }
}

emlLogin() async {

  await Firebase.initializeApp();
  ApiResponse response = await AuthService().login('alessandrovaiz@gmail.com', 'admin123');
  if(response.ok) { 
    print("DEU CERTO!!!");
    
  }
  
}

googleLogin() async {

  await Firebase.initializeApp();
  ApiResponse response = await AuthService().loginGoogle();
  if(response.ok) { 
    print("DEU CERTO!!!");
  }else {
    print(response.msg);
  }
  
}
