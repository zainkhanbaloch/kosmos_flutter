import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class News extends StatefulWidget {
  @override
  _News createState() => _News();
}

class _News extends State<News> {
  List<Map<String, dynamic>> articles = [];

  @override
  void initState() {
    super.initState();
    fetchSpaceflightNews();
  }

  Future<void> fetchSpaceflightNews() async {
    final response = await http.get(
      Uri.parse(
          'https://api.spaceflightnewsapi.net/v3/articles?_limit=10'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        articles = data.cast<Map<String, dynamic>>();
      });
    } else {
      print('Failed to fetch spaceflight news: ${response.statusCode}');
    }
  }

  _launchURL(String url) async {
    final encodedURL = Uri.parse(url);
    print(url);
    try {
      if (!await canLaunch(encodedURL.toString())) {
        print("Could not open url");
        throw Exception('Could not launch $encodedURL');
      } else {
        await launch(encodedURL.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      article['imageUrl'] ?? '',
                      width: 350,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(article['title']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(article['summary'],
                          maxLines: 3, overflow: TextOverflow.ellipsis),
                      Text('News Site: ${article['newsSite']}'),
                    ],
                  ),
                  onTap: () {
                    _launchURL(article['url']);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
