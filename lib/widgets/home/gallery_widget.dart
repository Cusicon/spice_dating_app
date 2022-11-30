import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import '../../models/user_model.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';

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
              border: index == selectedUser
                  ? Border.all(
                      width: borderWidth,
                      color: const Color(appPrimaryColor),
                    )
                  : null,
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: user.photos.first,
                  placeholder: (context, url) => Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: appLoadingBackgroundColor,
                    ),
                    child: const SizedBox(
                      height: 40.0,
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: borderWidth,
                        ),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: appLoadingBackgroundColor,
                    ),
                    child: SizedBox(
                      height: 40.0,
                      child: Center(
                        child: Icon(
                          LineIcons.times,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
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
