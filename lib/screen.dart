import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class screen extends StatelessWidget {
  final controller = Get.put(ControllerTab());
  screen({Key? key}) : super(key: key);
  Timer? _debounce;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Column(
          children: [
            TextFormField(
              scrollPadding: const EdgeInsets.only(top: 30),
              onChanged: _onSearchChanged,
              controller: controller.searchController,
              cursorHeight: 25,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 15),
                hintText: "@usernames,#hashtags",
                prefixIcon: const Icon(
                  Icons.search_sharp,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  splashColor: Colors.transparent,
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    controller.searchController.clear();
                    controller.pagination.value.clear();
                  },
                ),
                suffix: Obx(
                  () => controller.isLoading.value
                      ? SizedBox(
                          height: 7.0,
                          width: 7.0,
                          child: Transform.scale(
                            scale: 2,
                            child: const CircularProgressIndicator(
                              strokeWidth: 1,
                              color: Color(0XFF00FF44),
                            ),
                          ),
                        )
                      : const SizedBox(height: 0),
                ),
              ),
            ),
            TabBar(
              indicatorWeight: 2,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              controller: controller.tabController,
              tabs: const [
                Tab(text: "products"),
                Tab(text: "creators"),
                Tab(text: "Hashtags"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  Obx(
                    () => controller.searchController.text.isNotEmpty &&
                            controller.yay.value.items.isEmpty
                        ? Center(
                            child: SizedBox(
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.search_off_outlined,
                                    size: 75,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "No Results Found",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ),
                          )
                        : SizedBox(
                            child: ListView.builder(
                              controller: controller.scrollController,
                              physics: const BouncingScrollPhysics(),
                              itemCount: controller.pagination.value.length,
                              itemBuilder: (context, index) {
                                var data = controller.pagination.value[index];
                                return data.type == 4
                                    ? Column(
                                        children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                data.thumbnailUrl ??
                                                    " no image found",
                                              ),
                                              backgroundColor: Colors.grey,
                                              radius: 24,
                                            ),
                                            title: Text(
                                              "${data.title}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            subtitle: Text(
                                              "${data.entityId}",
                                              style: const TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          controller.pagination.value.length -
                                                      1 ==
                                                  index
                                              ? SizedBox(
                                                  height: 15.0,
                                                  width: 15.0,
                                                  child: Transform.scale(
                                                    scale: 2,
                                                    child:
                                                        const CircularProgressIndicator(
                                                      strokeWidth: 1,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                )
                                              : const SizedBox(),
                                        ],
                                      )
                                    : SizedBox();
                              },
                            ),
                          ),
                  ),
                  Obx(
                    () => controller.searchController.text.isNotEmpty &&
                            controller.yay.value.items.isEmpty
                        ? Center(
                            child: SizedBox(
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.search_off_outlined,
                                    size: 75,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "No Results Found",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ),
                          )
                        : SizedBox(
                            child: ListView.builder(
                              controller: controller.scrollController,
                              physics: const BouncingScrollPhysics(),
                              itemCount: controller.pagination.value.length,
                              itemBuilder: (context, index) {
                                var data = controller.pagination.value[index];
                                return data.type == 1
                                    ? Column(
                                        children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                data.thumbnailUrl ??
                                                    " no image found",
                                              ),
                                              backgroundColor: Colors.grey,
                                              radius: 24,
                                            ),
                                            title: Row(
                                              children: [
                                                Text(
                                                  "@${data.title}",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          controller.pagination.value.length -
                                                      1 ==
                                                  index
                                              ? SizedBox(
                                                  height: 15.0,
                                                  width: 15.0,
                                                  child: Transform.scale(
                                                    scale: 2,
                                                    child:
                                                        const CircularProgressIndicator(
                                                      strokeWidth: 1,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                )
                                              : const SizedBox(),
                                        ],
                                      )
                                    : SizedBox();
                              },
                            ),
                          ),
                  ),
                  Obx(
                    () => controller.searchController.text.isNotEmpty &&
                            controller.yay.value.items.isEmpty
                        ? Center(
                            child: SizedBox(
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.search_off_outlined,
                                    size: 75,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "No Results Found",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ),
                          )
                        : SizedBox(
                            child: ListView.builder(
                              controller: controller.scrollController,
                              physics: const BouncingScrollPhysics(),
                              itemCount: controller.pagination.value.length,
                              itemBuilder: (context, index) {
                                var data = controller.pagination.value[index];
                                return data.type == 3
                                    ? Column(
                                        children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                data.thumbnailUrl ??
                                                    " no image found",
                                              ),
                                              backgroundColor: Colors.grey,
                                              radius: 24,
                                            ),
                                            title: Text(
                                              "#${data.title}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          controller.pagination.value.length -
                                                      1 ==
                                                  index
                                              ? SizedBox(
                                                  height: 15.0,
                                                  width: 15.0,
                                                  child: Transform.scale(
                                                    scale: 2,
                                                    child:
                                                        const CircularProgressIndicator(
                                                      strokeWidth: 1,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                )
                                              : const SizedBox(),
                                        ],
                                      )
                                    : SizedBox();
                              },
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onSearchChanged(String query) {
    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {
        if (_debounce!.isActive == false) {
          controller.dataPost(0, value: controller.searchController.text);
        }
      },
    );
  }
}
