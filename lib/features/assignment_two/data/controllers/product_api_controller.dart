import 'package:get/get.dart';
import '../../../../core/network_caller/network_caller.dart';
import '../models/product_api_model.dart';
import '../services/api_services.dart';

class ProductController extends GetxController {
  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  Future<void> fetchProducts() async {
    isLoading.value = true;
    errorMessage.value = '';

    NetworkResponse response = await ApiService.fetchAllProducts();

    if (response.isSuccess) {
      productList.value = (response.responseData as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      errorMessage.value = 'Failed to load products!';
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }
}
