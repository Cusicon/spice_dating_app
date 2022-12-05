import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../models/user_model.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../widgets.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({
    Key? key,
    required this.users,
    required this.selectedUser,
    required this.selectUser,
    required this.chosenUser,
    required this.chooseUser,
    required this.chosenController,
  }) : super(key: key);

  final List<User> users;
  final int selectedUser;
  final Function selectUser;
  final int chosenUser;
  final Function chooseUser;
  final AnimationController chosenController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: 2,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: MediaQuery.of(context).size.height * 0.425,
      ),
      itemBuilder: (ctx, index) {
        User user = users[index];
        return InkWell(
          onTap: () => selectUser(index),
          onDoubleTap: () => chooseUser(ctx, index),
          child: Container(
            padding: const EdgeInsets.all(minPaddingSize),
            decoration: BoxDecoration(
              border: Border.all(
                width: borderWidth,
                color: index == selectedUser
                    ? appPrimaryColor
                    : Colors.transparent,
              ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ImageContainer(imageUrl: user.photos.first),
                if (index == chosenUser)
                  Center(
                    child: Lottie.asset(
                      loveIcon,
                      repeat: false,
                      controller: chosenController,
                      onLoaded: (composition) {
                        chosenController.duration = composition.duration;
                        chosenController.forward();
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
