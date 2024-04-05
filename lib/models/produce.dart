import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProduceModel {
  dynamic id;
  String name;
  String? photo;
  String status;
  String quantity;
  DateTime? plantingDate;
  String season;
  DateTime? harvestDate;
  String weather;
  String address;
  String state;
  String storage;
  String description;


  ProduceModel({
    this.id,
    this.name = 'Cassava',
    this.photo,
    this.status = 'Active',
    this.quantity = '20000',
    this.plantingDate,
    this.season = 'Rainy',
    this.harvestDate,
    this.weather = 'Cloudy',
    this.address = 'Here',
    this.state = 'Ogun State',
    this.description = '',
    this.storage = 'Dry',
  });

  ProduceModel copyWith({
    dynamic? id,
    String? name,
    String? photo,
    String? status,
    String? quantity,
    DateTime? plantingDate,
    String? season,
    DateTime? harvestDate,
    String? weather,
    String? address,
    String? state,
    String? storage,
  }) {
    return ProduceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      status: status ?? this.status,
      quantity: quantity ?? this.quantity,
      plantingDate: plantingDate ?? this.plantingDate,
      season: season ?? this.season,
      harvestDate: harvestDate ?? this.harvestDate,
      weather: weather ?? this.weather,
      address: address ?? this.address,
      state: state ?? this.state,
      storage: storage ?? this.storage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'photo': photo,
      'status': status,
      'quantity': quantity,
      'plantingDate': plantingDate?.millisecondsSinceEpoch,
      'season': season,
      'harvestDate': harvestDate?.millisecondsSinceEpoch,
      'weather': weather,
      'address': address,
      'state': state,
      'storage': storage,
    };
  }

  factory ProduceModel.fromMap(Map<String, dynamic> map) {
    return ProduceModel(
      id: map['id'] as dynamic,
      name: map['name'] as String,
      photo: map['photo'] != null ? map['photo'] as String : null,
      status: map['status'] as String,
      quantity: map['quantity'] as String,
      plantingDate: map['plantingDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['plantingDate'] as int) : null,
      season: map['season'] as String,
      harvestDate: map['harvestDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['harvestDate'] as int) : null,
      weather: map['weather'] as String,
      address: map['address'] as String,
      state: map['state'] as String,
      storage: map['storage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProduceModel.fromJson(String source) => ProduceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProduceModel(id: $id, name: $name, photo: $photo, status: $status, quantity: $quantity, plantingDate: $plantingDate, season: $season, harvestDate: $harvestDate, weather: $weather, address: $address, state: $state, storage: $storage)';
  }

  @override
  bool operator ==(covariant ProduceModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.photo == photo &&
      other.status == status &&
      other.quantity == quantity &&
      other.plantingDate == plantingDate &&
      other.season == season &&
      other.harvestDate == harvestDate &&
      other.weather == weather &&
      other.address == address &&
      other.state == state &&
      other.storage == storage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      photo.hashCode ^
      status.hashCode ^
      quantity.hashCode ^
      plantingDate.hashCode ^
      season.hashCode ^
      harvestDate.hashCode ^
      weather.hashCode ^
      address.hashCode ^
      state.hashCode ^
      storage.hashCode;
  }
}