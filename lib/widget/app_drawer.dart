import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizary/sign_in_screen/provider.dart';
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
            listTileWidget(
              screen: null,
              svg:'assets/measuring_tape.svg',
            text: 'Log Out'),
          ],
        ),
      ),
    );
  }

  Widget listTileWidget({Widget screen, String svg, String text})=>ListTile(
    onTap: ()=>screen==null?
    profile.isAuthentificated = false:
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => screen),
  ),
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
