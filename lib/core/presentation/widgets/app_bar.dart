import 'package:demo2/l10n/app_localizations_vi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../l10n/app_localizations.dart';
import '../../resources/palette.dart';
import 'custome_dialog.dart';

class BaseAppBar extends AppBar {
  BaseAppBar({
    super.key,
    required this.label,
    super.elevation,
    this.action,
    this.hasBackButton = true,
    this.hasAction = true,
    this.onTapBack,
    this.onTapAction,
    super.backgroundColor,
    this.onQuiz = false,
    this.inApp = true,
  });

  final String label;
  final Widget? action;
  final bool hasBackButton;
  final bool hasAction;
  final Function()? onTapBack;
  final Function()? onTapAction;
  final bool onQuiz;
  final bool inApp;

  @override
  State<AppBar> createState() => _BaseAppBarState();
}

class _BaseAppBarState extends State<BaseAppBar> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      leading: widget.hasBackButton
          ? GestureDetector(
        onTap: () => _back(context),
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Icon(
            Icons.arrow_back,
            size: 22.w,
            color: Palette.textOnBg,
          ),
        ),
      )
          : const SizedBox.shrink(),
      leadingWidth: 48.w,
      elevation: 0,
      title: Text(
        widget.label,
        style: textTheme.titleMedium?.copyWith(color: Palette.titleText),
      ),
      actions: widget.hasAction
          ? [
      ]
          : null,
      backgroundColor: widget.backgroundColor ?? Palette.bgScreen,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  Future<void> _back(BuildContext context) async {
    if (widget.onQuiz) {
      final shouldExit = await showCustomDialog(context);
      if (shouldExit) {
        Navigator.pushNamed(context, '/home');
      }
    } else {
      if (widget.inApp){
        Navigator.pushNamed(context, '/home');
      }
      else {
        Navigator.pop(context);
      }
    }
  }

  Future<bool> showCustomDialog(BuildContext context) async {
    bool? result;
    var lang = AppLocalizations.of(context);
    await showDialog<bool>(
      context: context,
      builder: (context) => CustomDialog(
        isPositive: false,
        title: lang!.warning,
        textButtonLeft: lang.continueToDo,
        textButtonRight: lang.exit,
        content: lang.resultWarning,
        onButtonLeft: () {
          Navigator.of(context).pop(false); // Tiếp tục -> trả về false
        },
        isSingle: false,
        onButtonRight: () {
          Navigator.of(context).pop(true); // Thoát -> trả về true
        },
      ),
    ).then((value) {
      result;{ result = value ?? false;
      }});
      return result!;
    }
  }

