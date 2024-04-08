
class Produce {
  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? pentrarProduceId;
  final String description;
  final int? quantity;
  final String ownerName;
  final String ownerPhone;
  final String ownerType;
  final String ownerPentrarId;
  final List<String> images;
  final String? unit;
  final bool onPentrarHub;
  final DateTime harvestDate;
  final DateTime plantingDate;
  final String farmAddress;
  final String farmState;
  final String certification;
  final String status;
  final bool canTransfer;
  final String produceClassification;
  final int submittedQuantity;
  final String submittedUnit;
  final int? quantityTransfered;
  final int? unitTransfered;
  final String storage;
  final String nearestLandmark;
  final List<String> transferHandler;
  final List<int> partQtyTransfered;

  Produce({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
    required this.ownerName,
    required this.ownerPhone,
    required this.ownerType,
    required this.ownerPentrarId,
    required this.images,
    required this.onPentrarHub,
    required this.harvestDate,
    required this.plantingDate,
    required this.farmAddress,
    required this.farmState,
    required this.certification,
    required this.status,
    required this.canTransfer,
    required this.produceClassification,
    required this.submittedQuantity,
    required this.submittedUnit,
    required this.storage,
    required this.nearestLandmark,
    required this.transferHandler,
    required this.partQtyTransfered,
    required this.pentrarProduceId,
    required this.quantity,
    required this.unit,
    required this.quantityTransfered,
    required this.unitTransfered,
  });

  factory Produce.fromJson(Map<String, dynamic> json) {
    return Produce(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      pentrarProduceId: json['pentrar_produce_id'],
      description: json['description'],
      quantity: json['quantity'],
      ownerName: json['owner_name'],
      ownerPhone: json['owner_phone'],
      ownerType: json['owner_type'],
      ownerPentrarId: json['owner_pentrar_id'],
      images: List<String>.from(json['images']),
      unit: json['unit'],
      onPentrarHub: json['on_pentrar_hub'],
      harvestDate: DateTime.parse(json['harvest_date']),
      plantingDate: DateTime.parse(json['planting_date']),
      farmAddress: json['farm_address'],
      farmState: json['farm_state'],
      certification: json['certification'],
      status: json['status'],
      canTransfer: json['can_transfer'],
      produceClassification: json['produce_classification'],
      submittedQuantity: json['submitted_quantity'],
      submittedUnit: json['submitted_unit'],
      quantityTransfered: json['quantity_transfered'],
      unitTransfered: json['unit_transfered'],
      storage: json['storage'],
      nearestLandmark: json['nearest_landmark'],
      transferHandler: List<String>.from(json['transfer_handler']),
      partQtyTransfered: List<int>.from(json['part_qty_transfered']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'pentrar_produce_id': pentrarProduceId,
      'description': description,
      'quantity': quantity,
      'owner_name': ownerName,
      'owner_phone': ownerPhone,
      'owner_type': ownerType,
      'owner_pentrar_id': ownerPentrarId,
      'images': images,
      'unit': unit,
      'on_pentrar_hub': onPentrarHub,
      'harvest_date': harvestDate.toIso8601String(),
      'planting_date': plantingDate.toIso8601String(),
      'farm_address': farmAddress,
      'farm_state': farmState,
      'certification': certification,
      'status': status,
      'can_transfer': canTransfer,
      'produce_classification': produceClassification,
      'submitted_quantity': submittedQuantity,
      'submitted_unit': submittedUnit,
      'quantity_transfered': quantityTransfered,
      'unit_transfered': unitTransfered,
      'storage': storage,
      'nearest_landmark': nearestLandmark,
      'transfer_handler': transferHandler,
      'part_qty_transfered': partQtyTransfered,
    };
  }

Produce copyWith({
  String? id,
  String? name,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? pentrarProduceId,
  String? description,
  int? quantity,
  String? ownerName,
  String? ownerPhone,
  String? ownerType,
  String? ownerPentrarId,
  List<String>? images,
  String? unit,
  bool? onPentrarHub,
  DateTime? harvestDate,
  DateTime? plantingDate,
  String? farmAddress,
  String? farmState,
  String? certification,
  String? status,
  bool? canTransfer,
  String? produceClassification,
  int? submittedQuantity,
  String? submittedUnit,
  int? quantityTransfered,
  int? unitTransfered,
  String? storage,
  String? nearestLandmark,
  List<String>? transferHandler,
  List<int>? partQtyTransfered,
}) {
  return Produce(
    id: id ?? this.id,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    pentrarProduceId: pentrarProduceId ?? this.pentrarProduceId,
    description: description ?? this.description,
    quantity: quantity ?? this.quantity,
    ownerName: ownerName ?? this.ownerName,
    ownerPhone: ownerPhone ?? this.ownerPhone,
    ownerType: ownerType ?? this.ownerType,
    ownerPentrarId: ownerPentrarId ?? this.ownerPentrarId,
    images: images ?? this.images,
    unit: unit ?? this.unit,
    onPentrarHub: onPentrarHub ?? this.onPentrarHub,
    harvestDate: harvestDate ?? this.harvestDate,
    plantingDate: plantingDate ?? this.plantingDate,
    farmAddress: farmAddress ?? this.farmAddress,
    farmState: farmState ?? this.farmState,
    certification: certification ?? this.certification,
    status: status ?? this.status,
    canTransfer: canTransfer ?? this.canTransfer,
    produceClassification: produceClassification ?? this.produceClassification,
    submittedQuantity: submittedQuantity ?? this.submittedQuantity,
    submittedUnit: submittedUnit ?? this.submittedUnit,
    quantityTransfered: quantityTransfered ?? this.quantityTransfered,
    unitTransfered: unitTransfered ?? this.unitTransfered,
    storage: storage ?? this.storage,
    nearestLandmark: nearestLandmark ?? this.nearestLandmark,
    transferHandler: transferHandler ?? this.transferHandler,
    partQtyTransfered: partQtyTransfered ?? this.partQtyTransfered,
  );
}
}