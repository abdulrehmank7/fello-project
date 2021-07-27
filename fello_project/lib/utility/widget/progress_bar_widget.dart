import 'package:fello_project/utility/colors.dart';
import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, left: 16),
      child: const SizedBox(
        width: 38,
        height: 38,
        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(black)),
      ),
    );
  }
}
