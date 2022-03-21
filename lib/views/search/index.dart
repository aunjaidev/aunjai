import 'package:aunjai/utils/app_theme.dart';
import 'package:aunjai/utils/text.common.dart';
import 'package:aunjai/utils/widgets/appbar.dart';
import 'package:aunjai/utils/widgets/textfield.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.25,
        title: Row(
          children: [
            Flexible(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textField(context,
                      label: "Search Destination",
                      backgroundColor: Color.fromARGB(255, 249, 249, 250),
                      labelColor: AppTheme.primary3),
                )),
            Flexible(
              flex: 2,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Center(
                    child: TextCommon.normalText("Cancel",
                        fontSize: 18.0, fontWeight: FontWeight.w500)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
