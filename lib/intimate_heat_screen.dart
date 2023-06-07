import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:flutter_chat/utils/asset_img.dart";

List<dynamic> jsonList = [
  {"title": "发送两条信息+1分", "text": "0/50(每日上限50分）", "btnText": "去发信息"},
  {"title": "给TA贴个标签+1分", "text": "0/5(每月上限5分）", "btnText": "去发信息"},
  {"title": "连续每天发消息可+2分", "text": "0/20(每月上限20分）", "btnText": "去发信息"},
  {"title": "预约线下见面+10分", "text": "0/20(每日上限20分）", "btnText": "去预约"}
];

class IntmateHeatScreen extends StatelessWidget {
  const IntmateHeatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color color1 = const Color(0xFFFFD5CC);
    Color color2 = Colors.white;
    double weight = 0.6; // 调整权重值来控制混合程度

    Color? blendedColor = Color.lerp(color1, color2, weight);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF0EAC4),
              Color(0xFFFFD5CC),
              Color(0xFFFFC8CB),
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 12)
                          .w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_left_rounded,
                        size: 34.0.w,
                      ),
                      Text(
                        "亲密度",
                        style: TextStyle(fontSize: 20.sp),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 34.0.w,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                          top: 41, left: 53, right: 53, bottom: 7)
                      .w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      avatar("1".webp),
                      Image.asset('heart'.png, fit: BoxFit.cover),
                      avatar("4".webp),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3)
                            .w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24.r)),
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFFfe9b90),
                            Color(0xFFff6d5c),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xFFff6666).withOpacity(0.25),
                              blurRadius: 4.w,
                              spreadRadius: 0,
                              offset: const Offset(0, 0))
                        ]),
                    child: Text(
                      "亲密热度65%",
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.only(left: 32, bottom: 24, top: 24).w,
                    // color: blendedColor,
                    child: Text(
                      "亲密热度会根据互动、交流等行为分析评定",
                      style: TextStyle(
                          color: const Color(0xff9E9E9E), fontSize: 12.sp),
                    )),
                Expanded(
                  child: ListView.builder(
                    itemCount: jsonList.length,
                    itemBuilder: (context, index) {
                      var data = jsonList[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 32).w,
                        margin: const EdgeInsets.only(bottom: 40).w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data["title"],
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                    )),
                                SizedBox(height: 9.w),
                                Text(data["text"],
                                    style: TextStyle(
                                      color: const Color(0xff9E9E9E),
                                      fontSize: 12.sp,
                                    ))
                              ],
                            ),
                            Container(
                              width: 80.w,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6).w,
                              decoration: BoxDecoration(
                                  color: const Color(0xffEDEDED),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.r))),
                              child: Center(child: Text(data["btnText"])),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }

  Container avatar(String path) {
    return Container(
      padding: EdgeInsets.all(2.0.w),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: const Color(0xFFff6666).withOpacity(0.25),
                blurRadius: 4.w,
                spreadRadius: 0,
                offset: const Offset(0, 0))
          ]),
      child: ClipOval(
        child: Image.asset(
          path,
          width: 66.w,
        ),
      ),
    );
  }
}
