import 'package:flutter/material.dart';

import '../models/buildings_model.dart';
import '../services/buildings_service.dart';
import '../widgets/custom_container_widget.dart';
import '../widgets/custom_eleveten_button_widgets.dart';
import '../widgets/my_app_bar_widgets.dart';
import 'first_building_screen.dart';

class Buildingscreens extends StatefulWidget {
  const Buildingscreens({super.key});

  @override
  State<Buildingscreens> createState() => _BuildingscreensState();
}

List<BuildingsModel> buildingsdataList = [];

class _BuildingscreensState extends State<Buildingscreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Binalar"),
      body: CustomContainer(
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            Row(
              children: const [
                Text("Baki şəhəri",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(),
              ],
            ),
            const Divider(
              height: 1,
              color: Colors.white10,
            ),
            const SizedBox(height: 25),
            Expanded(
              child: FutureBuilder(
                future: getBuildingsData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: buildingsdataList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomElevationButtonWidgets(
                                text: "  ${buildingsdataList[index].buildingName}",
                                onPressed: () {
                                  if (buildingsdataList[index].buildingName == 'Bina 1') {
                                    var route = MaterialPageRoute(
                                      builder: (context) => const FirstBuildingScreen(),
                                    );
                                    Navigator.push(context, route);
                                  }
                                },
                              ),
                            )
                          ],
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
}
