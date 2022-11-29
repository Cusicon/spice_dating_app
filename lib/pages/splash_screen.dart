import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../utils/constants.dart';
import '../widgets/loading_bar.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 10), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (_) => false,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 150,
                      child: Image(
                        image: AssetImage(appLaunchScreenLogo),
                        alignment: Alignment.center,
                      ),
                    ),
                    const SizedBox(height: maxSizedBox),
                    Text(
                      appSubTitle,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                const LoadingBar(),
                Text(
                  'Ver $appVersion',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
