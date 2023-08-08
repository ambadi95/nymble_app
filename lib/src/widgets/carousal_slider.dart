import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nymble_app/src/screens/home_screen/model/model_class.dart'
    as model;
import 'package:nymble_app/src/widgets/carousal_card.dart';

class CarousalSlider extends StatefulWidget {
  final int itemCount;
  final List<model.Item> items;
  const CarousalSlider(
      {super.key, required this.itemCount, required this.items});

  @override
  State<CarousalSlider> createState() => _CarousalSliderState();
}

class _CarousalSliderState extends State<CarousalSlider> {
  List itemColors = [Colors.green, Colors.purple, Colors.blue];
  int currentIndex = 0;
  late final PageController pageController;
  final ScrollController _scrollController = ScrollController();
  int pageNo = 0;

  Timer? carousalTimer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == widget.itemCount) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    );

    carousalTimer = getTimer();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showBtmAppBr = false;
        setState(() {});
      } else {
        showBtmAppBr = true;
        setState(() {});
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  bool showBtmAppBr = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  pageNo = index;
                });
              },
              itemCount: widget.itemCount,
              itemBuilder: (_, index) {
                return AnimatedBuilder(
                    animation: pageController,
                    builder: (ctx, child) {
                      return child!;
                    },
                    child: GestureDetector(
                      child: CarousalCard(
                        header: widget.items[index].headerText!,
                        footer: widget.items[index].footerText!,
                        isFooterIconVisible: widget.items[index].footerIcon!,
                        image: widget.items[index].image != null
                            ? widget.items[index].image!
                            : "",
                        color: widget.items[index].color != null
                            ? widget.items[index].color!
                            : "",
                      ),
                      onPanDown: (d) {
                        carousalTimer?.cancel();
                        carousalTimer = null;
                      },
                      onPanCancel: () {
                        carousalTimer = getTimer();
                      },
                    ));
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.itemCount,
              (index) => GestureDetector(
                child: Container(
                  margin: const EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.circle,
                    size: 12.0,
                    color: pageNo == index
                        ? Colors.indigoAccent
                        : Colors.grey.shade300,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
