enum Status {
  initial,
  loading,
  loadingMore,
  success,
  failure,
}

enum VariantOption {
  size,
  color,
}

const Map<String, VariantOption> variantOptionMap = {
  'size': VariantOption.size,
  'color': VariantOption.color,
};
