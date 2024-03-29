import 'package:flutter/material.dart';
import 'package:nomster/model/instructions_model.dart';
import 'package:nomster/model/recipe_information_model.dart';
import 'package:nomster/pages/recipe_information_page.dart';
import 'package:nomster/services/api_service.dart';

class RecipeResultCard extends StatelessWidget {
  final String image;
  final String title;
  final int id;
  final double rating;
  final List<String> cuisine, dishType;

  const RecipeResultCard({
    super.key,
    required this.id,
    required this.image,
    required this.title,
    required this.rating,
    required this.cuisine,
    required this.dishType,
  });

  @override
  Widget build(BuildContext context) {
    String recipeType() {
      if (cuisine.length < 1) {
        return dishType[0].toUpperCase();
      } else {
        return cuisine[0].toUpperCase();
      }
    }

    void handleComponentTap() async {
      RecipeInformationResponse recipeInformationResponse;
      List<InstructionResponse> instructionResponse;
      try {
        recipeInformationResponse =
            await ApiService.instance.getRecipeInformation(id);

        instructionResponse = await ApiService.instance.getInstructions(id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeInformationPage(
              recipeInformationResponse: recipeInformationResponse,
              instructionResponse: instructionResponse,
            ),
          ),
        );
      } catch (error) {
        print('error $error');
      }
    }

    return GestureDetector(
      onTap: handleComponentTap,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400, spreadRadius: 1, blurRadius: 15),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 100,
                child: Image.network(image),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  recipeType(),
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                Text(
                  'Rating: ${rating.round().toString()}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
