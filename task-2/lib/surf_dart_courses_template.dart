double getAverage(List<int> numbers) {
  return numbers.reduce((value, element) => value += element) / numbers.length;
}
