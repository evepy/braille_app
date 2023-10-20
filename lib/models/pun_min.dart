class PuntuacionMin {
  List<PuntuacionMi>? puntuacionMi;

  PuntuacionMin({this.puntuacionMi});

  PuntuacionMin.fromJson(Map<String, dynamic> json) {
    if (json['puntuacion'] != null) {
      puntuacionMi = <PuntuacionMi>[];
      json['puntuacion'].forEach((v) {
        puntuacionMi!.add(PuntuacionMi.fromJson(v));
      });
    }
  }
}

class PuntuacionMi {
  String? puntuacion;
  String? imageUrl;

  PuntuacionMi({this.puntuacion, this.imageUrl});

  PuntuacionMi.fromJson(Map<String, dynamic> json) {
    puntuacion = json['puntuacion'];
    imageUrl = json['image_url'];
  }
}