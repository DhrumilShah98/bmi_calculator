import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/widgets/app_bar.dart';
import 'package:bmi_calculator/widgets/custom_button.dart';
import 'package:bmi_calculator/widgets/gender_selection.dart';
import 'package:bmi_calculator/widgets/height_selection.dart';
import 'package:bmi_calculator/widgets/weight_age_selection.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Boolean to select gender
  bool _selectedGender = GenderSelection.GENDER_MALE;

  //Variable to keep track of height (cm)
  double _selectedHeight = 183;

  //Variable to keep track of weight (kg)
  int _selectedWeight = 63;

  //Variable to keep track of age
  int _selectedAge = 19;

  //Method to change the gender
  void _changeSelectedGender(bool newGender) {
    setState(() {
      this._selectedGender = newGender;
    });
  }

  //Method to change the height
  void _changeSelectedHeight(double newHeight) {
    setState(() {
      this._selectedHeight = newHeight;
    });
  }

  //Method to increment the weight
  void _incrementWeight() {
    setState(() {
      this._selectedWeight++;
    });
  }

  //Method to decrement the weight
  void _decrementWeight() {
    setState(() {
      this._selectedWeight--;
    });
  }

  //Method to increment the age
  void _incrementAge() {
    setState(() {
      this._selectedAge++;
    });
  }

  //Method to decrement the age
  void _decrementAge() {
    setState(() {
      this._selectedAge--;
    });
  }

  //Move to results screen
  void _viewResult(BuildContext context) {
    Navigator.of(context).pushNamed(
      ResultScreen.routeName,
      arguments: {
        'gender': _selectedGender,
        'height': _selectedHeight.toInt(),
        'weight': _selectedWeight,
        'age': _selectedAge,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarWidget(title: 'BMI CALCULATOR'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GenderSelection(
                    selectedGender: _selectedGender,
                    changeSelectedGenderHandler: _changeSelectedGender,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: HeightSelection(
                      selectedHeight: _selectedHeight,
                      changeSelectedHeightHandler: _changeSelectedHeight,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: WeightAgeSelection(
                      selectedWeight: _selectedWeight,
                      selectedAge: _selectedAge,
                      incrementWeightHandler: _incrementWeight,
                      decrementWeightHandler: _decrementWeight,
                      incrementAgeHandler: _incrementAge,
                      decrementAgeHandler: _decrementAge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            buttonText: 'CALCULATE YOUR BMI',
            viewResultHandler: _viewResult,
          ),
        ],
      ),
    );
  }
}
