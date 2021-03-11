import 'package:flutter/material.dart';
import 'package:pomodoro/ui/components/textfield_widget.dart';
import 'package:pomodoro/utils/colors.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
       
        
        body:_buildBody(context));
=======
        backgroundColor: ColorsModel.white, body: _buildBody(context));
>>>>>>> 1eefa19fe23e8a7aa4d98fe6c58f9a16c21b6fd2
  }

  _buildBody(context) {
    return ListView(
      children: [
        _buildTopIcon(),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.2,
        ),
        _buildGreetings(),
        _buildFormFields(context),
        _buildButtons(context),
      ],
    );
  }

<<<<<<< HEAD
    _buildTopIcon() {
     return Padding(
          padding: EdgeInsets.all(32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
            Icon(Icons.ac_unit)
          ],),
        );
   }
  
    _buildGreetings() {
     return Container(
          padding: EdgeInsets.only(left:60),
          child: Column(children: [
           Row(children: [
            Text("Olá my Friend!",style:TextStyle(fontSize: 28,fontWeight: FontWeight.bold,fontFamily: 'Montserrat-SemiBold')),
          ],),
          Row(children: [
            Text("Sentimos a sua Falta!",style:TextStyle(fontSize: 28,fontFamily: 'Montserrat-Regular')),
          ],),
          ]),
        );
   }
=======
  _buildTopIcon() {
    return Padding(
      padding: EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Icon(Icons.ac_unit)],
      ),
    );
  }
>>>>>>> 1eefa19fe23e8a7aa4d98fe6c58f9a16c21b6fd2

  _buildGreetings() {
    return Container(
      padding: EdgeInsets.only(left: 60),
      child: Column(children: [
        Row(
          children: [
            Text("Olá my Friend!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          children: [
            Text("Sentimos a sua Falta!", style: TextStyle(fontSize: 28)),
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
<<<<<<< HEAD
            Container(
              width: MediaQuery.of(context).size.width*0.7,
              child: AppText(
                "Insira seu e-mail", "E-mail"
               
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:16),
              width: MediaQuery.of(context).size.width*0.7,
              child: AppText(
                "Insira a sua Senha", "Senha"
              ),
            )



=======
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: AppText("Insira seu e-mail", "Digite seu melhor email!"),
          ),
          Container(
            padding: EdgeInsets.only(top: 16),
            width: MediaQuery.of(context).size.width * 0.7,
            child: AppText("Insira a sua Senha", ""),
          )
>>>>>>> 1eefa19fe23e8a7aa4d98fe6c58f9a16c21b6fd2
        ],
      ),
    );
  }

  _buildButtons(context) {
    return Container();
  }
}
