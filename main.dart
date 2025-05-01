import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:imdb_scraper/imdb_scraper.dart';
import 'package:kashu_imdb/movie/movie_model.dart';

// Example demonstrating comprehensive usage of the IMDb scraper package.
// Shows how to:
// 1. Search for a title to get its IMDb ID
// 2. Fetch detailed information using the ID
// 3. Access and display various data points

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kashmira IMDB',

      home: SearchBar(),
    );
  }
}


class SearchBar extends StatefulWidget {


  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  

  Future<void> searchListFunction(String val) async{}

  static List<MovieModel> main_movies_list = [

    MovieModel("The Maze Runner","Action|Thriller|Sci-fi|Mystery",
        7.5,"https://m.media-amazon.com/images/M/MV5BMTYyNzk3MDc2NF5BMl5BanBnXkFtZTgwMDk3OTM1NDM@.V1_FMjpg_UX1000.jpg"),

    MovieModel("Rampage","Action|Future|Science",6.5 ,
        "https://th.bing.com/th/id/R.4fd380a5dda05116669eccd6a88cc032?rik=nNLLvO1ZYZzhZg&riu=http%3a%2f%2fwww.impawards.com%2f2018%2fposters%2frampage_ver3_xlg.jpg&ehk=YWRTWn09LgnpC4QH7ZKaHMGe7N9XGIcl9m3kgs%2f90hU%3d&risl=&pid=ImgRaw&r=0"),

    MovieModel("Jurassic World","Fun|Fantasy|Science",6.5,
        "https://th.bing.com/th/id/OIP.3zct61j_xrWy-8OHRtilJQHaLH?pid=ImgDet&w=474&h=711&rs=1"),

    MovieModel("Love Actually","Comedy|Drama|Romance",7.6,
        "https://m.media-amazon.com/images/M/MV5BNThkNjgxNGQtOTIxMy00ZTFmLWIwMDItYzE5YzM3ZDMzNDE3XkEyXkFqcGdeQXVyMTUyNjc3NDQ4"),

    MovieModel("The Proposal","Comedy|Drama|Rom-Com",6.8,
        "https://m.media-amazon.com/images/M/MV5BOGM5YTNiYzktNmEwZC00ZjE5LWIyNzEtOTUwNDE0NmVkYzE3XkEyXkFqcGdeQXVyMTMxODk2OTU@"),

    MovieModel("Portrait of a Lady on Fire","Drama|Romance",8.1,
        "https://th.bing.com/th/id/OIP.whr6--08im_wILeFJfBexgHaK6?rs=1&pid=ImgDetMain")


  ];

  List<MovieModel> display_list = List.from(main_movies_list);

  void updateList(String value){
    setState(() {
      display_list = main_movies_list.where((element)=>element.movie_title!.toLowerCase().contains(value.toLowerCase())).toList();
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.white10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Home",style: TextStyle(fontFamily: 'Montserrat',fontSize: 20,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10.0,),
            TextField(
              onChanged: (value)=> updateList(value),
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffffffff),
                  border: OutlineInputBorder(),
                  hintText: "Search",
                  suffixIcon: Icon(Icons.search),
                  suffixIconColor: Colors.black

              ),
            ),
            const SizedBox(height: 30.0,),
            Expanded(
                child: ListView.builder(
                  itemCount: display_list.length,
                  itemBuilder: (context,index)=>Container(
                    margin: EdgeInsets.only(bottom: 35),
                    child: Material(
                      elevation: 5.0,
                      child: ListTile(
                        title: Container(
                          margin: EdgeInsets.only(top: 10.0),

                            child: Center(
                              child: Text(display_list[index].movie_title!,
                                style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold),
                              ),
                            ),
                        ),
                        subtitle:
                          Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(display_list[index].movie_genres!,style: TextStyle(fontFamily: 'Montserrat'),),
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color:
                                      display_list[index].rating!>6.5 ?
                                          Colors.greenAccent : Colors.blue,
                                    ),
                                    child: Text(display_list[index].rating!.toString()+" IMDB",style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,fontWeight: FontWeight.bold
                                    ),),

                                  )
                                ],

                              ),
                            ),
                        leading:
                        Container(
                          margin: EdgeInsets.only(left: 15),
                            child: Image.network(display_list[index].movie_poster_url!,
                                    // height: 120.0,
                                    // width: 120.0,
                                    // fit: BoxFit.cover,

                            ),

                        ),

                      ),

                      ),
                    ),
                  ),

                ),
          ],
        ),
      ),
    );
  }
}
