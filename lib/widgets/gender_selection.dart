import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GenderSelection extends StatefulWidget {
  //Male gender boolean
  static const bool GENDER_MALE = true;

  //Female gender boolean
  static const bool GENDER_FEMALE = false;

  //Boolean to check which gender is selected(Male/Female)
  final bool selectedGender;

  //Method to change the gender(Male to Female and vice versa)
  final Function changeSelectedGenderHandler;

  GenderSelection(
      {@required this.selectedGender,
      @required this.changeSelectedGenderHandler});

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  //Method to create gender widget
  Widget _createGenderWidget(
    BuildContext context,
    BoxConstraints constraints,
    String title,
    IconData icon,
    bool isSelected,
    Function changeSelectedGenderHandler,
  ) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(0),
      child: GestureDetector(
        onTap: changeSelectedGenderHandler,
        child: Container(
          width: constraints.maxWidth * 0.49,
          height: constraints.maxWidth * 0.49,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                size: 80.0,
                color: (isSelected)
                    ? Colors.white
                    : Theme.of(context).iconTheme.color,
              ),
              Text(
                title,
                style: (isSelected)
                    ? Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.white,
                        )
                    : Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _createGenderWidget(
            context,
            constraints,
            'MALE',
            MdiIcons.genderMale,
            (widget.selectedGender == GenderSelection.GENDER_MALE)
                ? true
                : false,
            () => {
              if (widget.selectedGender != GenderSelection.GENDER_MALE)
                widget.changeSelectedGenderHandler(GenderSelection.GENDER_MALE)
            },
          ),
          SizedBox(
            width: constraints.maxWidth * 0.02,
          ),
          _createGenderWidget(
            context,
            constraints,
            'FEMALE',
            MdiIcons.genderFemale,
            (widget.selectedGender == GenderSelection.GENDER_FEMALE)
                ? true
                : false,
            () => {
              if (widget.selectedGender != GenderSelection.GENDER_FEMALE)
                widget
                    .changeSelectedGenderHandler(GenderSelection.GENDER_FEMALE)
            },
          ),
        ],
      );
    });
  }
}
