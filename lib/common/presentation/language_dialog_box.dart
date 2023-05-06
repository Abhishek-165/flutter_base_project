import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class LanguageDialogBox extends StatefulWidget {
  const LanguageDialogBox({super.key});

  @override
  State<LanguageDialogBox> createState() => _LanguageDialogBoxState();
}

class _LanguageDialogBoxState extends State<LanguageDialogBox> {
  String languageValue = 'English';

  setNewLanguage(String? newLanguage) {
    setState(() {
      languageValue = newLanguage ?? 'English';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text("Languages")),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: -4),
                title: const Text('English'),
                leading: Radio(
                  fillColor: MaterialStateProperty.all(
                    AppColors.appGrey,
                  ),
                  activeColor: AppColors.appPurple,
                  value: "English",
                  onChanged: setNewLanguage,
                  groupValue: languageValue,
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: -4),
                title: const Text('Hindi'),
                leading: Radio(
                  fillColor: MaterialStateProperty.all(
                    AppColors.appGrey,
                  ),
                  activeColor: AppColors.appPurple,
                  value: "Hindi",
                  onChanged: setNewLanguage,
                  groupValue: languageValue,
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: -4),
                title: const Text('Marathi'),
                leading: Radio(
                  fillColor: MaterialStateProperty.all(
                    AppColors.appGrey,
                  ),
                  activeColor: AppColors.appPurple,
                  value: "Marathi",
                  onChanged: setNewLanguage,
                  groupValue: languageValue,
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: -4),
                title: const Text('Marwari'),
                leading: Radio(
                  fillColor: MaterialStateProperty.all(
                    AppColors.appGrey,
                  ),
                  activeColor: AppColors.appPurple,
                  value: "Marwari",
                  onChanged: setNewLanguage,
                  groupValue: languageValue,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: AppColors.appPurple,
                  ),
                  child: const Text(
                    'SAVE',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    //  context.appLocalization.localeName = Locale('hi');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
