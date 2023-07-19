import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_sqflite/controller/home_controller.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class SearchData extends SearchDelegate {
  HomeController controller = Get.put(HomeController());
  List filterData = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(
          Icons.close,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    filterData = controller.data.where(
      (element) {
        return element['title'].contains(query) ||
            element['content'].contains(query);
      },
    ).toList();

    return GetBuilder<HomeController>(
      builder: (controller) => StaggeredGridView.countBuilder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        itemCount: query.isEmpty ? controller.data.length : filterData.length,
        staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
        itemBuilder: (context, index) {
          return query.isEmpty
              ? InkWell(
                  onTap: () => controller.goToEditNotes(
                      controller.data[index]['id'],
                      controller.data[index]['title'],
                      controller.data[index]['content'],
                      controller.data[index]['dateTimeCreated']),
                  child: Card(
                    margin: const EdgeInsets.only(top: 15, left: 8, right: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: .0,
                    child: ListTile(
                      title: Text(
                        "${controller.data[index]['title']}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${controller.data[index]['content']}",
                            maxLines: 10,
                          ),
                          Text(
                            "${controller.data[index]['dateTimeCreated']}",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : InkWell(
                  onTap: () => controller.goToEditNotes(
                      controller.data[index]['id'],
                      controller.data[index]['title'],
                      controller.data[index]['content'],
                      controller.data[index]['dateTimeCreated']),
                  child: Card(
                    margin: const EdgeInsets.only(top: 15, left: 8, right: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: .0,
                    child: ListTile(
                      title: Text(
                        "${filterData[index]['title']}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${controller.data[index]['content']}",
                            maxLines: 10,
                          ),
                          Text(
                            "${controller.data[index]['dateTimeCreated']}",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
