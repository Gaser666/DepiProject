import 'package:depi_project/core/utils/widgets/api_services.dart';
import 'package:depi_project/features/home/data/models/product_model.dart';

class AllProductService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await ApiServices().get(url: 'https://fakestoreapi.com/products');
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromjson(data[i]));
    }
    return productsList;
  }

  
}