import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeay/service.dart';
import 'model.dart';

class ControllerTab extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxList pagination = [].obs;
  int limit = 0;
  TabController? tabController;
  final searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  Rx<Yeay> yay = Yeay(items: []).obs;
  RxBool isSelect = false.obs;
  RxBool isLoading = true.obs;

  void dataPost(int limit, {required String value}) async {
    try {
      isLoading(true);
      var result = await ApiService().getdata(value, 0);
      if (result.items.isNotEmpty) {
        pagination.addAll(result.items);
      }
      yay.value = result;
    } finally {
      isLoading(false);
    }
  }

  void data({required String value}) async {
    try {
      limit++;
      var result = await ApiService().getdata(value, limit);
      if (result.items.isNotEmpty) {
        pagination.addAll(result.items);
      }
      yay.value = result;
    } catch (e) {}
  }

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    dataPost(0, value: searchController.text);
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          isSelect.value = true;
          data(value: searchController.text);
        }
      },
    );
    super.onInit();
  }
}
