extension RepeatList<T> on List<T> {
  List<T> repeat(int times) {
    return List.generate(length * times, (index) {
      return this[index % length];
    });
  }
  // ex:
  // var list = (ischoolerAllModel.items).repeat(5);
}
