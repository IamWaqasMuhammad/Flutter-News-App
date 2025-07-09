import 'dart:convert';

NewApi newApiFromJson(String str) => NewApi.fromJson(json.decode(str));
String newApiToJson(NewApi data) => json.encode(data.toJson());

class NewApi {
    String? status;
    int? totalResults;
    List<Article>? articles;

    NewApi({
        this.status,
        this.totalResults,
        this.articles,
    });

    factory NewApi.fromJson(Map<String, dynamic> json) => NewApi(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: json["articles"] == null
            ? []
            : List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles?.map((x) => x.toJson()).toList(),
    };
}

class Article {
    Source? source;
    String? author;
    String? title;
    String? description;
    String? url;
    String? urlToImage;
    DateTime? publishedAt;
    String? content;

    Article({
        this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json["source"] != null ? Source.fromJson(json["source"]) : null,
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] != null
            ? DateTime.tryParse(json["publishedAt"])
            : null,
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
    };
}

class Source {
    String? id;
    String? name;

    Source({
        this.id,
        this.name,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
