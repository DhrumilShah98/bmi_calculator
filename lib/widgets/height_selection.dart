import 'package:flutter/material.dart';

class HeightSelection extends StatefulWidget {
  //Min height allowed (100cm)
  static const double MIN_HEIGHT = 100;

  //Min height allowed (100cm)
  static const double MAX_HEIGHT = 250;

  //Variable to keep track of selected height
  final double selectedHeight;

  //Method to change the height
  final Function changeSelectedHeightHandler;

  HeightSelection(
      {@required this.selectedHeight,
      @required this.changeSelectedHeightHandler});

  @override
  _HeightSelectionState createState() => _HeightSelectionState();
}

class _HeightSelectionState extends State<HeightSelection> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'HEIGHT',
              style: Theme.of(context).textTheme.headline6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  '${widget.selectedHeight.toInt()}',
                  style: Theme.of(context).textTheme.headline3.copyWith(
                      color: Colors.white
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'cm',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            Slider(
              value: widget.selectedHeight.toDouble(),
              min: HeightSelection.MIN_HEIGHT,
              max: HeightSelection.MAX_HEIGHT,
              onChanged: (newValue) {
                setState(
                  () {
                    widget.changeSelectedHeightHandler(newValue);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
