import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/networking.dart';
import 'package:flutter_app/flickrmodel.dart';
import 'package:flutter/material.dart';
const apiKey="f61b24e760268af902f28abef3dd0648";
const FlickrSearchUrl=' https://www.flickr.com/services/rest/?method=flickr.photos.search';



class FlickrDatas {
  Future<dynamic> getPhotos(String category) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$FlickrSearchUrl&api_key=$apiKey&text=$category&per_page=500&format=json&nojsoncallback=1');
    var imageflickr = await networkHelper.getData();
    return imageflickr;
  }
}