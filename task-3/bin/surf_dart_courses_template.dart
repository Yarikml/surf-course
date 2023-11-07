
void main(List<String> arguments) {
  final jz = Engine(
    serialKey: 1213,
    model: 'JZ',
    releaseDate: DateTime(2002, 07, 12),
    releaseCountry: 'Japan',
    price: 200000,
    type: EngineType.dvs,
    mileage: 10000,
    cylinderAmount: 4,
    sensors: [
      Sensor(type: ReleaseType.analog, model: 'NZ-9', name: 'temperature')
    ],
  );

  jz.start();
  jz.moveMachine();

  jz.stop();

  final electronicEngine = Engine.electronic(
    serialKey: 867564534,
    model: 'JZ',
    releaseDate: DateTime(2002, 07, 12),
    releaseCountry: 'Japan',
    price: 200000,
    mileage: 10000,
    sensors: [Sensor(type: ReleaseType.origin, model: 'asZ-10', name: 'wheels')],
  );

}
//Суперкласс описывающий ключевые свойства всех деталей
class Detail {
  Detail({
    required this.releaseDate,
    required this.releaseCountry,
    required this.model,
  });

  final DateTime releaseDate;

  final String releaseCountry;
  final String model;
}

//интерфейс для описания действий электрических деталей
abstract class ElectronicDetailActions {
  void sendInfoToControlBloc();
  void startReadInfo();
}

//тип двигателя
enum EngineType {
  electronic,
  dvs,
}

// класс, описывающий двигатель, наследуется от суперкласса Detail
// имеет конструктор для создания электрического двигателя
class Engine extends Detail {
  Engine({
    required super.model,
    required super.releaseDate,
    required super.releaseCountry,
    required this.cylinderAmount,
    required this.sensors,
    required this.price,
    required this.type,
    required this.serialKey,
    this.mileage,
  });

  Engine.electronic({
    required super.model,
    required super.releaseDate,
    required super.releaseCountry,
    required this.price,
    required this.serialKey,
    this.type = EngineType.electronic,
    this.mileage,
    this.cylinderAmount,
    required this.sensors,
  });


  bool? _needRepair ;
  int? mileage;
  final int serialKey;
  final int? cylinderAmount;
  final EngineType type;
  static const String bodyMaterial = 'Metal';
  final int price;
  List<Sensor> sensors;

  void start() {
    print('The engine $serialKey has been started');
  }

  void stop() {
    print('The engine $serialKey has been stopped');
  }

  void getHealthStatus() {
    if(_needRepair != null) {
      print(_needRepair! ? 'Need repair' : 'All right');

    }
  }
  void moveMachine() {
    print('Moving machine');
  }
}

// тип производеля датчика
enum ReleaseType {
  origin,
  analog,
}

//класс датчика, реализует интерфейс ElectronicDetailActions
class Sensor implements ElectronicDetailActions {
  Sensor({
    required this.model,
    required this.type,
    required this.name,
    this.trackValue,
  });

  final String model;
  final String name;
  final ReleaseType type;
  int? trackValue;

  set setValue(int value) => trackValue = value;

  @override
  void startReadInfo() {
    print('start reading info');
  }

  @override
  void sendInfoToControlBloc() {
    print('sending $trackValue to control bloc');
  }
}