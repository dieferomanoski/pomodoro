import 'package:flutter/material.dart';
import 'package:pomodoro/stores/home_store.dart';
import 'package:pomodoro/ui/components/button_widget.dart';
import 'package:pomodoro/utils/assets.dart';
import 'package:pomodoro/utils/colors.dart';

class Challenge extends StatelessWidget {
  final String exp;
  final String challengeTitle;
  final String challengeMessage;
  final String challengeType;

  const Challenge(
      {Key key,
      this.exp,
      this.challengeTitle,
      this.challengeMessage,
      this.challengeType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homeStore = HomeStore();
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(1, 2), // changes position of shadow
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Ganhe $exp xp",
                      style: TextStyle(
                        fontSize: 15,
                        color: ColorsModel.secundaryTitleColor,
                        fontFamily: 'Montserrat-SemiBold',
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 2,
                      color: ColorsModel.grey,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      AssetsModel.challenge1,
                      height: 80,
                    ),
                    Text(
                      "$challengeTitle\n",
                      style: TextStyle(
                        fontSize: 20,
                        color: ColorsModel.primaryTitleColor,
                        fontFamily: 'Montserrat-SemiBold',
                      ),
                    ),
                    Text(
                      "$challengeMessage",
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorsModel.textColor,
                        fontFamily: 'Montserrat-SemiBold',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SimpleButton(
                        text: 'Falhei',
                        textColor: ColorsModel.white,
                        backgroundColor: ColorsModel.red,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Flexible(
                      child: SimpleButton(
                        text: 'Aceitar',
                        textColor: ColorsModel.white,
                        backgroundColor: ColorsModel.green,
                        onTap: _homeStore.changeExp(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
