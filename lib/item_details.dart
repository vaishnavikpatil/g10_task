import 'package:flutter/material.dart';

import 'package:g10_task/item_model.dart';
import 'package:google_fonts/google_fonts.dart';


class ItemDetails extends StatefulWidget {
  final ItemModelBody itemdata;
  const ItemDetails({super.key, required this.itemdata});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            color: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.itemdata.title.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.itemdata.rating.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 270,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.itemdata.images!.length,
              itemBuilder: (BuildContext context, int i) {
                return Container(
                  height: 270,
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.network(
                    widget.itemdata.images![i].toString(),
                  ),
                );
              },
            ),
          ),
          Container(
              width: double.infinity,
              color: Colors.black87,
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "${widget.itemdata.description}\nPrice : ${widget.itemdata.price}\nDiscount Percentage : ${widget.itemdata.discountPercentage}\nStock : ${widget.itemdata.stock}\nBrand : ${widget.itemdata.brand}\nCategory : ${widget.itemdata.category}\n",
                          style: GoogleFonts.poppins(
                              color: Colors.white54,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                        ),
                      ])))
        ],
      ),
    );
  }
}
