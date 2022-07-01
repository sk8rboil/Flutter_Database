// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Transactions {
  String title;
  double amount;
  DateTime date;

  Transactions({
    required this.title,
    required this.amount,
    required this.date,
  });

  Transactions copyWith({
    String? title,
    double? amount,
    DateTime? date,
  }) {
    return Transactions(
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'amount': amount,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Transactions.fromMap(Map<String, dynamic> map) {
    return Transactions(
      title: map['title'] as String,
      amount: map['amount'] as double,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Transactions.fromJson(String source) =>
      Transactions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Transaction(title: $title, amount: $amount, date: $date)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transactions &&
        other.title == title &&
        other.amount == amount &&
        other.date == date;
  }

  @override
  int get hashCode => title.hashCode ^ amount.hashCode ^ date.hashCode;
}
