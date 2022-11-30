import 'package:activity_ring/activity_ring.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:spice_dating_app/pages/profile_page.dart';

import '../models/user_model.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<User> users = User.users;
  late int selectedUser;
  late int chosenUser;
  late AnimationController chosenController;

  @override
  void initState() {
    selectedUser = users.length;
    chosenUser = users.length;
    chosenController = AnimationController(vsync: this);
    chosenController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        showModal();
        chosenController.reset();
      }
    });
    super.initState();
  }

  void showModal() {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (context) {
        return const ProfilePage();
      },
    );
  }

  void shuffleUsers() {
    setState(() {
      users.shuffle();
      selectedUser = users.length;
      chosenUser = users.length;
    });
  }

  void selectUser(index) {
    setState(() {
      selectedUser = index;
      if (chosenUser != index) {
        chosenUser = users.length;
      }
    });
  }

  void chooseUser(context, index) async {
    setState(() {
      selectedUser = index;
      chosenUser = index;
    });
  }

  @override
  void dispose() {
    chosenController.dispose();
    super.dispose();
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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    QuestionWidget(users: users),
                    GalleryWidget(
                      users: users,
                      selectedUser: selectedUser,
                      selectUser: selectUser,
                      chosenUser: chosenUser,
                      chooseUser: chooseUser,
                      chosenController: chosenController,
                    ),
                    galleryControls(context),
                  ],
                ),
              ),
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
