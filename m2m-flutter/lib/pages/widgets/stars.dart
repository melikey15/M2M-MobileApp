import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  final double? average;
  const Stars({super.key, required this.average});

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        children: [
          buildButton(average!),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return Icon(index < average! ? Icons.star : Icons.star_border,
                  color: Color.fromARGB(255, 217, 169, 25), size: 15);
            }),
          ),
        ],
      ),
    ],
  );

  Widget buildButton(
      double value,
      ) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 2),
          ],
        ),
      );
}