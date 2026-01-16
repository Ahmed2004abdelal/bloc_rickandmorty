import 'package:bloc_breaking/consts/my_colors.dart';
import 'package:bloc_breaking/data/model/characters_model.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final CharactersModel character;
  CharacterDetailsScreen({required this.character, super.key});

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  List<int> episodes = [];

  void getEpisodesList() {
    episodes = widget.character.episode
        .map((e) => int.parse(e.split('/').last))
        .toList();
    setState(() {});
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      // primary: false,
      expandedHeight: 600,
      pinned: true,
      excludeHeaderSemantics: true,
      stretch: true,
      backgroundColor: MyColors.myYellow,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          widget.character.name,
          style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        background: Hero(
          tag: widget.character.id,
          child: Image.network(widget.character.image, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget characterInfo(key, value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: key,
            style: TextStyle(
              color: MyColors.myWight,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: MyColors.myWight,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(endint) {
    return Divider(
      color: MyColors.myYellow,
      height: 30,
      endIndent: endint,
      thickness: 2,
    );
  }

  @override
  void initState() {
    getEpisodesList();
    super.initState();
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
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo("gender : ", widget.character.gender),
                    buildDivider(260.0),
                    characterInfo("status : ", widget.character.status),
                    buildDivider(260.0),
                    characterInfo("eposide : ", episodes.join(",")),
                    buildDivider(250.0),
                    SizedBox(height: 700),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
