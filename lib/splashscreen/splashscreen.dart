import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:sizary/splashscreen/slide_screen.dart';
import 'package:sizary/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  int pageLength = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          PageView(
          onPageChanged: (value) {
            setState(() => currentPage = value);
          },
          children: [
            SlideScreen(
              textColor: AppColor.white,
              image: 'assets/fabrics.jpeg',
              text1: 'Secure Storage',
              text2: 'We store all your data on secure cloud storage.So you will never\n loose your data,even if you lose your phone.\nYou can retrieve the data from any Android Phone.',
              svg: 'assets/rectangle1.svg',
              color: AppColor.purple,),
            SlideScreen(
              textColor: AppColor.white,
              image: 'assets/portrait-tailor-holding-coffee.jpg',
              text1: 'Design Sharing',
              text2: 'Share your gallery with your tailor and invite to make the design\n of your choice.',
              svg: 'assets/rectangle1.svg',
              color: AppColor.topGreen,),
            SlideScreen(
              textColor: AppColor.white,
              image: 'assets/footer.jpg',
              text1: 'Fabric Management',
              text2: 'Manage and maintain your digital images on the basis of color,\n weave, blend, quality, price.',
              svg: 'assets/rectangle1.svg',
              color: AppColor.textColor,),
            SlideScreen(
              textColor: AppColor.black,
              image: 'assets/image4.png',
              text1: 'Manage Tailors',
              text2: 'Sizary app is specially designed for Tailors to manage their Tailor\n Shop. This includes, Order Management, Customer Management,\nMeasurement Management etc.',
              svg: 'assets/rectangle1.svg',
              color: AppColor.white,),
            SlideScreen(
              textColor: AppColor.white,
              image: 'assets/tailor.jpeg',
              text1: 'YourFit',
              text2: 'Remove the confusion for your customers by making their fit\n choice more simple',
              svg: 'assets/rectangle1.svg',
              color: AppColor.brown,),
          ],
        ),

          Positioned(
            bottom: 230,
            right: 140,
            child: Center(
              child: DotsIndicator(
                dotsCount: pageLength,
                position: double.parse(currentPage.toString()),
                decorator: DotsDecorator(
                    color: AppColor.white,
                    activeColor: AppColor.black,
                    size: Size.square(8.0),
                    activeSize: Size.square(8.0)),
              ),
            ),
          ),],
      ),
    );
  }
}
