import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../common/bookmarkVerticalTile.dart';
import '../../constansts/app_constants.dart';
import '../../controllers/bookmark_provider.dart';
import '../../controllers/drawer/drawer_widget.dart';
import '../../common/app_bar.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  // bool isBookmark = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<BookMarkProvider>(
        builder: (context, bookmarkNotifer, child) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: CustomAppBar(
            color: Color(kLight.value),
            text: "BOOKMARK",
            child: Padding(
              padding: EdgeInsets.all(12.h),
              child: const DrawerWidget(),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 4,
              itemBuilder: (context, index) {
                return BookmarkVerticalTile(
                  companyName: "FaceBook",
                  jonTitle: "Senior Flutter developer",
                  locationOfJob: "Noida",
                  salary: "50k",
                  periodOfSalary: "Full time",
                  postJobDate: "3 day ago",
                  isBookmarks: bookmarkNotifer.isBookmark,
                  isBookmarkFunction: () {
                    bookmarkNotifer.isBookmark = !bookmarkNotifer.isBookmark;
                  },
                  onTap: () {
                    // Get.to(() => const JobDetailPage(
                    //       companyName: 'FacrBook',
                    //     ));
                  },
                );
              }),
        ),
      );
    });
  }
}
