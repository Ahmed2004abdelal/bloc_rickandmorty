import 'package:bloc_breaking/business_logic/cubit/charactars_cubit.dart';
import 'package:bloc_breaking/consts/my_colors.dart';
import 'package:bloc_breaking/data/model/characters_model.dart';
import 'package:bloc_breaking/presentation/widgets/characteritem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactarsScreen extends StatefulWidget {
  const CharactarsScreen({super.key});

  @override
  State<CharactarsScreen> createState() => _CharactarsScreenState();
}

class _CharactarsScreenState extends State<CharactarsScreen> {
  List<CharactersModel> allcharacters = [];
  late List<CharactersModel> searchedForCharacters;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
        hintText: "Find a character...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18),
      ),
      style: TextStyle(color: MyColors.myGrey, fontSize: 18),
      onChanged: (value) {
        addsearchedForItemsToSearchedList(value);
      },
    );
  }

  void addsearchedForItemsToSearchedList(String value) {
    searchedForCharacters = allcharacters
        .where((character) => character.name.toLowerCase().startsWith(value))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActioins() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _searchTextController.text.isEmpty
                ? Navigator.pop(context)
                : _cleadSearch();
          },
          icon: Icon(Icons.clear, color: MyColors.myGrey),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(Icons.search, color: MyColors.myGrey),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _cleadSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _cleadSearch() {
    _searchTextController.clear();
    searchedForCharacters = allcharacters;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactarsCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactarsCubit, CharactarsState>(
      builder: (context, state) {
        if (state is CharactarsLoaded) {
          allcharacters = state.characters;
          return buildLoadedListWidget();
        } else {
          return showloadingIndicator();
        }
      },
    );
  }

  Widget showloadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(color: MyColors.myYellow),
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(children: [buildcharactersList()]),
      ),
    );
  }

  Widget buildcharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: _searchTextController.text.isEmpty
          ? allcharacters.length
          : searchedForCharacters.length,

      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (ctx, index) {
        return CharacterItem(
          character: _searchTextController.text.isEmpty
              ? allcharacters[index]
              : searchedForCharacters[index],
        );
      },
    );
  }

  Widget buildAppBarTittle() {
    return const Text('Characters', style: TextStyle(color: MyColors.myGrey));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: _isSearching ? _buildSearchField() : buildAppBarTittle(),
        actions: _buildAppBarActioins(),
        leading: _isSearching ? BackButton(color: MyColors.myGrey) : null,
      ),
      body: buildBlocWidget(),
    );
  }
}
