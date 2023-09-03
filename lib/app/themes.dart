import "package:flutter/material.dart";
import "package:pawpath/app/util.dart";

class AppColors {
  static const Color primary_100 = Color.fromRGBO(209, 150, 110, 1);
  static const Color primary_200 = Color.fromRGBO(215, 161, 125, 1);
  static const Color primary_300 = Color.fromRGBO(221, 173, 141, 1);
  static const Color primary_400 = Color.fromRGBO(227, 184, 156, 1);
  static const Color primary_500 = Color.fromRGBO(232, 196, 172, 1);
  static const Color primary_600 = Color.fromRGBO(237, 207, 189, 1);

  static const Color light_100 = Color.fromRGBO(251, 251, 251, 1);
  static const Color light_200 = Color.fromRGBO(239, 239, 239, 1);
  static const Color light_300 = Color.fromRGBO(220, 220, 220, 1);
  static const Color light_400 = Color.fromRGBO(189, 189, 189, 1);
  static const Color light_500 = Color.fromRGBO(152, 152, 152, 1);
  static const Color light_600 = Color.fromRGBO(124, 124, 124, 1);

  static const Color dark_100 = Color.fromRGBO(18, 18, 18, 1);
  static const Color dark_200 = Color.fromRGBO(40, 40, 40, 1);
  static const Color dark_300 = Color.fromRGBO(63, 63, 63, 1);
  static const Color dark_400 = Color.fromRGBO(87, 87, 87, 1);
  static const Color dark_500 = Color.fromRGBO(113, 113, 113, 1);
  static const Color dark_600 = Color.fromRGBO(139, 139, 139, 1);

  static const Color shadowColor = Color.fromRGBO(117, 118, 122, 0.1);

  static Color backgroundPrimary(BuildContext context) =>
      isLightTheme(context) ? light_200 : dark_100;
  static Color backgroundSecondary(BuildContext context) =>
      isLightTheme(context) ? light_100 : dark_200;

  static Color textPrimary(BuildContext context) =>
      isLightTheme(context) ? dark_100 : light_100;
  static Color textSecondary(BuildContext context) =>
      isLightTheme(context) ? dark_500 : light_500;
}

class AppShadows {
  static const BoxShadow top = BoxShadow(
    color: AppColors.shadowColor,
    offset: Offset(0, -4),
    blurRadius: 6,
  );
  static const BoxShadow bottom = BoxShadow(
    color: AppColors.shadowColor,
    offset: Offset(0, 4),
    blurRadius: 6,
  );
}

class AppSpacing {
  /// 0px
  static const double p0 = 0;

  /// 2px
  static const double p0_5 = 2;

  /// 4px
  static const double p1 = 4;

  /// 6px
  static const double p1_5 = 6;

  /// 8px
  static const double p2 = 8;

  /// 10px
  static const double p2_5 = 10;

  /// 12px
  static const double p3 = 12;

  /// 14px
  static const double p3_5 = 14;

  /// 16px
  static const double p4 = 16;

  /// 20px
  static const double p5 = 20;

  /// 24px
  static const double p6 = 24;

  /// 28px
  static const double p7 = 28;

  /// 32px
  static const double p8 = 32;

  /// 36px
  static const double p9 = 36;

  /// 40px
  static const double p10 = 40;

  /// 44px
  static const double p11 = 44;

  /// 48px
  static const double p12 = 48;

  /// 56px
  static const double p14 = 56;

  /// 64px
  static const double p16 = 64;

  /// 80px
  static const double p20 = 80;

  /// 96px
  static const double p24 = 96;

  /// 112px
  static const double p28 = 112;

  /// 128px
  static const double p32 = 128;

  /// 144px
  static const double p36 = 144;

  /// 160px
  static const double p40 = 160;

  /// 176px
  static const double p44 = 176;

  /// 192px
  static const double p48 = 192;

  /// 208px
  static const double p52 = 208;

  /// 224px
  static const double p56 = 224;

  /// 240px
  static const double p60 = 240;

  /// 256px
  static const double p64 = 256;

  /// 288px
  static const double p72 = 288;

  /// 320px
  static const double p80 = 320;

  /// 384px
  static const double p96 = 384;
}
