enum IllType {
  rabies(name: 'бешенства'),
  covid(name: 'ковид'),
  malaria(name: 'малярия');

  final String name;

  const IllType({
    required this.name,
  });
}
