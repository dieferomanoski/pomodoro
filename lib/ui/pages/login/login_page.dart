import 'package:flutter/material.dart';
import 'package:pomodoro/ui/components/textfield_widget.dart';
import 'package:pomodoro/utils/colors.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        
        body:_buildBody(context));
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

  

  _buildFormFields(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        children: [
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



        ],
      ),
    );
  }

  _buildButtons(context) {
    return Container();
  }
}
