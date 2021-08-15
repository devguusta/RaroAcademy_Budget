import 'dart:convert';

class TransactionOutModel {
  String category;
  DateTime date;
  String? transactionId;
  String type;
  String? userId;
  double value;
  TransactionOutModel({
    required this.category,
    required this.date,
    this.transactionId,
    required this.type,
    this.userId,
    required this.value,
  });

  TransactionOutModel copyWith({
    String? category,
    DateTime? date,
    String? transactionId,
    String? type,
    String? userId,
    double? value,
  }) {
    return TransactionOutModel(
      category: category ?? this.category,
      date: date ?? this.date,
      transactionId: transactionId ?? this.transactionId,
      type: type ?? this.type,
      userId: userId ?? this.userId,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'date': date.millisecondsSinceEpoch,
      'transactionId': transactionId,
      'type': type,
      'userId': userId,
      'value': value,
    };
  }

  factory TransactionOutModel.fromMap(Map<String, dynamic> map) {
    return TransactionOutModel(
      category: map['category'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      transactionId: map['transactionId'],
      type: map['type'],
      userId: map['userId'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionOutModel.fromJson(String source) =>
      TransactionOutModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionOutModel(category: $category, date: $date, transactionId: $transactionId, type: $type, userId: $userId, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionOutModel &&
        other.category == category &&
        other.date == date &&
        other.transactionId == transactionId &&
        other.type == type &&
        other.userId == userId &&
        other.value == value;
  }

  @override
  int get hashCode {
    return category.hashCode ^
        date.hashCode ^
        transactionId.hashCode ^
        type.hashCode ^
        userId.hashCode ^
        value.hashCode;
  }
}
