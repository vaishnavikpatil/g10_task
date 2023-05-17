import 'package:flutter/material.dart';
import 'package:g10_task/item_class.dart';
import 'package:g10_task/item_details.dart';
import 'package:g10_task/item_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<ItemModelBody> itemlist = [];

  @override
  void initState() {
    super.initState();
    readdata().then((data) {
      setState(() {
        itemlist.clear();
        itemlist = data;
      });
    });
  }

  readdata() async {
    var provider = Provider.of<ItemClass>(context, listen: false);
    await provider.item();
    return provider.itemList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: itemlist.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Column(
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
                        Expanded(
                          child: Text(
                            itemlist[index].title.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              itemlist[index].rating.toString(),
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
                    itemCount: itemlist[index].images!.length+1,
                    itemBuilder: (BuildContext context, int i) {
                      return Container(
                        height: 270,
                        width: double.infinity,
                        color: Colors.white,
                        child: Image.network(
                          i==0?itemlist[index].thumbnail.toString(): itemlist[index].images![i-1].toString(),
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
                            itemlist[index].description.toString(),
                            style: GoogleFonts.poppins(
                                color: Colors.white54,
                                fontWeight: FontWeight.normal,
                                fontSize: 16),
                          ),
                          const SizedBox(height: 30),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ItemDetails(
                                            itemdata: itemlist[index],
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "Book Now",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.black54,
                )
              ],
            );
          }),
    );
  }
}
