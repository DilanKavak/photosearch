import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/flickrmodel.dart';
const apiKey="f61b24e760268af902f28abef3dd0648";
const FlickrSearchUrl='https://www.flickr.com/services/rest/?method=flickr.photos.search';



Future<List<Photo>> _getPhoto() async {

  var category;
  final response = await http.get("$FlickrSearchUrl&api_key=$apiKey&format=json&nojsoncallback=1&text=flower&extras=url_w");

  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody);


  final converted = parsed['photos']['photo'].map<Photo>((json) => Photo.fromJson(json)).toList();
  return converted;
}


//urlden aldığım bu veriyi kullanabilir forma getirme işlemi
class Photo {
  final String id;
  final String owner;
  final String secret;
  final String server;
  final int farm;
  final String title;
  final int ispublic;
  final int isfriend;
  final int isfamily;
  final String url_w;
  final int height_w;
  final int width_w;

  Photo({this.id, this.owner, this.secret, this.server, this.farm,this.title,this.ispublic,this.isfriend,this.isfamily, this.url_w, this.height_w, this.width_w});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id:json['id'] as String,
      owner:json['owner'] as String,
      secret:json['secret'] as String,
      server:json['server'] as String,
      farm:json['farm'] as int,
      title:json['title'] as String,
      ispublic:json['ispublic'] as int,
      isfriend:json['isfriend'] as int,
      isfamily:json['isfamily'] as int,
      url_w:json["url_w"] as String,
      height_w:json["height_w"] as int,
      width_w:json["width_w"] as int ,
    );
  }
}


class ResultPage extends StatefulWidget {

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:new Text('IMAGE SEARCH'),
      ),
      body: FutureBuilder<List<Photo>>(
        future: _getPhoto(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(photo: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),

    );
  }

}




class PhotosList extends StatelessWidget {
  final List<Photo> photo;

  PhotosList({Key key, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: photo.length,
      itemBuilder: (context, index) {

        return Image.network(photo[index].url_w);
      },
    );
  }
}