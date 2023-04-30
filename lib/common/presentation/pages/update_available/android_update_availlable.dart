import 'package:flavour_clean_bloc/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';

class AndroidUpdateAvailble extends StatelessWidget {
  const AndroidUpdateAvailble({Key? key}) : super(key: key);

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
        mainAxisSize: MainAxisSize.min,
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
                      InAppUpdate.checkForUpdate().then((value) {
                        if (value.updateAvailability ==
                            UpdateAvailability.updateAvailable) {
                          InAppUpdate.performImmediateUpdate().then((value) {
                            if (value == AppUpdateResult.success) {
                              Navigator.pop(context);
                            }
                          }).catchError((exception, s) {
                            //  bugsnag.notify(exception, s);
                          });
                        }
                      }).catchError((exception, s) {
                        //  bugsnag.notify(exception, s);
                      });
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
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
