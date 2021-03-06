import 'package:flutter/material.dart';
import '../constant.dart';
import '../components/reuseable_card.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.interpretation, @required this.resultText, @required this.bmiResult});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text('Hello',
    ),
    ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: Container(
              padding: EdgeInsets.all(15.0),
              child: Text('Your Result',
              style: kTitleTextStyle,),
            ),),
            Expanded(
                flex: 5,
                child: ReuseAbleCard(
                color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(resultText.toUpperCase(),
                      style: kResultTextStyle,),
                      Text(bmiResult,
                      style: kBMITextStyle,),
                      Text(interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,)
                    ],
                  ),
            )
            ),
            BottomButton(onTap: (){
              Navigator.pop(context);
            }, buttonTitle: 'RE-CALCULATE')
          ],
      )
);
  }
}
