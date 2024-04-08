class Product {
  final String id;
  final String? photo;
  final String name;
  final int? quantity;
  final String? unit;
  final String certification;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String farmAddress;
  final String farmState;
  final String? pentrarProduceId;
  final String status;
  final int submittedQuantity;
  final String submittedUnit;

  Product({
    required this.id,
    this.photo,
    required this.name,
    this.quantity,
    this.unit,
    required this.certification,
    required this.createdAt,
    required this.updatedAt,
    required this.farmAddress,
    required this.farmState,
    this.pentrarProduceId,
    required this.status,
    required this.submittedQuantity,
    required this.submittedUnit,
  });

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      photo: json['photo'],
      name: json['name'],
      quantity: json['quantity'],
      unit: json['unit'],
      certification: json['certification'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      farmAddress: json['farm_address'],
      farmState: json['farm_state'],
      pentrarProduceId: json['pentrar_produce_id'],
      status: json['status'],
      submittedQuantity: json['submitted_quantity'],
      submittedUnit: json['submitted_unit'],
    );
  }

  Product copyWith({
    String? id,
    String? photo,
    String? name,
    int? quantity,
    String? unit,
    String? certification,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? farmAddress,
    String? farmState,
    String? pentrarProduceId,
    String? status,
    int? submittedQuantity,
    String? submittedUnit,
  }) {
    return Product(
      id: id ?? this.id,
      photo: photo??this.photo,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      certification: certification ?? this.certification,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      farmAddress: farmAddress ?? this.farmAddress,
      farmState: farmState ?? this.farmState,
      pentrarProduceId: pentrarProduceId ?? this.pentrarProduceId,
      status: status ?? this.status,
      submittedQuantity: submittedQuantity ?? this.submittedQuantity,
      submittedUnit: submittedUnit ?? this.submittedUnit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'photo':photo,
      'name': name,
      'quantity': quantity,
      'unit': unit,
      'certification': certification,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'farm_address': farmAddress,
      'farm_state': farmState,
      'pentrar_produce_id': pentrarProduceId,
      'status': status,
      'submitted_quantity': submittedQuantity,
      'submitted_unit': submittedUnit,
    };
  }
}