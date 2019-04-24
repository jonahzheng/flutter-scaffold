import 'package:flutter/material.dart';

///颜色
class MyColors {
  static const String primaryValueString = "#24292E";
  static const String primaryLightValueString = "#42464b";
  static const String primaryDarkValueString = "#121917";
  static const String miWhiteString = "#ececec";
  static const String actionBlueString = "#267aff";
  static const String webDraculaBackgroundColorString = "#282a36";

  static const int primaryValue = 0xFF24292E;
  static const int primaryLightValue = 0xFF42464b;
  static const int primaryDarkValue = 0xFF121917;

  static const int cardWhite = 0xFFFFFFFF;
  static const int textWhite = 0xFFFFFFFF;
  static const int miWhite = 0xffececec;
  static const int white = 0xFFFFFFFF;
  static const int actionBlue = 0xff267aff;
  static const int subTextColor = 0xff959595;
  static const int subLightTextColor = 0xffc4c4c4;

  static const int mainBackgroundColor = miWhite;

  static const int mainTextColor = primaryDarkValue;
  static const int textColorWhite = white;

  static const MaterialColor primarySwatch = const MaterialColor(
    primaryValue,
    const <int, Color>{
      50: const Color(primaryLightValue),
      100: const Color(primaryLightValue),
      200: const Color(primaryLightValue),
      300: const Color(primaryLightValue),
      400: const Color(primaryLightValue),
      500: const Color(primaryValue),
      600: const Color(primaryDarkValue),
      700: const Color(primaryDarkValue),
      800: const Color(primaryDarkValue),
      900: const Color(primaryDarkValue),
    },
  );
}

///文本样式
class MyTextStyle {

  static const String app_default_share_url = "";

  static const lagerTextSize = 30.0;
  static const bigTextSize = 23.0;
  static const normalTextSize = 18.0;
  static const middleTextWhiteSize = 16.0;
  static const smallTextSize = 14.0;
  static const minTextSize = 12.0;

  static const minText = TextStyle(
    color: Color(MyColors.subLightTextColor),
    fontSize: minTextSize,
  );

  static const smallTextWhite = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: smallTextSize,
  );

  static const smallText = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: smallTextSize,
  );

  static const smallTextBold = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: smallTextSize,
    fontWeight: FontWeight.bold,
  );

  static const smallSubLightText = TextStyle(
    color: Color(MyColors.subLightTextColor),
    fontSize: smallTextSize,
  );

  static const smallActionLightText = TextStyle(
    color: Color(MyColors.actionBlue),
    fontSize: smallTextSize,
  );

  static const smallMiLightText = TextStyle(
    color: Color(MyColors.miWhite),
    fontSize: smallTextSize,
  );

  static const smallSubText = TextStyle(
    color: Color(MyColors.subTextColor),
    fontSize: smallTextSize,
  );

  static const middleText = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: middleTextWhiteSize,
  );

  static const middleTextWhite = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: middleTextWhiteSize,
  );

  static const middleSubText = TextStyle(
    color: Color(MyColors.subTextColor),
    fontSize: middleTextWhiteSize,
  );

  static const middleSubLightText = TextStyle(
    color: Color(MyColors.subLightTextColor),
    fontSize: middleTextWhiteSize,
  );

  static const middleTextBold = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: middleTextWhiteSize,
    fontWeight: FontWeight.bold,
  );

  static const middleTextWhiteBold = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: middleTextWhiteSize,
    fontWeight: FontWeight.bold,
  );

  static const middleSubTextBold = TextStyle(
    color: Color(MyColors.subTextColor),
    fontSize: middleTextWhiteSize,
    fontWeight: FontWeight.bold,
  );

  static const normalText = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: normalTextSize,
  );

  static const normalTextBold = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold,
  );

  static const normalSubText = TextStyle(
    color: Color(MyColors.subTextColor),
    fontSize: normalTextSize,
  );

  static const normalTextWhite = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: normalTextSize,
  );

  static const normalTextMitWhiteBold = TextStyle(
    color: Color(MyColors.miWhite),
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold,
  );

  static const normalTextActionWhiteBold = TextStyle(
    color: Color(MyColors.actionBlue),
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold,
  );

  static const normalTextLight = TextStyle(
    color: Color(MyColors.primaryLightValue),
    fontSize: normalTextSize,
  );

  static const largeText = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: bigTextSize,
  );

  static const largeTextBold = TextStyle(
    color: Color(MyColors.mainTextColor),
    fontSize: bigTextSize,
    fontWeight: FontWeight.bold,
  );

  static const largeTextWhite = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: bigTextSize,
  );

  static const largeTextWhiteBold = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: bigTextSize,
    fontWeight: FontWeight.bold,
  );

  static const largeLargeTextWhite = TextStyle(
    color: Color(MyColors.textColorWhite),
    fontSize: lagerTextSize,
    fontWeight: FontWeight.bold,
  );

  static const largeLargeText = TextStyle(
    color: Color(MyColors.primaryValue),
    fontSize: lagerTextSize,
    fontWeight: FontWeight.bold,
  );
}

class MyICons {
  static const String FONT_FAMILY = 'wxcIconFont';

  static const String DEFAULT_USER_ICON = 'static/images/logo.png';
  static const String DEFAULT_IMAGE = 'static/images/default_img.png';
  static const String DEFAULT_REMOTE_PIC = '';

  static const IconData HOME = const IconData(0xe624, fontFamily: MyICons.FONT_FAMILY);
  static const IconData MORE = const IconData(0xe674, fontFamily: MyICons.FONT_FAMILY);
  static const IconData SEARCH = const IconData(0xe61c, fontFamily: MyICons.FONT_FAMILY);

  static const IconData MAIN_DT = const IconData(0xe684, fontFamily: MyICons.FONT_FAMILY);
  static const IconData MAIN_QS = const IconData(0xe818, fontFamily: MyICons.FONT_FAMILY);
  static const IconData MAIN_MY = const IconData(0xe6d0, fontFamily: MyICons.FONT_FAMILY);
  static const IconData MAIN_SEARCH = const IconData(0xe61c, fontFamily: MyICons.FONT_FAMILY);

  static const IconData LOGIN_USER = const IconData(0xe666, fontFamily: MyICons.FONT_FAMILY);
  static const IconData LOGIN_PW = const IconData(0xe60e, fontFamily: MyICons.FONT_FAMILY);

  static const IconData REPOS_ITEM_USER = const IconData(0xe63e, fontFamily: MyICons.FONT_FAMILY);
  static const IconData REPOS_ITEM_STAR = const IconData(0xe643, fontFamily: MyICons.FONT_FAMILY);
  static const IconData REPOS_ITEM_FORK = const IconData(0xe67e, fontFamily: MyICons.FONT_FAMILY);
  static const IconData REPOS_ITEM_ISSUE = const IconData(0xe661, fontFamily: MyICons.FONT_FAMILY);

  static const IconData REPOS_ITEM_STARED = const IconData(0xe698, fontFamily: MyICons.FONT_FAMILY);
  static const IconData REPOS_ITEM_WATCH = const IconData(0xe681, fontFamily: MyICons.FONT_FAMILY);
  static const IconData REPOS_ITEM_WATCHED = const IconData(0xe629, fontFamily: MyICons.FONT_FAMILY);
  static const IconData REPOS_ITEM_DIR = Icons.folder;
  static const IconData REPOS_ITEM_FILE = const IconData(0xea77, fontFamily: MyICons.FONT_FAMILY);
  static const IconData REPOS_ITEM_NEXT = const IconData(0xe610, fontFamily: MyICons.FONT_FAMILY);

  static const IconData USER_ITEM_COMPANY = const IconData(0xe63e, fontFamily: MyICons.FONT_FAMILY);
  static const IconData USER_ITEM_LOCATION = const IconData(0xe7e6, fontFamily: MyICons.FONT_FAMILY);
  static const IconData USER_ITEM_LINK = const IconData(0xe670, fontFamily: MyICons.FONT_FAMILY);
  static const IconData USER_NOTIFY = const IconData(0xe600, fontFamily: MyICons.FONT_FAMILY);

  static const IconData ISSUE_ITEM_ISSUE = const IconData(0xe661, fontFamily: MyICons.FONT_FAMILY);
  static const IconData ISSUE_ITEM_COMMENT = const IconData(0xe6ba, fontFamily: MyICons.FONT_FAMILY);
  static const IconData ISSUE_ITEM_ADD = const IconData(0xe662, fontFamily: MyICons.FONT_FAMILY);

  static const IconData ISSUE_EDIT_H1 = Icons.filter_1;
  static const IconData ISSUE_EDIT_H2 = Icons.filter_2;
  static const IconData ISSUE_EDIT_H3 = Icons.filter_3;
  static const IconData ISSUE_EDIT_BOLD = Icons.format_bold;
  static const IconData ISSUE_EDIT_ITALIC = Icons.format_italic;
  static const IconData ISSUE_EDIT_QUOTE = Icons.format_quote;
  static const IconData ISSUE_EDIT_CODE = Icons.format_shapes;
  static const IconData ISSUE_EDIT_LINK = Icons.insert_link;

  static const IconData NOTIFY_ALL_READ = const IconData(0xe62f, fontFamily: MyICons.FONT_FAMILY);

  static const IconData PUSH_ITEM_EDIT = Icons.mode_edit;
  static const IconData PUSH_ITEM_ADD = Icons.add_box;
  static const IconData PUSH_ITEM_MIN = Icons.indeterminate_check_box;
}
