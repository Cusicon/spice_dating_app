import 'package:flutter/material.dart';
import 'package:spice_dating_app/utils/colors.dart';

import '../../models/user_model.dart';
import '../../utils/constants.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: minSizedBox),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: appNormalGrey,
                ),
            children: [
              const TextSpan(text: 'Would you date \n'),
              TextSpan(
                text: users[0].name.split(' ').first,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const TextSpan(text: ' or '),
              TextSpan(
                text: users[1].name.split(' ').first,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
