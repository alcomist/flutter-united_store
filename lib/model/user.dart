class Geolocation {
  double? latitude;
  double? longitude;

  Geolocation({
    this.latitude,
    this.longitude,
  });

  factory Geolocation.fromJson(Map<String, dynamic> json) {
    return Geolocation(
      latitude: double.tryParse(json['lat']),
      longitude: double.tryParse(json['long']),
    );
  }
}

class Address {
  String? city;
  String? street;
  int? number;
  String? zipcode;

  Geolocation? geolocation;

  Address(
      {this.city, this.street, this.number, this.zipcode, this.geolocation});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'],
      street: json['street'],
      number: json['number'] as int?,
      zipcode: json['zipcode'],
      geolocation: Geolocation.fromJson(json['geolocation']),
    );
  }
}

class Name {
  String? first;
  String? last;

  Name({
    this.first,
    this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      first: json['firstname'] as String,
      last: json['lastname'] as String,
    );
  }
}

class User {
  final int id;
  final String name;
  final String password;

  String? email;
  String? phone;

  Name? fullName;
  Address? address;

  User({
    required this.id,
    required this.name,
    required this.password,
    this.email,
    this.phone,
    this.fullName,
    this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['username'] as String,
      password: json['password'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      fullName: Name.fromJson(json['name']),
      address: Address.fromJson(json['address']),
    );
  }
}
