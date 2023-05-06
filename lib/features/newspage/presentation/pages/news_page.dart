import 'package:flavour_clean_bloc/core/config/app_size_util.dart';
import 'package:flavour_clean_bloc/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../common/presentation/language_dialog_box.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
  }

  void languageDialog() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const LanguageDialogBox();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Test AppBar",
            textScaleFactor: ScreenUtil.textScaleFactor,
          ),
          actions: [
            IconButton(
                onPressed: languageDialog, icon: const Icon(Icons.language))
          ],
        ),
        body: Center(
          child: Text(
            context.appLocalization?.language ?? '',
            textAlign: TextAlign.center,
            textScaleFactor: ScreenUtil.textScaleFactor,
          ),
        ));
  }
}
