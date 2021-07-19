import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizary/utils/page_route/navigator.dart';
import 'package:sizary/widget/text_view_widget.dart';

class SlideScreen extends StatelessWidget {
  final String image;
  final String svg;
  final String text1;
  final String text2;
  final Color color;
  final Color textColor;
  int currentIndexPage;
  int pageLength;

  SlideScreen({
    @required this.image,
    @required this.svg,
    @required this.text1,
    @required this.text2,
    @required this.color, this.textColor, this.currentIndexPage=0, this.pageLength=5});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(image),
                fit: BoxFit.cover,
              )
          ),
        ),
        Positioned(
          bottom: 0,
          child: SvgPicture.asset(svg,color: color,),
        ),

        Positioned(
          bottom: 70,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                TextViewWidget(
                  textAlign: TextAlign.center,
                  text: text1,
                  color: textColor,
                  textSize: 30,
                  fontWeight: FontWeight.bold,),
                SizedBox(height: 15,),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left:10.0, right: 10.0),
                    child: TextViewWidget(
                      textAlign: TextAlign.center,
                      text: text2,
                      color: textColor, textSize: 14,
                      fontWeight: FontWeight.w200,),
                  ),
                ),
                SizedBox(height: 30,),
                InkWell(
                  onTap: ()=>PageRouter.gotoNamed(Routes.LOGIN, context),
                    child: TextViewWidget(
                        text: 'Next', textSize: 21,
                        fontWeight: FontWeight.bold,
                        color: textColor))
              ],
            ),
          ),
        ),
      ],
        ),
    );
  }
}
