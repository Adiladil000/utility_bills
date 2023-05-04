import 'package:flutter/material.dart';

import '../constants/icon_manager.dart';
import '../constants/text_stayls.dart';
import '../widgets/custom_container_widget.dart';
import '../widgets/my_app_bar_widgets.dart';

class DebtNoticeScreen extends StatefulWidget {
  DebtNoticeScreen({super.key, required this.gas, required this.name, required this.light, required this.water});
  String name;
  double gas;
  double light;
  double water;
  @override
  State<DebtNoticeScreen> createState() => _DebtNoticeScreenState();
}

String amountText = "Ödəniləcək  Məbləğ   : ";

class _DebtNoticeScreenState extends State<DebtNoticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Kommunal Məlumat"),
      body: CustomContainer(Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          itemExtent: 100,
          children: [
            Center(
              child: Text(
                widget.name,
                style: textStyle,
              ),
            ),
            ligthListTile(),
            waterListTile(),
            gasListTile(),
          ],
        ),
      )),
    );
  }

  ListTile gasListTile() {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(IconManager.azerQazIcon),
      ),
      title: Text(
        "AzeriQaz",
        style: communalTextStyle,
      ),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$amountText ${widget.gas}" " ",
            style: subTitleTextStyle,
          ),
          Image.asset(color: Colors.white, cacheWidth: 15, cacheHeight: 15, IconManager.manatIcon)
        ],
      ),
    );
  }

  ListTile waterListTile() {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(IconManager.azerSuIcon),
      ),
      title: Text(
        "AzerSu",
        style: communalTextStyle,
      ),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$amountText  ${widget.water}" " ",
            style: subTitleTextStyle,
          ),
          Image.asset(color: Colors.white, cacheWidth: 15, cacheHeight: 15, IconManager.manatIcon)
        ],
      ),
    );
  }

  ListTile ligthListTile() {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(IconManager.azerIsiqIcon),
      ),
      title: Text(
        "AzerIsiq",
        style: communalTextStyle,
      ),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$amountText  ${widget.light}" " ",
            style: subTitleTextStyle,
          ),
          Image.asset(color: Colors.white, cacheWidth: 15, cacheHeight: 15, IconManager.manatIcon)
        ],
      ),
    );
  }
}
