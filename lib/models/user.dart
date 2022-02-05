part of 'model.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? houseNumber;
  final String? phoneNumber;
  final String? city;
  final String? picturePath;
  final String? password;
  static String? token;

  User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.city,
      this.picturePath,
      this.password});
  factory User.fromJson(Map<String, dynamic> data) => User(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      address: data['address'],
      houseNumber: data['houseNumber'],
      phoneNumber: data['phoneNumber'],
      city: data['city'],
      picturePath: data['profile_photo_url']);

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? address,
    String? houseNumber,
    String? phoneNumber,
    String? city,
    String? picturePath,
    String? password,
  }) =>
      User(
          id: id ?? this.id,
          name: name ?? this.name,
          email: email ?? this.email,
          address: address ?? this.address,
          houseNumber: houseNumber ?? this.houseNumber,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          city: city ?? this.city,
          picturePath: picturePath ?? this.picturePath,
          password: password ?? this.password);

  @override
  List<Object> get props => [
        id!,
        name!,
        email!,
        address!,
        houseNumber!,
        phoneNumber!,
        city!,
        picturePath!,
        password!
      ];
}

User mockUser = User(
    id: 1,
    name: 'Gita Prigi Andani',
    address: 'Taman Griya Asri Cilebut, Sukaraja',
    houseNumber: 'B23',
    email: 'gitaPrigi@gmail.com',
    city: 'Kab. Bogor',
    phoneNumber: '085911735255',
    picturePath: 'assets/eneng.jpg',
    password: 'gita123');
