import 'package:activity_ring/activity_ring.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../models/user_model.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../widgets/base_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<User> users = User.users;
  final int selectedUser = 1;

  void shuffleUsers() {
    setState(() {
      users.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: pagePaddingSize,
            left: pagePaddingSize,
            right: pagePaddingSize,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HomeAppBar(),
              QuestionWidget(users: users),
              GalleryWidget(users: users, selectedUser: selectedUser),
              galleryControls(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BaseBottomBar(),
    );
  }

  Container galleryControls(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: minSizedBox),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: appLoadingBackgroundColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: shuffleUsers,
            child: Row(
              children: [
                const Icon(LineIcons.random),
                const SizedBox(width: minSizedBox),
                Text(
                  'Shuffle',
                  style: Theme.of(context).textTheme.button,
                ),
              ],
            ),
          ),
          const SizedBox(),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'Skip',
                  style: Theme.of(context).textTheme.button,
                ),
                const SizedBox(width: minSizedBox),
                const Icon(LineIcons.arrowRight),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.normal),
            children: [
              const TextSpan(text: 'Would you date \n'),
              TextSpan(
                text: users[0].name.split(' ')[0],
                style: Theme.of(context).textTheme.headline5,
              ),
              const TextSpan(text: ' or '),
              TextSpan(
                text: users[1].name.split(' ')[0],
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({
    Key? key,
    required this.users,
    required this.selectedUser,
  }) : super(key: key);

  final List<User> users;
  final int selectedUser;

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
      itemBuilder: (_, index) {
        User user = users[index];
        return Container(
          padding: const EdgeInsets.all(minPaddingSize),
          decoration: BoxDecoration(
            border: index == selectedUser
                ? Border.all(
                    width: borderWidth,
                    color: const Color(appPrimaryColor),
                  )
                : null,
          ),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: user.photos.first,
            placeholder: (context, url) => Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: appLoadingBackgroundColor,
              ),
              child: const SizedBox(
                height: 60.0,
                child: Center(
                    child: CircularProgressIndicator(
                  strokeWidth: borderWidth,
                )),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(LineIcons.times),
          ),
        );
      },
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 40.0,
          child: Image(
            image: AssetImage(appLogo),
            alignment: Alignment.center,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: pagePaddingSize / 2),
          child: Ring(
            percent: 20.0,
            color: RingColorScheme(
                ringColor: const Color(appPrimaryColor),
                backgroundColor: appLoadingBackgroundColor),
            radius: 25.0,
            width: borderWidth,
            child: const Center(
              child: Text('1/5'),
            ),
          ),
        )
      ],
    );
  }
}
