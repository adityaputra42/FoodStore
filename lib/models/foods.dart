// ignore_for_file: dead_code

part of 'model.dart';

enum FoodType { new_food, popular, recomended }

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredinets;
  final int price;
  final double rate;
  final List<FoodType> type;

  Food(
      {required this.id,
      required this.picturePath,
      required this.name,
      required this.description,
      required this.ingredinets,
      required this.price,
      required this.rate,
      this.type = const []});

  factory Food.fromJson(Map<String, dynamic> data) => Food(
      id: data['id'],
      picturePath: data['picturePath'],
      name: data['name'],
      description: data['description'],
      ingredinets: data['ingredients'],
      price: data['price'],
      rate: (data['rate'] as num).toDouble(),
      type: data['types'].toString().split(',').map((e) {
        switch (e) {
          case 'recommended':
            return FoodType.recomended;
            break;
          case 'popular':
            return FoodType.popular;
            break;
          default:
            return FoodType.new_food;
        }
      }).toList());

  @override
  List<Object> get props =>
      [id, picturePath, name, description, ingredinets, price, rate];
}

List<Food> mockFoods = [
  Food(
      id: 1,
      picturePath:
          'https://merahputih.com/media/93/25/cb/9325cb4dfb39dc24ed4998ed9bbe85e5.png',
      name: 'Ayam Bakar Madu',
      description: 'Ayam Bakar Madu adalah menu ayam bakar yang terkenal di bogor. ayam bakar ini dibuat dari berbagai macam rempah pilihan serta madu saat dibakar sehingga menghasilkan cita rasa yang nikmat',
      ingredinets: 'Ayam, rempah pilihan, madu murni, sambal matah',
      price: 56000,
      rate: 4.3,
      type: [FoodType.new_food, FoodType.popular, FoodType.recomended]),
  Food(
      id: 2,
      picturePath:
          'https://cdn.idntimes.com/content-images/post/20200320/64223268-2301178586867869-7572995226712035086-n-d1de6bc645c70c3c63bb660eeafcf277_600x400.jpg',
      name: 'Bakso Blangkon Solo',
      description: 'Bakso Blangkon solo beralamat di stadion pekansari cibinong, langgananku!!!',
      ingredinets: 'Daging sapi, bawang putih, bawang merah, tepung terigu',
      price: 17000,
      rate: 4.5,
      type: [FoodType.popular, FoodType.recomended]),
  Food(
      id: 3,
      picturePath:
          'https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/03/27/225336190.jpg',
      name: 'Sate Ambal',
      description: 'Sate Ambal adalah makanan khas dari kebumen jawa tengah, sate ini terbuat dari daging yayam yang direndam dalam bumbu lalu dibakar',
      ingredinets: 'Daging ayam, bawang putih, bawang merah,',
      price: 25000,
      rate: 4.3,
      type: [FoodType.new_food, FoodType.popular])
];
