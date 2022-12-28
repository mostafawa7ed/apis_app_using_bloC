import 'package:app/buisnesslogiclayer/cubit/characters_cubit.dart';
import 'package:app/constants/Colors.dart';
import 'package:app/data/models/characters.dart';
import 'package:app/persentation_layer/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatactersScreen extends StatefulWidget {
  const ChatactersScreen({Key? key}) : super(key: key);

  @override
  State<ChatactersScreen> createState() => _ChatactersScreenState();
}

class _ChatactersScreenState extends State<ChatactersScreen> {
  List<Character>? allCharacters;
  List<Character>? selectedCharacterToSearch;
  bool _issearched = false;
  final _searchTextField = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCaracters();
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextField,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: "search for character",
        border: InputBorder.none,
      ),
      onChanged: (searchedCharacter) {
        setState(() {
          addSearchedCharacterToListSearch(searchedCharacter);
        });
      },
    );
  }

  List<Widget> _buildBarSearchAction() {
    if (_issearched == true) {
      return [
        // todo lsa b3den
        IconButton(
            onPressed: () {
              _clearSearch();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.search,
              color: Colors.amberAccent,
            )),
      ];
    } else {
      return [IconButton(onPressed: _startSearch, icon: Icon(Icons.search))];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
    setState(() {
      _issearched = true;
    });
  }

  void _stopSearch() {
    _clearSearch();
    setState(() {
      _issearched = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextField.clear();
    });
  }

  addSearchedCharacterToListSearch(String searchcharacter) {
    selectedCharacterToSearch = allCharacters!
        .where((character) =>
            character.fullName.toLowerCase().startsWith(searchcharacter))
        .toList();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is ChractersLoaded) {
        // state ==ChractersLoaded
        allCharacters = (state).characters;
        return buildLoadListWidgets();
      } else {
        return showLoadingIndictor();
      }
    });
  }

  Widget showLoadingIndictor() {
    return Center(
      child: CircularProgressIndicator(color: MyColors.myYellow),
    );
  }

  Widget buildLoadListWidgets() {
    return allCharacters == null
        ? Image.asset("assets/images/loading.gif")
        : SingleChildScrollView(
            child: Container(
              color: MyColors.myGrey,
              width: double.infinity,
              child: Column(
                children: [
                  GridView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: _searchTextField.text.isNotEmpty
                          ? selectedCharacterToSearch!.length
                          : allCharacters!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 3,
                          crossAxisSpacing: 10,
                          //mainAxisExtent: 2,
                          mainAxisSpacing: 2),
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius:
                                    BorderRadiusDirectional.circular(20)),
                            margin: EdgeInsets.all(5),
                            child: CharacterItem(
                              character: _searchTextField.text.isNotEmpty
                                  ? selectedCharacterToSearch![index]
                                  : allCharacters![index],
                            ));
                      }),
                ],
              ),
            ),
          );
  }

  Widget _buildAppBarTitle() {
    return Text(
      "Characters",
      style: TextStyle(color: Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getAllCaracters();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        leading: _issearched
            ? BackButton(
                color: MyColors.myGrey,
              )
            : Container(),
        title: _issearched ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildBarSearchAction(),
      ),
      body: buildBlocWidget(),
    );
  }
}
