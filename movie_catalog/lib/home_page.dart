import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _movies = [];

  Future<void> _fetchMovies() async {
    final response = await http.post(
      Uri.parse('https://hoblist.com/api/movieList'),
      body: {
        'category': 'movies',
        'language': 'kannada',
        'genre': 'all',
        'sort': 'voting',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        _movies = json.decode(response.body)['result'];
      });
    } else {
      throw Exception('Failed to load movies');
    }
  }

  void _upvote(int index) {
    setState(() {
      _movies[index]['voting'] += 1;
      // Optionally, make an API call here to update the vote on the server
    });
  }

  void _downvote(int index) {
    setState(() {
      _movies[index]['voting'] -= 1;
      // Optionally, make an API call here to update the vote on the server
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('        MOVIES        CATALOG',
        style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.cyan[400], // Set AppBar color to cyan[400]
      ),
      body: ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (context, index) {
          final movie = _movies[index];
          return Container(
            color: Colors.white, // Set movie list item color to white
            margin: EdgeInsets.symmetric(vertical: 8.0),
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_upward),
                          onPressed: () => _upvote(index),
                        ),
                        Text(
                          movie['voting'].toString(),
                          style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_downward),
                          onPressed: () => _downvote(index),
                        ),
                        Text(
                          'votes',
                          style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie['title'],
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                          ),
                          Text(
                            'Genre: ${movie['genre']}',
                            style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                          ),
                          Text(
                            'Director: ${movie['director']}',
                            style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                          ),
                          Text(
                            'Starring: ${movie['starring']}',
                            style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                          ),
                          Text(
                            'Duration: ${movie['duration']} mins',
                            style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                          ),
                          Text(
                            '${movie['views']} views',
                            style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                          ),
                          SizedBox(height: 8.0),
                          ElevatedButton(
                            onPressed: () {
                              // Watch trailer logic here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan[400],
                              minimumSize: Size(double.infinity, 40),
                            ),
                            child: Text('Watch Trailer',style: TextStyle(color: Colors.white),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(color: Colors.grey),
              ],
            ),
          );
        },
      ),
      drawer: Drawer(
        backgroundColor: Colors.cyan[400],
        child: ListView(
          children: <Widget>[
            SizedBox(height: 60,),
            ListTile(
              title: Text('Company Info',style: TextStyle(color: Colors.white, fontSize: 31,fontStyle: FontStyle.italic),),
              onTap: () {
                Navigator.pushNamed(context, '/companyInfo');
              },
            ),
          ],
        ),
      ),
    );
  }
}
