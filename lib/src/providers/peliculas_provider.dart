import 'dart:convert';

import 'package:flutter_movies/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apikey = '8afe724642c77b5acac39799bfdce3bd';
  String _url = 'api.themoviedb.org';
  String _languaje = 'es-ES';

  Future<List<Pelicula>> getEnCines() async {
    //get
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _languaje,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    // print(decodedData['results']);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    // print(peliculas.items[0].title);

    return peliculas.items;
  }
}
