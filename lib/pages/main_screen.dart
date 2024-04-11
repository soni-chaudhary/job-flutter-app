import 'package:flutter/cupertino.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:job_studio/constansts/app_constants.dart';
import 'package:job_studio/pages/appied_jobs/applied_job_list.dart';
import 'package:job_studio/pages/bookmark/bookmark_page.dart';
import 'package:job_studio/pages/chat/chat_detail_page.dart';
import 'package:job_studio/pages/device%20Management/device_management.dart';
import 'package:job_studio/pages/home/home_page.dart';
import 'package:job_studio/pages/profile/profile_page.dart';
import 'package:provider/provider.dart';
import '../controllers/drawer/drawe-screen.dart';
import '../controllers/zoom_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomProvider>(builder: (context, zoomNotifer, child) {
      return ZoomDrawer(
        menuScreen: DrawerScreen(
          indexSetter: (index) {
            zoomNotifer.currentIndex = index;
          },
        ),
        mainScreen: curruntScreen(context),
        borderRadius: 30,
        showShadow: true,
        angle: 0.0,
        slideWidth: 250,
        menuBackgroundColor: Color(kDarkBlue.value),
      );
    });
  }

  Widget curruntScreen(context) {
    var zoomNotifer = Provider.of<ZoomProvider>(context);
    switch (zoomNotifer.currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const ChatDetailPage();
      case 2:
        return const BookMarkPage();
      case 3:
        return const DeviceManagementPage();
      case 4:
        return const ProfilePage();
      case 5:
        return const AppliedJobList();
      default:
        return const HomePage();
    }
  }
}
