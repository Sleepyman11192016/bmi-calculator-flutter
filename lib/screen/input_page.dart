import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reuseable_card.dart';
import '../constant.dart';
import 'result_page.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import '../calculation_BMI.dart';

enum Gender {
  male,
  female,
}
class InputPage extends StatefulWidget {


  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveCardColor;
  Color femaleCardColour = kInactiveCardColor;
  Gender selectGender;
  int height = 180;
  int weight = 80;
  int age = 28;

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(child: ReuseAbleCard(
                    onPress: (){
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                    color: selectGender == Gender.male? kActiveCardColor:kInactiveCardColor,
                    cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
                  )
                  ),
                  Expanded(child:ReuseAbleCard(
                    onPress: (){
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                    color: selectGender == Gender.female ? kActiveCardColor:kInactiveCardColor,
                    cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  )
                  ),
                ],
              )
          ),
          Expanded(child: ReuseAbleCard(
            color: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT',
                style: kLabelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                        height.toString(),
                        style: kNumberTextStyle),
                    Text('cm',
                    style: kLabelTextStyle,)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor:Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15.0
                    ),
                    overlayShape: RoundSliderOverlayShape(
                      overlayRadius: 30.0
                    )
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });

                    },),

                )
              ],
            ),
          ),),

          Expanded(
              child: Row(
                children: [
                  Expanded(child: ReuseAbleCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',
                        style: kLabelTextStyle,),
                        Text(
                            weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },),
                            SizedBox(
                              width:10.0
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },),
                          ],
                        )
                      ],

                    ),
                  )
                  ),
                  Expanded(child: ReuseAbleCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',
                          style: kLabelTextStyle,),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },),
                            SizedBox(
                                width:10.0
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },),
                          ],
                        )
                      ],

                    ),
                  ),

                  ),
                ],
              ),


          ),

          BottomButton(buttonTitle: 'CALCULATE',
          onTap: (){
            CalculationBrain calc = CalculationBrain(height: height,weight: weight);


            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context)=>ResultsPage(
                    bmiResult:  calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  )
              ),

            );
          },)
        ],
      )
    );
  }
}









