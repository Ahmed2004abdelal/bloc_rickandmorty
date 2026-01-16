import 'package:bloc_breaking/consts/my_colors.dart';
import 'package:bloc_breaking/consts/strings.dart';
import 'package:bloc_breaking/data/model/characters_model.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final CharactersModel character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, characterDetailsScreen,
            arguments: character),
        child: GridTile(
          child: Hero(
            tag: character.id,
            child: Container(
              color: MyColors.myGrey,
              child: character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: "assets/images/loading.gif",
                      image: character.image,
                      fit: BoxFit.cover,
                    )
                  : Icon(Icons.person),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text('${character.name}',
                style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: MyColors.myWight,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}
