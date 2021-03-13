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
import 'package:pomodoro/utils/push.dart';

class SignUp extends StatelessWidget {

  TextEditingController _tName = new TextEditingController();
  TextEditingController _tEmail = new TextEditingController();
  TextEditingController _tPassword = new TextEditingController();
  

  @override
  Widget build(BuildContext context) {
     

    return Scaffold(body: _buildBody(context),backgroundColor: Colors.white);
  }

  _buildBody(context) {
    return ListView(
      children: [
        _buildTopIcon(),
        _buildGreetings(),
        _buildFormFields(context),
        _buildButtons(context),
      ],
    );
  }

  _buildTopIcon() {
    return Padding(
      padding: EdgeInsets.only(top:32,left: 32,right: 32,bottom: 0),
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
      Text("Seja bem vindo.",
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat-SemiBold')),
            ],
          ),
          Row(
      children: [
        Text("Estamos muito felizes \nem ter você no nosso\nApp!",
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
            width: MediaQuery.of(context).size.width * 0.65,
            child: AppText("Nome", "Insira seu nome",controller: _tName,),
          ),
          Container(
            padding: EdgeInsets.only(top: 14),
            width: MediaQuery.of(context).size.width * 0.65,
            child: AppText("Insira seu melhor e-mail", "E-mail",controller: _tEmail,),
          ),
          Container(
            padding: EdgeInsets.only(top: 14),
            width: MediaQuery.of(context).size.width * 0.65,
            child: AppText("Insira a sua Senha", "Senha",password: true,controller: _tPassword,),
          )
        ],
      ),
    );
  }

  _buildButtons(context) {
    return Column(
      children: [
        Container(
         
            padding: EdgeInsets.only(top: 32),
            width: MediaQuery.of(context).size.width * 0.65,
            child: Container(
                 height: 50,
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
                    signUp(_tName.text,_tEmail.text,_tPassword.text);
                  },
                  text: "Fazer Cadastro",
                  backgroundColor: ColorsModel.purple,
                  textColor: Colors.white,
                ))),
        Container(
            padding: EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width * 0.65,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.65,
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
                text: "Cadastrar com o google",
                textStyle: TextStyle(fontFamily: 'Montserrat-Regular',color: Colors.black87),
                borderRadius: 16,
                onPressed: () {signUpWithGoogle(context);},
                darkMode: false,
                iconStyle: AuthIconStyle.outlined,
              ),
            )),
      ],
    );
  }
}

signUp(name,email,password) async {

  await Firebase.initializeApp();
  ApiResponse response = await AuthService().signUp(name, email, password);
  if(response.ok) { 
    print("DEU CERTO!!!");
    
  }
  else { 
    print("erro");
  }
  
}

signUpWithGoogle(context) async {

  await Firebase.initializeApp();
  ApiResponse response = await AuthService().loginGoogle();
  if(response.ok) { 
    print("deu certo");
  }else {
    print(response.msg);
  }
  
}
