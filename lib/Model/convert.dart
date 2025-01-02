class Convert {
  double? amount;
  String? base;
  String? date;
  Rates? rates;

  Convert({this.amount, this.base, this.date, this.rates});

  Convert.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    base = json['base'];
    date = json['date'];
    rates = json['rates'] != null ? Rates.fromJson(json['rates']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['base'] = base;
    data['date'] = date;
    if (rates != null) {
      data['rates'] = rates!.toJson();
    }
    return data;
  }
}

class Rates {
  double? eUR;

  Rates({this.eUR});

  Rates.fromJson(Map<String, dynamic> json) {
    eUR = json['EUR'] ?? json["USD"] ?? json["GBP"] ?? json['JPY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['EUR'] = eUR;
    return data;
  }
}
