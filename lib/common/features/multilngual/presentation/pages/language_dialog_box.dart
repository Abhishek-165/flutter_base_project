import 'package:flavour_clean_bloc/common/features/multilngual/data/local_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../data/language.dart';
import '../bloc/language_bloc.dart';
import '../bloc/language_event.dart';

class LanguageDialogBox extends StatefulWidget {
  const LanguageDialogBox({super.key});

  @override
  State<LanguageDialogBox> createState() => _LanguageDialogBoxState();
}

class _LanguageDialogBoxState extends State<LanguageDialogBox> {
  String languageValue = 'en';

  @override
  void initState() {
    super.initState();
    languageValue = LocalLanguage.getInstance().readValue() ?? 'en';
  }

  setNewLanguage(String? newLanguage) {
    setState(() {
      languageValue = newLanguage ?? 'en';
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
                  value: "en",
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
                  value: "hi",
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
                    LanguageBloc languageChangeBloc =
                        BlocProvider.of<LanguageBloc>(context);

                    languageChangeBloc.add(
                      ChangeLanguage(
                        selectedLanguage: languageValue == "en"
                            ? Language.english
                            : Language.hindi,
                      ),
                    );
                    Navigator.pop(context);
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
