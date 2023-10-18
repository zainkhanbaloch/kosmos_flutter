import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Blog extends StatefulWidget {
  @override
  _Blog createState() => _Blog();
}

class _Blog extends State<Blog> {
  List<Map<String, dynamic>> blogs = [];

  @override
  void initState() {
    super.initState();
    fetchSpaceflightBlogs();
  }

  Future<void> fetchSpaceflightBlogs() async {
    final response = await http.get(
      Uri.parse('https://api.spaceflightnewsapi.net/v3/blogs?_limit=10'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        blogs = data.cast<Map<String, dynamic>>();
      });
    } else {
      print('Failed to fetch spaceflight blogs: ${response.statusCode}');
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
        itemCount: blogs.length,
        itemBuilder: (context, index) {
          final blog = blogs[index];
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
                      blog['imageUrl'] ?? '',
                      width: 350,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(blog['title']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(blog['summary'],
                          maxLines: 3, overflow: TextOverflow.ellipsis),
                      Text('Blog Site: ${blog['newsSite']}'),
                    ],
                  ),
                  onTap: () {
                    _launchURL(blog['url']);
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
