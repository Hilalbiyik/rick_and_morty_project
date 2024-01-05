import 'package:flutter/material.dart';
import 'package:my_api_task/model/character.dart';
import 'package:my_api_task/theme/app_color.dart';

class DetailPage extends StatelessWidget {
  Character character;
  DetailPage(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundDark,
          title: Text(
            ConstantsAdress.detailappTitle,
            style: TextStyle(color: AppColor.lighttextColor),
          ),
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: AppColor.backgroundDark,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Image.network(
                  character.image,
                )),
                Text(
                  character.name,
                  style:
                      TextStyle(color: AppColor.lighttextColor, fontSize: 25),
                ),
                Text(
                  character.species,
                  style:
                      TextStyle(color: AppColor.lighttextColor, fontSize: 20),
                ),
              ],
            ),
          ),
        ));
    ;
  }
}
