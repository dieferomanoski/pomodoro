import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/stores/home_store.dart';

import 'package:pomodoro/ui/pages/home/widgets/challenge.dart';
import 'package:pomodoro/utils/assets.dart';
import 'package:pomodoro/utils/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _homeStore = HomeStore();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 30, top: 50, right: 30),
        child: Column(
          children: [
            _userStats(),
            _experienceProgressBar(),
            _completedChallenges(),
            Observer(builder: (_) {
              return Challenge(
                exp: _homeStore.exp,
                challengeTitle: 'Exercite-se',
                challengeMessage:
                    'É agora Rockzao, bora lá meu parça. Caminhe por 3 minutos e estique suas pernas pra você ficar saudável.',
              );
            })
          ],
        ),
      ),
    );
  }

  _userStats() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: 100,
      child: Row(
        children: [
          //! AVATAR
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 6, color: Colors.grey[400], spreadRadius: 3)
              ],
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/236x/8c/64/26/8c64262a4fb4c1d5d0fe392867c65ee9.jpg'),
              radius: 45,
            ),
          ),
          //! USERNAME
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Rock Lee",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: ColorsModel.primaryTitleColor,
                fontFamily: 'Montserrat-SemiBold',
              ),
            ),
          ),
          //! LEVEL
          Row(
            children: [
              Text(
                "Level 1",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: ColorsModel.primaryTitleColor,
                  fontFamily: 'Montserrat-SemiBold',
                ),
              ),
              Container(
                  child: Image.asset(
                AssetsModel.arrow_level,
                height: 30,
              )),
            ],
          ),
        ],
      ),
    );
  }

  _experienceProgressBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: LinearProgressIndicator(
        backgroundColor: Colors.grey,
        valueColor: AlwaysStoppedAnimation<Color>(ColorsModel.green),
        value: 0.6,
      ),
    );
  }

  _completedChallenges() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Desafios completos",
                style: TextStyle(
                  fontSize: 15,
                  color: ColorsModel.textColor,
                  fontFamily: 'Montserrat-SemiBold',
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "00",
                style: TextStyle(
                  fontSize: 18,
                  color: ColorsModel.textColor,
                  fontFamily: 'Montserrat-SemiBold',
                ),
              ),
            ),
          ],
        ),
        Divider(
          height: 2,
          color: ColorsModel.grey,
        )
      ],
    );
  }
}
