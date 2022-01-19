import 'package:flutter/material.dart';

import 'paga_view_item.dart';

class CustomPageView extends StatelessWidget {

  final PageController? pageController;


  CustomPageView({required this.pageController});



  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const
      BouncingScrollPhysics(),
      controller: pageController,
      children: [

        PageViewItem(
            title: 'E Shopping',
            subTitle: 'Browse the menu and order directly from the application',
            img: 'assets/images/onboarding1.png'),



        PageViewItem(
            title: 'Delivery on the way',
            subTitle: 'Your order will be immediately collected and send by our courier',
            img: 'assets/images/onboarding2.png'),

        PageViewItem(
            title: 'Delivery Arrived',
            subTitle: 'Pick up delivery at your door and enjoy groceries',
            img: 'assets/images/onboarding3.png')

      ],
    );
  }
}
