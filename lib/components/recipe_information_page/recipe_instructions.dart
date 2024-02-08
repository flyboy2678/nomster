import 'package:flutter/material.dart';
import 'package:nomster/model/instructions_model.dart';

class Recipe_Instructions extends StatelessWidget {
  final List<InstructionResponse> instructionResponse;
  const Recipe_Instructions({
    super.key,
    required this.instructionResponse,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Instructions",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
              itemCount: instructionResponse[0].step.length,
              shrinkWrap: true,
              primary: false,
              itemBuilder: ((context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      instructionResponse[0].step[index].number.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: width * 0.8,
                        child: Text(
                          instructionResponse[0].step[index].step,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                  ],
                );
              })),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
