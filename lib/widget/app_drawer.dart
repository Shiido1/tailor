import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizary/instance_helper/instances.dart';
import 'package:sizary/sign_in_screen/provider.dart';
import 'package:sizary/sign_in_screen/sign_in.dart';
import 'package:sizary/tailor_category/tailor_category_screen.dart';
import 'package:sizary/utils/colors.dart';
import 'package:sizary/widget/text_view_widget.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  AuthenticationProfile profile;
  bool value;

  @override
  void initState() {
    profile = Provider.of<AuthenticationProfile>(context, listen: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150, bottom: 120,left: 120),
      child: Drawer(
        child: ListView(
          children: [
            listTileWidget(
              screen: TailorCategory(),
              svg:'assets/measuring_tape.svg',
            text: 'Tailor Category'),
            listTileWidgetLogOut(
              screen: SignInScreen(),
              svg:'assets/measuring_tape.svg',
            text: 'Log Out'),
          ],
        ),
      ),
    );
  }

  Widget listTileWidget({Widget screen, String svg, String text})=>ListTile(
    onTap: () {
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => screen),
      );
    },
    leading: Container(
        height: 35,
        width: 35,
        child: SvgPicture.asset(svg)),
    title: TextViewWidget(
      text: text,
      textSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColor.black,),);

  Widget listTileWidgetLogOut({Widget screen, String svg, String text})=>ListTile(
    onTap: () async {
      await preferencesHelper.remove();
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => screen),
      );
    },
    leading: Container(
        height: 35,
        width: 35,
        child: SvgPicture.asset(svg)),
    title: TextViewWidget(
      text: text,
      textSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColor.black,),);

}
