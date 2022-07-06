import 'package:flutter_screenutil/flutter_screenutil.dart';


/*
 ScreenUtil().pixelRatio;        // 设备的像素密度
  ScreenUtil().screenWidth        // 设备宽度
  ScreenUtil().setHeight          // 设备高度
  ScreenUtil().bottomBarHeight    // 底面安全距离，适用于全面屏下面的按钮的
  ScreenUtil().statusBarHeight    // 状态栏高度  刘海屏会更高  单位px
  ScreenUtil().textScaleFactor    // 系统字体缩放比例

  ScreenUtil().scaleWidth         // 实际宽度dp与设计稿px的比例
  ScreenUtil().scaleHeight        // 实际高度dp与设计稿px的比例
*/

double duSetWidth(double width) {
  return ScreenUtil().setWidth(width);
}

double duSetHeight(double height) {
  return ScreenUtil().setHeight(height);
}

double duSetFontSize(double fontSize) {
  return ScreenUtil().setSp(fontSize);
}