import 'package:flutter/material.dart';
import 'package:nymble_app/src/utils/helpers.dart';

class CarousalCard extends StatelessWidget {
  final String header;
  final String footer;
  final bool isFooterIconVisible;
  final String image;
  final String color;
  const CarousalCard(
      {super.key,
      this.header = "Header",
      this.footer = "Footer",
      this.isFooterIconVisible = true,
      this.image = 'http',
      this.color = '0FF'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration:  _buildDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black26.withOpacity(0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    header,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black26.withOpacity(0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        footer,
                        maxLines: 2,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      isFooterIconVisible
                          ? const Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: Colors.white,
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Decoration _buildDecoration() {
    if (image.isNotEmpty) {
      return BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.fill,
        ),
          borderRadius: BorderRadius.circular(15)
      );
    } else {
      return BoxDecoration(
        color: color != "" ? color.toColor() : Colors.grey,
        borderRadius: BorderRadius.circular(15)
      );
    }
  }
}
