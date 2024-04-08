// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pentrar/models/produce.dart';

class HistoryProduceModel {
  Product? produce;
  String fullName;
  String designation;
  String status;
  DateTime? date;
  String recipient;
  
  HistoryProduceModel({
    this.produce,
    this.fullName = 'Ebiondo Daniel',
    this.designation = 'Exporter',
    this.status = 'Successful',
    this.date,
    this.recipient = 'email@email.com',
  });


  HistoryProduceModel copyWith({
    Product? produce,
    String? fullName,
    String? designation,
    String? status,
    DateTime? date,
    String? recipient,
  }) {
    return HistoryProduceModel(
      produce: produce ?? this.produce,
      fullName: fullName ?? this.fullName,
      designation: designation ?? this.designation,
      status: status ?? this.status,
      date: date ?? this.date,
      recipient: recipient ?? this.recipient,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'produce': produce?.toMap(),
      'fullName': fullName,
      'designation': designation,
      'status': status,
      'date': date?.millisecondsSinceEpoch,
      'recipient': recipient,
    };
  }

  factory HistoryProduceModel.fromMap(Map<String, dynamic> map) {
    return HistoryProduceModel(
      produce: map['produce'] != null ? Product.fromMap(map['produce'] as Map<String,dynamic>) : null,
      fullName: map['fullName'] as String,
      designation: map['designation'] as String,
      status: map['status'] as String,
      date: map['date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int) : null,
      recipient: map['recipient'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryProduceModel.fromJson(String source) => HistoryProduceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HistoryProduceModel(produce: $produce, fullName: $fullName, designation: $designation, status: $status, date: $date, recipient: $recipient)';
  }

  @override
  bool operator ==(covariant HistoryProduceModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.produce == produce &&
      other.fullName == fullName &&
      other.designation == designation &&
      other.status == status &&
      other.date == date &&
      other.recipient == recipient;
  }

  @override
  int get hashCode {
    return produce.hashCode ^
      fullName.hashCode ^
      designation.hashCode ^
      status.hashCode ^
      date.hashCode ^
      recipient.hashCode;
  }
}
