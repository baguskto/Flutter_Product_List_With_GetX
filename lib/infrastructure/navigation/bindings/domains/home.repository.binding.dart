import 'package:kreditplus_challenge/domain/product/product.repository.dart';
import 'package:kreditplus_challenge/infrastructure/data/services/product/product.service.dart';

class HomeRepositoryBinding {
  late ProductRepository _productRepository;

  ProductRepository get repository => _productRepository;

  HomeRepositoryBinding() {
    final productService = ProductService();
    _productRepository = ProductRepository(productService: productService);
  }
}
