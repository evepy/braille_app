class AbecedarioMin {
  List<AbecedarioMi>? abecedarioMi;

  AbecedarioMin({this.abecedarioMi});

  AbecedarioMin.fromJson(Map<String, dynamic> json) {
    if (json['abecedario_mi'] != null) {
      abecedarioMi = <AbecedarioMi>[];
      json['abecedario_mi'].forEach((v) {
        abecedarioMi!.add(AbecedarioMi.fromJson(v));
      });
    }
  }
}

class AbecedarioMi {
  String? letter;
  String? imageUrl;

  AbecedarioMi({this.letter, this.imageUrl});

  AbecedarioMi.fromJson(Map<String, dynamic> json) {
    letter = json['letter'];
    imageUrl = json['image_url'];
  }
}