part of 'product_detail_bloc.dart';

class ProductDetailState extends Equatable {
  final Status status;
  final bool isDescriptionExpanded;
  final String? errorMessage;

  const ProductDetailState({
    this.status = Status.initial,
    this.isDescriptionExpanded = false,
    this.errorMessage,
  });

  ProductDetailState copyWith({
    Status? status,
    bool? isDescriptionExpanded,
    String? errorMessage,
  }) {
    return ProductDetailState(
      status: status ?? this.status,
      isDescriptionExpanded: isDescriptionExpanded ?? this.isDescriptionExpanded,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, isDescriptionExpanded, errorMessage];
}
