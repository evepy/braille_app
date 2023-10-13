class DiacriticoMin {
  List<DiacriticosMi>? diacriticoMi;

  DiacriticoMin({this.diacriticoMi});

  DiacriticoMin.fromJson(Map<String, dynamic> json) {
    if (json['diacriticos'] != null) {
      diacriticoMi = <DiacriticosMi>[];
      json['diacriticos'].forEach((v) {
        diacriticoMi!.add(DiacriticosMi.fromJson(v));
      });
    }
  }
}

class DiacriticosMi {
  String? signodiacritico;
  String? imageUrl;

  DiacriticosMi({this.signodiacritico, this.imageUrl});

  DiacriticosMi.fromJson(Map<String, dynamic> json) {
    signodiacritico = json['signodiacritico'];
    imageUrl = json['image_url'];
  }
}