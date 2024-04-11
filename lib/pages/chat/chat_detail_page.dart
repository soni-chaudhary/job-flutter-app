import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/pages/chat/chat_widget/chat_page.dart';
import 'package:job_studio/pages/search/user_serch_job.dart';
import '../../controllers/drawer/drawer_widget.dart';
import '../../common/app_bar.dart';
import '../../common/height_spacer.dart';
import 'chat_widget/chat_contect_list.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({super.key});
  static const routeName = '/chatpage';

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: CustomAppBar(
            color: Color(kDarkBlue.value),
            textColor: Color(kLight.value),
            text: "Chat",
            child: Padding(
              padding: EdgeInsets.all(12.h),
              child: DrawerWidget(
                color: Color(kLight.value),
              ),
            ),
          )),
      body: Container(
        decoration: BoxDecoration(
          color: Color(kDarkBlue.value),
        ),
        child: Column(children: [
          const HeightSpacer(size: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: SearchWidgetText(
              backgroundColor: Color(kLight.value),
              text: "Search",
            ),
          ),
          const HeightSpacer(size: 20),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Color(kDarkBlue.value),
                    blurRadius: 3.0,
                  ),
                ],
                color: Color(kLight.value),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 25),
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ChatContactList(
                        onTap: () {
                          Get.to(() => const ChatPage());
                        },
                      );
                    }),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
