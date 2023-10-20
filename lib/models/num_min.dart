class NumeroMin {
  List<NumeroMi>? numeroMi;

  NumeroMin({this.numeroMi});

  NumeroMin.fromJson(Map<String, dynamic> json) {
    if (json['numeros'] != null) {
      numeroMi = <NumeroMi>[];
      json['numeros'].forEach((v) {
        numeroMi!.add(NumeroMi.fromJson(v));
      });
    }
  }
}

class NumeroMi {
  String? numero;
  String? imageUrl;

  NumeroMi({this.numero, this.imageUrl});

  NumeroMi.fromJson(Map<String, dynamic> json) {
    numero = json['numero'];
    imageUrl = json['image_url'];
  }
}