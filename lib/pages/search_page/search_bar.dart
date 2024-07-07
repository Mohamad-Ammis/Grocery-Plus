import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/search_controller.dart';


class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final controller = Get.put(SearchPageController());
  bool showFilter = false;
  int counter = 0;
  var isCategory = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color:  Colors.white,
          ),
      child: Column(
        children: [
          Container(
            
            margin: const EdgeInsets.only(left: 10, right: 40, top: 0, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 8),
                    margin: const EdgeInsets.only(left: 30, top: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey, width: 0.2)),
                    child: TextField(
                      onChanged: (data) {
                        controller.filterSearch(data);
                        print('asas');
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Search here...",
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.2)),
                        prefixIcon: const Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: isCategory == false
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              if (counter.isEven) {
                                showFilter = true;
                              } else {
                                showFilter = false;
                              }
                              counter++;
                            });
                          },
                          icon: const Icon(
                            Icons.filter_list,
                            color: Colors.white,
                          ))
                      : Container(),
                )
              ],
            ),
          ),
          showFilter == true
              ? SizedBox(
                  height: 60,
                  child: ListView.builder(
                      itemCount: controller.categoryNames.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.filterCategory(index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF0F1F2),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Text(
                                  controller.categoryNames[index],
                                  style: const TextStyle(
                                      fontFamily: 'Poppins', fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              : Container()
        ],
      ),
    );
  }
}
