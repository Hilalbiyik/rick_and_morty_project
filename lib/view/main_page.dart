import 'package:flutter/material.dart';
import 'package:my_api_task/model/character.dart';
import 'package:my_api_task/theme/app_color.dart';
import 'package:my_api_task/view/detail_page.dart';
import 'package:my_api_task/viewmodel/main_view_model.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundDark,
          title: Text(
            ConstantsAdress.appTitle,
            style: TextStyle(
                color: AppColor.lighttextColor, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            _buildSearchBar(
              context,
            ),
            Expanded(child: _buildCharacterList(context))
          ],
        ));
  }

  Widget _buildSearchBar(BuildContext context) {
    MainViewModel viewModel =
        Provider.of<MainViewModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onSubmitted: (String value) {
          viewModel.performSearch(context, value);
        },
        decoration: InputDecoration(
          hintText: ConstantsAdress.search,
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onChanged: (String value) {
          viewModel.performSearch(context, value);
        },
      ),
    );
  }
}

Widget _buildCharacterList(BuildContext context) {
  return Consumer<MainViewModel>(
    builder: (context, viewModel, child) => ListView.builder(
      itemCount: viewModel.characters.length,
      itemBuilder: (context, index) {
        Character character = viewModel.characters[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailPage(character)));
          },
          child: Card(
            color: AppColor.boxColor,
            child: ListTile(
              title: Text(
                character.name,
                style: TextStyle(
                    color: AppColor.lighttextColor,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                character.species,
                style: TextStyle(
                    color: AppColor.textColor, fontWeight: FontWeight.bold),
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(character.image),
              ),
              trailing: Text(character.gender),
            ),
          ),
        );
      },
    ),
  );
}
