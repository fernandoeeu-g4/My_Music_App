class Album {
  String name;
  String mbid;
  String url;
  Artist artist;
  List<Image> image;
  Attr attr;

  Album({this.name, this.mbid, this.url, this.artist, this.image, this.attr});

  Album.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mbid = json['mbid'];
    url = json['url'];
    artist =
        json['artist'] != null ? new Artist.fromJson(json['artist']) : null;
    if (json['image'] != null) {
      image = new List<Image>();
      json['image'].forEach((v) {
        image.add(new Image.fromJson(v));
      });
    }
    attr = json['@attr'] != null ? new Attr.fromJson(json['@attr']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mbid'] = this.mbid;
    data['url'] = this.url;
    if (this.artist != null) {
      data['artist'] = this.artist.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image.map((v) => v.toJson()).toList();
    }
    if (this.attr != null) {
      data['@attr'] = this.attr.toJson();
    }
    return data;
  }
}

class Artist {
  String name;
  String mbid;
  String url;

  Artist({this.name, this.mbid, this.url});

  Artist.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mbid = json['mbid'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mbid'] = this.mbid;
    data['url'] = this.url;
    return data;
  }
}

class Image {
  String text;
  String size;

  Image({this.text, this.size});

  Image.fromJson(Map<String, dynamic> json) {
    text = json['#text'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['#text'] = this.text;
    data['size'] = this.size;
    return data;
  }
}

class Attr {
  String rank;

  Attr({this.rank});

  Attr.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rank'] = this.rank;
    return data;
  }
}