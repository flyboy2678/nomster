import 'package:flutter/material.dart';

class RecipeMisc extends StatelessWidget {
  final String title, credits, link;
  final double rating;
  final int servings, readyInMinutes;
  const RecipeMisc({
    super.key,
    required this.credits,
    required this.rating,
    required this.readyInMinutes,
    required this.servings,
    required this.title,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width * 0.6,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                rating.round().toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Container(
            width: width * 0.25,
            child: Text(
              credits,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.punch_clock,
                        size: 40,
                        color: Colors.orange,
                      ),
                      Text(
                        readyInMinutes.toString(),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.people,
                        size: 40,
                        color: Colors.orange,
                      ),
                      Text(
                        servings.toString(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
