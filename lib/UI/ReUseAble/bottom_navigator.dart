import 'package:cuddle_care/Constants/image_constants.dart';
import 'package:cuddle_care/UI/ReUseAble/re_use_able_svg.dart';
import 'package:flutter/material.dart';

class MyBottomNavigator extends StatefulWidget {
  final int index;
  final Function onTap;
  const MyBottomNavigator({super.key, required this.index, required this.onTap});

  @override
  State<MyBottomNavigator> createState() => _MyBottomNavigatorState();
}

class _MyBottomNavigatorState extends State<MyBottomNavigator> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.index != 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*(90/812),
              width: MediaQuery.of(context).size.width*(343/375),
              // padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              // margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
              // decoration: BoxDecoration(
              //     border: Border.all(
              //         color: Colors.black
              //     )
              // ),
              child: ReUseAbleSvg(path: ImageConstants.bottomRectangle,width: MediaQuery.of(context).size.width*(343/375),height: MediaQuery.of(context).size.height*(102/812),),
            ),
            Container(
              height: MediaQuery.of(context).size.height*(90/812),
              width: MediaQuery.of(context).size.width*(343/375),
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              // margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
              // decoration: BoxDecoration(
              //     border: Border.all(
              //         color: Colors.black
              //     )
              // ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MyNavBarItem(path: ImageConstants.home2, onTap: (){
                    widget.onTap(0);
                  }  ),
                  MyNavBarItem(path: ImageConstants.pieChart2, onTap: (){
                    widget.onTap(1);
                  }),
                  MyNavBarItem(path: ImageConstants.pumpIcon, onTap: (){
                    widget.onTap(2);
                    },sizedboxHeight: 10,height: 56,width: 56,),
                  MyNavBarItem(path: ImageConstants.book2, onTap: (){
                    widget.onTap(3);
                  }),
                  MyNavBarItem(path: ImageConstants.setting2, onTap: (){
                    widget.onTap(4);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyNavBarItem extends StatelessWidget {
  final double? sizedboxHeight;
  final String path;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  const MyNavBarItem({super.key, this.sizedboxHeight , required this.path, required this.onTap, this.width , this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*((sizedboxHeight??44)/812),),
          ReUseAbleSvg(path: path,
            height: height ?? 24 ,
            width: width ?? 24 ,),
        ],
      ),
    );
  }
}

