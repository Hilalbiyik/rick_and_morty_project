import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_api_task/model/character.dart';
import 'package:my_api_task/theme/app_color.dart';
import 'package:provider/provider.dart';

class MainViewModel with ChangeNotifier {
  List<Character> _characters = [];

  List<Character> get characters => _characters;

  MainViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCharacters();
    });
  }

  void updateFilteredCharacters(List<Character> filteredList) {
    print(filteredList.length.toString());
    _characters.clear();
    _characters.addAll(filteredList);
    notifyListeners();
  }

  void performSearch(BuildContext context, String searchText) {
    MainViewModel viewModel =
        Provider.of<MainViewModel>(context, listen: false);

    List<Character> filteredCharacters = viewModel.characters
        .where((character) =>
            character.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    viewModel.updateFilteredCharacters(filteredCharacters);
  }

  void _getCharacters() async {
    Uri uri = Uri.parse(ConstantsAdress.apiUrl);
    http.Response response = await http.get(uri);

    Map<String, dynamic> data = jsonDecode(response.body);

    if (data.containsKey('results') && data['results'] is List) {
      List<Map<String, dynamic>> characterList =
          List<Map<String, dynamic>>.from(data['results']);

      for (Map<String, dynamic> characterMap in characterList) {
        Character character = Character.fromMap(characterMap);
        _characters.add(character);
      }

      notifyListeners();
    } else {
      print("Hata: 'result' anahtarı eksik veya doğru formatta değil.");
    }
  }
}
