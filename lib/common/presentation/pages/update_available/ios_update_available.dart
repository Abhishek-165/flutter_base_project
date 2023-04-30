import 'package:flutter/material.dart';
import 'package:store_redirect/store_redirect.dart';

import '../../../../core/utils/common_exports.dart';

class IOSUpdateAvailable extends StatelessWidget {
  const IOSUpdateAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Image.asset(
            'lib/assets/images/trustworthy.webp',
            height: 100,
          ),
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 55, vertical: 0),
            child: Text(
              'New Update Available!',
              textAlign: TextAlign.center,
              style: TextStyle(
                // fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: AppColors.appPurple,
                fontSize: 18,
              ),
            ),
          ),
          // Spacer(),
          const SizedBox(
            height: 12,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
            child: Text(
              'A new version of app is available with better features',
              textAlign: TextAlign.center,
              style: TextStyle(
                // fontFamily: 'Montserrat',
                color: AppColors.appPurple,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      StoreRedirect.redirect(
                          androidAppId: 'org.example.projectName',
                          iOSAppId: 'iosAppID');
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Update Now',
                          style: TextStyle(
                            color: AppColors.appWhite,
                            fontSize: 16,
                            // fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 14,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Remind Later',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: AppColors.appPurple,
                // fontFamily: 'Montserrat',
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
