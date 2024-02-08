import 'package:flutter/material.dart';
import 'package:nomster/components/recipe_information_page/recipe_ingridients.dart';
import 'package:nomster/components/recipe_information_page/recipe_instructions.dart';
import 'package:nomster/components/recipe_information_page/recipe_misc.dart';
import 'package:nomster/components/recipe_information_page/recipe_picture.dart';
import 'package:nomster/model/instructions_model.dart';
import 'package:nomster/model/recipe_information_model.dart';

class RecipeInformationPage extends StatelessWidget {
  final RecipeInformationResponse recipeInformationResponse;
  final List<InstructionResponse> instructionResponse;

  const RecipeInformationPage({
    super.key,
    required this.instructionResponse,
    required this.recipeInformationResponse,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.red,
                height: height * 0.35,
              ),
              RecipePicture(
                image: recipeInformationResponse.image,
              ),
              //back button
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.orange),
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              //favourite icon
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_outline),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.3,
                child: Container(
                  width: width,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            color: Colors.white,
            child: Column(
              children: [
                RecipeMisc(
                  title: recipeInformationResponse.title,
                  credits: recipeInformationResponse.credit,
                  rating: recipeInformationResponse.rating,
                  servings: recipeInformationResponse.servings,
                  readyInMinutes: recipeInformationResponse.readyInMinutes,
                  link: recipeInformationResponse.url,
                ),
                RecipeIngredients(
                  ingredients: recipeInformationResponse.ingredients,
                ),
                Recipe_Instructions(
                  instructionResponse: instructionResponse,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
