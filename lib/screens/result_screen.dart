import 'package:bmi_calculator/widgets/app_bar.dart';
import 'package:bmi_calculator/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = '/result';

  //Method to recalculate BMI
  void _recalculateBMI(BuildContext context) {
    Navigator.of(context).pop();
  }

  //Method to get BMI Text Widget based on value
  Widget _getBMITextWidget(BuildContext context, double bMIValue) {
    String bMIText;
    if (bMIValue < 18.5) {
      bMIText = 'UNDERWEIGHT';
    } else if (bMIValue <= 25.0) {
      bMIText = 'NORMAL WEIGHT';
    } else if (bMIValue <= 30.0) {
      bMIText = 'OVERWEIGHT';
    } else {
      bMIText = 'OBESE';
    }

    return Text(
      bMIText,
      style: Theme.of(context).textTheme.headline6.copyWith(
          color: (bMIValue >= 18.5 && bMIValue <= 25.0)
              ? Colors.lightGreenAccent
              : Colors.redAccent),
    );
  }

  //Method to get BMI text description
  String _getBMIDescription(double bMIValue) {
    String bMIDescription;
    if (bMIValue < 18.5) {
      bMIDescription = 'You are underweight. Exercise,\nEat and Sleep.';
    } else if (bMIValue <= 25.0) {
      bMIDescription = 'You have a normal body\nweight. Good job!';
    } else if (bMIValue <= 30.0) {
      bMIDescription = 'You are overweight. Exercise\n little bit more.';
    } else {
      bMIDescription = 'You are obese. Avoid junk\nfood completely. ';
    }
    return bMIDescription;
  }

  //Method to calculate bMI value
  double _calculateBMIValue(Map<String, Object> values) {
    double height = (values['height'] as int) / 100; //m
    int weight = values['weight'] as int; //kg
    return weight / (height * height);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> bMIObject =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    double bMIValue = _calculateBMIValue(bMIObject);

    return Scaffold(
      appBar: getAppBarWidget(title: 'BMI CALCULATOR'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Result',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Expanded(
                    child: Card(
                      elevation: 10,
                      margin: const EdgeInsets.only(top: 24),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _getBMITextWidget(context, bMIValue),
                            Text(
                              bMIValue.toStringAsFixed(1),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(color: Colors.white),
                            ),
                            Column(
                              children: [
                                Text(
                                  'Normal BMI range:',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Text(
                                    '18,5 - 25 kg/m2',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              _getBMIDescription(bMIValue),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: Colors.white, height: 1.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          CustomButton(
            buttonText: 'RE-CALCULATE YOUR BMI',
            viewResultHandler: _recalculateBMI,
          ),
        ],
      ),
    );
  }
}
