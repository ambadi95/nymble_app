import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nymble_app/src/screens/home_screen/controller/home_screen_controller.dart';
import 'package:nymble_app/src/widgets/carousal_slider.dart';
import 'package:nymble_app/src/widgets/circular_card.dart';
import 'package:nymble_app/src/widgets/custom_appbar.dart';
import '../../../widgets/square_card.dart';
import '../model/model_class.dart' as data;

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        didChangeDependencies: (con) async {
          await con.controller!.loadData();
        },
        builder: (controller) => Scaffold(
              bottomNavigationBar: Container(
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: const Center(
                  child: Icon(
                    Icons.home_filled,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              appBar: const CustomAppBar(
                label: 'Welcome onBoard',
              ),
              body: controller.responseData == null
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.responseData!.widgets!.length,
                          itemBuilder: (_, index) {
                            return controller
                                        .responseData!.widgets![index].type ==
                                    'banner'
                                ? _carousalView(
                                    controller,
                                    controller
                                        .responseData!.widgets![index].items)
                                : _horizontalCardView(
                                    controller,
                                    controller
                                        .responseData!.widgets![index].title,
                                    controller
                                        .responseData!.widgets![index].items);
                          }),
                    ),
            ));
  }

  Widget _height(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget _carousalView(HomeScreenController controller, List<data.Item>? item) {
    return Column(
      children: [
        CarousalSlider(
          key: const Key("carousalWidget"),
          itemCount: item!.length,
          items: item,
        ),
        _height(20)
      ],
    );
  }

  Widget _horizontalCardView(
      HomeScreenController controller, String? header, List<data.Item>? item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            header!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        _height(20),
        SizedBox(
          height: 170,
          child: ListView.builder(
              key: const Key('circularCardBuilder'),
              scrollDirection: Axis.horizontal,
              itemCount: item!.length,
              itemBuilder: (ctx, index) {
                return item[index].type == "box_item"
                    ? SquareCard(
                        key: const Key("squareCardWidget"),
                        label: item[index].text!,
                        image: item[index].image ?? "",
                        padding: item[index].padding ?? 12.00,
                        borderRadius: item[index].borderRadius ?? 10,
                      )
                    : CircularCard(
                        key: const Key("circularCard"),
                        label: item[index].text!,
                        image: item[index].image ?? "",
                        padding: item[index].padding ?? 12.00,
                        borderRadius: item[index].borderRadius ?? 100,
                      );
              }),
        ),
        _height(20)
      ],
    );
  }
}
