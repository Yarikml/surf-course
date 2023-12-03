import 'dart:math';

void main(List<String> arguments) {
  final basketballPlayer = BasketballPlayer(
    name: 'Rick',
    height: 200,
    weight: 95,
    gender: GenderType.male,
    teamRole: 'center',
  );
  basketballPlayer.tellAboutMyself();
  basketballPlayer.calculateThreePointsPercent();

  final footballPlayer = FootballPlayer(
    name: 'Andrey',
    height: 200,
    weight: 95,
    gender: GenderType.male,
    teamRole: 'forward',
  );
  footballPlayer.tellAboutMyself();
  print(
      'My stat om hundered metres today is ${footballPlayer.hundredMetresTime}');
}

abstract class IHuman {
  void tellAboutMyself();
}

enum GenderType {
  male,
  female,
}

class Human implements IHuman {
  final String name;
  final int height;
  final int weight;
  final GenderType gender;

  Human({
    required this.name,
    required this.height,
    required this.weight,
    required this.gender,
  });

  Human.male({
    required this.name,
    required this.height,
    required this.weight,
    this.gender = GenderType.male,
  });

  Human.female({
    required this.name,
    required this.height,
    required this.weight,
    this.gender = GenderType.female,
  });

  @override
  void tellAboutMyself() {
    print('My name is $name. \nMy height is $height. \nMy weight is $weight.');
  }
}

abstract class Player {
  String get sport;
}

abstract class BasketballSport {
  void calculateThreePointsPercent();
}

abstract class FootballSport {
  double get hundredMetresTime;
  void saySuiii();
}

class BasketballPlayer extends Human implements Player, BasketballSport {
  final String teamRole;

  BasketballPlayer({
    required super.name,
    required super.height,
    required super.weight,
    required super.gender,
    required this.teamRole,
  });

  @override
  String get sport => 'Basketball';

  @override
  void tellAboutMyself() {
    print('I love $sport. There is my profile card');
    super.tellAboutMyself();
  }

  @override
  void calculateThreePointsPercent() {
    print('Today my percentage is ${Random().nextInt(100)}%');
  }
}

class FootballPlayer extends Human implements Player, FootballSport {
  final String teamRole;

  FootballPlayer({
    required super.name,
    required super.height,
    required super.weight,
    required super.gender,
    required this.teamRole,
  });

  @override
  String get sport => 'Footbal';

  @override
  void tellAboutMyself() {
    print('I love $sport. There is my profile card');
    super.tellAboutMyself();
  }

  @override
  void calculateThreePointsPercent() {
    print('Today my percentage is ${Random().nextInt(100)}%');
  }

  @override
  void saySuiii() {
    print('Suiiiiii');
  }

  @override
  double get hundredMetresTime => Random().nextDouble() * 100;
}
