import 'package:flutter/material.dart';

import '../constants/text_stayls.dart';
import '../model/buildings_for_id_model.dart';
import '../services/first_building_service.dart';
import '../widgets/custom_container_widget.dart';
import '../widgets/my_app_bar_widgets.dart';
import 'debt_notice.dart';

class FirstBuildingScreen extends StatefulWidget {
  const FirstBuildingScreen({super.key});

  @override
  State<FirstBuildingScreen> createState() => _FirstBuildingScreenState();
}

List<BuildingsForIdModel> firstBuildingDataList = [];

class _FirstBuildingScreenState extends State<FirstBuildingScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        firstBuildingDataList.clear();
        return true;
      },
      child: Scaffold(
        appBar: MyAppBar(title: "Bina 1"),
        body: CustomContainer(
          Column(children: [
            Expanded(
              child: FutureBuilder(
                future: getFirstBuildingData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: firstBuildingDataList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                          child: ListTile(
                            onTap: () {
                              postDataToDebtNotice(index, context);
                            },
                            title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                firstBuildingDataList[index].ownerHouseName,
                                style: textStyle,
                              ),
                            ),
                            trailing: const Icon(
                              size: 32,
                              color: Colors.white,
                              Icons.chevron_right_rounded,
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ]),
        ),
      ),
    );
  }

  void postDataToDebtNotice(int index, BuildContext context) {
    var route = MaterialPageRoute(
      builder: (context) => DebtNoticeScreen(
          name: firstBuildingDataList[index].ownerHouseName,
          water: "${firstBuildingDataList[index].waterDebt}",
          light: "${firstBuildingDataList[index].lightDebt}",
          gas: "${firstBuildingDataList[index].gasDebt}"),
    );
    Navigator.push(context, route);
  }
}
