import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sizary/sign_in_screen/provider.dart';
import 'package:sizary/sign_in_screen/sign_in.dart';
import 'package:sizary/splashscreen/splashscreen.dart';
import 'package:sizary/utils/colors.dart';
import 'package:sizary/utils/helper/pref_manage.dart';
import 'package:sizary/utils/page_route/route.dart';
import 'package:sizary/utils/providers/provider.dart';

import 'dashboard/client_dashboard_screen.dart';
import 'dashboard/tailor_dashboard_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColor.purple));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.getProviders,
      child: MaterialApp(
        title: 'Sizary',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        routes: Routes.getRoutes,
      ),
    );
  }
}

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  SharedPreferencesHelper preferencesHelper;
  String email;
  bool newUser;
  AuthenticationProfile profile;
  String prefType;


  @override
  void initState() {
    preferencesHelper = SharedPreferencesHelper();
    profile = Provider.of<AuthenticationProfile>(context, listen: false);
    profile.initialize(context);
    getEmail();
    super.initState();
  }

  getEmail() async {
    newUser = await preferencesHelper.doesExists(key: 'email');
    email =
    !newUser ? "" : await preferencesHelper.getStringValues(key: 'email');
    prefType = await preferencesHelper.getStringValues(key: 'login_type');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (email == null)
      return SpinKitCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
                color: index.isEven ? AppColor.white : AppColor.purple,
                shape: BoxShape.circle),
          );
        },
      );
    if (email == "" ) return SplashScreen();
    else if(email != "" &&  prefType == 'client')
      return ClientDashboard();
    return TailorDashBoard();
  }
}
