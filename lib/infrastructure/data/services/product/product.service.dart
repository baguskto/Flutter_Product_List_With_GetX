import 'package:get/get.dart';
import 'package:kreditplus_challenge/domain/core/exceptions/default.exception.dart';
import 'package:kreditplus_challenge/domain/core/exceptions/invalid_body.exception.dart';
import 'package:kreditplus_challenge/domain/product/product.model.dart';

class ProductService {
  final _connect = Get.find<GetConnect>();

  String get _prefix => 'products';

  Future<List<Product>> getProduct() async {
    final response = (await _connect.get(_prefix,
        decoder: (value) => List<dynamic>.from(value)
            .map((e) => Product.fromMap(e as Map<String, dynamic>))
            .toList()));

    if (!response.hasError) {
      return response.body!;
    } else {
      switch (response.statusCode) {
        case 404:
          throw InvalidBodyException(message: response.statusText!);
        default:
          throw DefaultException(message: response.statusText!);
      }
    }
  }
}
