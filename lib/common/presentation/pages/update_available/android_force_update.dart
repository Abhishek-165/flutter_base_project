import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:move_to_background/move_to_background.dart';

import '../../../../core/theme/app_colors.dart';

class AndroidForceUpdateAvailble extends StatelessWidget {
  const AndroidForceUpdateAvailble({
    Key? key,
  }) : super(key: key);

  Future<bool> _onWillPop2(context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
          child: Text(
            'Do you want to exit the App?',
            textAlign: TextAlign.center,
            style: TextStyle(
              // fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: AppColors.appPurple,
              fontSize: 16,
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              MoveToBackground.moveTaskToBack();
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Yes',
                  style: TextStyle(
                    color: AppColors.appWhite,
                    fontSize: 17,
                    // fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              return Navigator.of(context).pop(false);
            },
            child: const Center(
              child: Text(
                'No',
                style: TextStyle(
                  color: AppColors.appPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    return false;
  }

  showUpdateDialog(context) {
    InAppUpdate.checkForUpdate().then((value) {
      if (value.updateAvailability == UpdateAvailability.updateAvailable) {
        InAppUpdate.performImmediateUpdate().then((value) {
          if (value == AppUpdateResult.success) {
            Navigator.pop(context);
          } else {
            showUpdateDialog(context);
          }
        }).catchError((exception, s) {
          //      bugsnag.notify(exception, s);
        });
      }
    }).catchError((exception, s) {
      //  bugsnag.notify(exception, s);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop2(context),
      child: Container(
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
                        showUpdateDialog(context);
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
          ],
        ),
      ),
    );
  }
}
