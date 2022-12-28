import 'package:app/constants/Colors.dart';
import 'package:app/data/models/characters.dart';
import 'package:flutter/material.dart';

import '../../constants/Strings.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: GridTile(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, characterDetials,
                arguments: character);
          },
          child: Hero(
            tag: character.id,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(1),
                  color: MyColors.myGrey,
                  //borderRadius: BorderRadiusDirectional.circular(10)
                ),
                child: character.image.isEmpty
                    ? Image.asset('assets/images/loading.gif')
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(10)),
                        child: Container(
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/loading.gif',
                            image: character.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
          ),
        ),
        footer: Container(
          decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: Text(
            '${character.firstName}',
            style: TextStyle(height: 2, fontSize: 16, color: Colors.white70),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
