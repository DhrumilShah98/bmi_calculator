import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class WeightAgeSelection extends StatefulWidget {
  //Variable to keep track of weight (kg)
  final int selectedWeight;

  //Variable to keep track of age
  final int selectedAge;

  //Method to increment weight
  final Function incrementWeightHandler;

  //Method to decrement weight
  final Function decrementWeightHandler;

  //Method to increment age
  final Function incrementAgeHandler;

  //Method to increment age
  final Function decrementAgeHandler;

  const WeightAgeSelection({
    @required this.selectedWeight,
    @required this.selectedAge,
    @required this.incrementWeightHandler,
    @required this.decrementWeightHandler,
    @required this.incrementAgeHandler,
    @required this.decrementAgeHandler,
  });

  @override
  _WeightAgeSelectionState createState() => _WeightAgeSelectionState();
}

class _WeightAgeSelectionState extends State<WeightAgeSelection> {
  //Method to create weight age widget
  Widget _createWeightAgeWidget(
    BuildContext context,
    BoxConstraints constraints,
    String title,
    String value,
    Function incrementValHandler,
    Function decrementValHandler,
  ) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(0),
      child: Container(
        padding: const EdgeInsets.all(24),
        width: constraints.maxWidth * 0.49,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.headline3.copyWith(
                  color: Colors.white
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(28, 31, 50, 1),
                  ),
                  child: IconButton(
                    icon: Icon(
                      MdiIcons.minus,
                      size: 32,
                    ),
                    onPressed: decrementValHandler,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(28, 31, 50, 1),
                  ),
                  child: IconButton(
                    icon: Icon(
                      MdiIcons.plus,
                      size: 32,
                    ),
                    onPressed: incrementValHandler,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            _createWeightAgeWidget(
              context,
              constraints,
              'WEIGHT',
              '${widget.selectedWeight}',
              widget.incrementWeightHandler,
              widget.decrementWeightHandler,
            ),
            SizedBox(
              width: constraints.maxWidth * 0.02,
            ),
            _createWeightAgeWidget(
              context,
              constraints,
              'AGE',
              '${widget.selectedAge}',
              widget.incrementAgeHandler,
              widget.decrementAgeHandler,
            ),
          ],
        );
      },
    );
  }
}
