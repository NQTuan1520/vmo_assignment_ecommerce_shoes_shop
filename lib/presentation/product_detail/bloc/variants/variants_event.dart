part of 'variants_bloc.dart';

class VariantsEvent extends Equatable {
  const VariantsEvent();

  @override
  List<Object?> get props => [];
}

class FetchVariants extends VariantsEvent {
  final String productId;

  const FetchVariants(this.productId);

  @override
  List<Object?> get props => [productId];
}

// class FetchAssets extends VariantsEvent {
//   final String productId;
//
//   const FetchAssets(this.productId);
//
//   @override
//   List<Object?> get props => [productId];
// }

class SelectColor extends VariantsEvent {
  final String productId;
  final String variantGroupId;
  final String optionId;
  final String assetId;

  const SelectColor({
    required this.productId,
    required this.variantGroupId,
    required this.optionId,
    required this.assetId,
  });

  @override
  List<Object> get props => [productId, variantGroupId, optionId, assetId];
}

class SelectOption extends VariantsEvent {
  final String variantGroupId;
  final String optionId;

  const SelectOption(this.variantGroupId, this.optionId);

  @override
  List<Object> get props => [variantGroupId, optionId];
}

class FetchCategories extends VariantsEvent {
  final ProductDataEntity product;

  const FetchCategories(this.product);

  @override
  List<Object> get props => [product];
}

class ResetProductState extends VariantsEvent {}

class AddToCart extends VariantsEvent {
  final String productId;
  final int quantity;
  final Map<String, String> selectedOptions;

  const AddToCart({required this.productId, required this.quantity, required this.selectedOptions});

  @override
  List<Object> get props => [productId, quantity, selectedOptions];
}

class CreateCart extends VariantsEvent {}

class IncreaseQuantity extends VariantsEvent {}

class DecreaseQuantity extends VariantsEvent {}
