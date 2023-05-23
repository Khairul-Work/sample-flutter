class ProductApi {
  Future<bool> isExist(int id) async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }
}
