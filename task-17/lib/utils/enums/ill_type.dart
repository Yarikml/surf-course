enum IllType {
  rabies(name: 'бешенство'),
  covid(name: 'ковид'),
  malaria(name: 'малярия');

  final String name;

  const IllType({
    required this.name,
  });
}
