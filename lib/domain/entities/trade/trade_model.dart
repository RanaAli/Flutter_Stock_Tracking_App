class TradeModelList {
  final List<TradeModel> data;
  final String type;

  TradeModelList({
    required this.data,
    required this.type,
  });

  factory TradeModelList.fromJson(Map<String, dynamic> json) => TradeModelList(
    data: List<TradeModel>.from(json["data"].map((x) => TradeModel.fromJson(x))),
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "type": type,
  };
}

class TradeModel {
  final double p;
  final String s;
  final int t;
  final double v;

  TradeModel({
    required this.p,
    required this.s,
    required this.t,
    required this.v,
  });

  factory TradeModel.fromJson(Map<String, dynamic> json) => TradeModel(
    p: json["p"]?.toDouble(),
    s: json["s"],
    t: json["t"],
    v: json["v"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "p": p,
    "s": s,
    "t": t,
    "v": v,
  };
}
