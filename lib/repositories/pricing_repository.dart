class PricingRepository {
  int basePrice = 0;

  int getSandwichPrice(bool isFootlong) {
    int breadPrice = isFootlong ? 11 : 7;
    return basePrice + breadPrice;
  }
}
