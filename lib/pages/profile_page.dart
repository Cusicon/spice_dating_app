import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:palette_generator/palette_generator.dart';

import '../extensions/string_api_ext.dart';
import '../models/user_model.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
    required this.scrollController,
    required this.user,
  }) : super(key: key);

  static const String routeName = '/profile';

  final User user;
  final ScrollController scrollController;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late PaletteColor paletteColor;

  @override
  void initState() {
    super.initState();
    paletteColor = PaletteColor(Colors.transparent, 20);
  }

  Future<void> _getPaletteColors(String imagePath) async {
    final PaletteColor palette = await generatePalette(imagePath);

    setState(() {
      paletteColor = palette;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double headHeight = MediaQuery.of(context).size.height * 0.7;
    User currentUser = widget.user;

    _getPaletteColors(currentUser.photos.first);

    return Scaffold(
      body: Container(
        color: Colors.transparent,
        child: ListView(
          shrinkWrap: true,
          controller: widget.scrollController,
          children: [
            ProfileHeadPhotos(
              height: headHeight,
              user: currentUser,
              paletteColor: paletteColor.color,
            ),
            ProfileMainActions(
              bgPaletteColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: pagePaddingSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileBioDetails(currentUser: currentUser),
                  const SizedBox(height: maxSizedBox * 2),
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      padding: const EdgeInsets.all(pagePaddingSize),
                      decoration: BoxDecoration(
                        border: Border.symmetric(
                          horizontal: BorderSide(
                            color: appLightGrey,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  LineIcons.rulerVertical,
                                  size: 36.0,
                                  color: appPrimaryColor,
                                ),
                                const SizedBox(width: minSizedBox),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Height',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                    const SizedBox(height: minSizedBox),
                                    Text(
                                      '${currentUser.height} Cm',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  LineIcons.ring,
                                  size: 36.0,
                                  color: appPrimaryColor,
                                ),
                                const SizedBox(width: minSizedBox),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Relationship Status',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                    const SizedBox(height: minSizedBox),
                                    Text(
                                      currentUser.maritalStatus.name
                                          .toNameCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: maxSizedBox * 2),
                  GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: currentUser.photos.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: MediaQuery.of(context).size.height * 0.25,
                    ),
                    itemBuilder: (ctx, index) {
                      List<String> userPhotos = currentUser.photos;

                      return InkWell(
                        // onTap: () => selectUser(index),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(minPaddingSize),
                          child: ImageContainer(imageUrl: userPhotos[index]),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileBioDetails extends StatelessWidget {
  const ProfileBioDetails({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '${currentUser.name}, ${currentUser.age}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(width: minSizedBox),
              const Image(
                height: maxSizedBox,
                image: AssetImage(
                  'assets/icons/verified-badge.png',
                ),
              ),
            ],
          ),
          Text(currentUser.city),
          const SizedBox(height: pagePaddingSize * 2),
          Text(
            'Bio',
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(height: minSizedBox),
          Text(
            currentUser.bio,
            // '${currentUser.bio}. ' * 50,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
