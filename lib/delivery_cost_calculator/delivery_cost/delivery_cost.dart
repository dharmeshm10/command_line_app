class DeliveryCost {
  double calculateDeliveryCost({
    required double? baseDeliveryCost,
    required double? pkgWeight,
    required double? distance,
  }) {
    assert(baseDeliveryCost != null, 'baseDeliveryCost must not be null');
    assert(pkgWeight != null, 'pkgWeight must not be null');
    assert(distance != null, 'distance must not be null');
    if (baseDeliveryCost! < 0 || pkgWeight! < 0 || distance! < 0) {
      throw ArgumentError('Arguments must be non-negative');
    }
    if (baseDeliveryCost == null || pkgWeight == null || distance == null) {
      throw ArgumentError('Arguments cannot be null');
    }
    return baseDeliveryCost + (pkgWeight * 10) + (distance * 5);
  }
}
