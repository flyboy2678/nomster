import 'package:flutter/material.dart';
import 'package:nomster/model/instructions_model.dart';
import 'package:nomster/model/recipe_information_model.dart';
import 'package:nomster/pages/recipe_information_page.dart';
import 'package:nomster/services/api_service.dart';

class HomeRecipeCard extends StatelessWidget {
  final String image, title, rating;
  final int id;
  final List<String> cuisine, dishType;

  const HomeRecipeCard(
      {super.key,
      required this.image,
      required this.title,
      required this.rating,
      required this.id,
      required this.cuisine,
      required this.dishType});

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
        width: 200,
        height: height * 0.3,
        margin: const EdgeInsets.only(left: 20, bottom: 20, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400, spreadRadius: 1, blurRadius: 15),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 200,
                  height: 130,
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 130,
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.pink,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                recipeType(),
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    "Rating: ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    rating,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
