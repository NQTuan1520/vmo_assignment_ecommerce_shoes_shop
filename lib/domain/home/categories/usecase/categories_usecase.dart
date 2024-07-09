import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/categories/entity/category_data_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/categories/entity/category_meta_entity.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/domain/home/categories/repository/category_repository.dart';
import 'package:vmo_assignment_ecommerce_shoes_shop/managers/base_response/base_response.dart';

class CategoriesUseCase {
  final CategoryRepository _categoryRepository;

  CategoriesUseCase(this._categoryRepository);

  Future<BaseResponse<List<CategoryDataEntity>, List<CategoryMetaEntity>>> getCategories() async {
    return _categoryRepository.getCategories();
  }
}