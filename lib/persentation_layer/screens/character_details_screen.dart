import 'package:app/constants/Colors.dart';
import 'package:app/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text('${character.firstName}',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
            textAlign: TextAlign.start),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget chaacterInfo(String title, String value) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
            text: title,
            style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: Colors.white70, fontSize: 16),
          )
        ]));
  }

  Widget buildDivider(double endindend) {
    return Divider(
      color: Colors.yellow,
      height: 30,
      endIndent: endindend,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: EdgeInsets.all(9),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    chaacterInfo('Name : ', character.firstName),
                    buildDivider(300),
                    chaacterInfo('FullName : ', character.fullName),
                    buildDivider(240),
                    chaacterInfo('Iange : ', character.image),
                    buildDivider(265),
                    chaacterInfo('title : ', character.title),
                    buildDivider(270),
                    chaacterInfo('id : ', character.firstName),
                    buildDivider(300),
                    chaacterInfo('id : ', character.firstName),
                    buildDivider(300),
                  ]),
            ),
            SizedBox(
              height: 500,
            ),
          ]))
        ],
      ),
    );
  }
}
