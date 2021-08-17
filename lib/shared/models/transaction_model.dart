import 'dart:convert';

class TransactionModel {
  final double value;
  final String type;
  final String category;
  final String? description;
  final DateTime date;
  final String? transactionId;
  final String? userId;
  TransactionModel({
    required this.value,
    required this.type,
    required this.category,
    this.description,
    required this.date,
    this.transactionId,
    this.userId,
  });

  TransactionModel copyWith({
    double? value,
    String? type,
    String? category,
    String? description,
    DateTime? date,
    String? transactionId,
    String? userId,
  }) {
    return TransactionModel(
      value: value ?? this.value,
      type: type ?? this.type,
      category: category ?? this.category,
      description: description ?? this.description,
      date: date ?? this.date,
      transactionId: transactionId ?? this.transactionId,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'type': type,
      'category': category,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'transactionId': transactionId,
      'userId': userId,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      value: map['value'],
      type: map['type'],
      category: map['category'],
      description: map['description'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      transactionId: map['transactionId'],
      userId: map['userId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionModel(value: $value, type: $type, category: $category, description: $description, date: $date, transactionId: $transactionId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionModel &&
        other.value == value &&
        other.type == type &&
        other.category == category &&
        other.description == description &&
        other.date == date &&
        other.transactionId == transactionId &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return value.hashCode ^
        type.hashCode ^
        category.hashCode ^
        description.hashCode ^
        date.hashCode ^
        transactionId.hashCode ^
        userId.hashCode;
  }
}
