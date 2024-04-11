import 'package:flutter/material.dart';
import 'package:job_studio/common/height_spacer.dart';

class DeviceManagementAlertDialog extends StatelessWidget {
  const DeviceManagementAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // insetPadding: const EdgeInsets.symmetric(horizontal: 25),
      contentPadding:
          const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 25),
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Device Status", style: TextStyle(fontSize: 18)),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const HeightSpacer(size: 10),
              const Text("Tap on the logout button to deactivate this device",
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              const HeightSpacer(size: 30),
              Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cencle",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        );
      }),
    );
  }
}
