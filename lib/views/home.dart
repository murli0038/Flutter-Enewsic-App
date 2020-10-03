import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:news_app/articalModel.dart';
import 'package:news_app/categoryModel.dart';
import 'package:news_app/data.dart';
import 'package:news_app/news.dart';
import 'package:news_app/views/artical_view.dart';
import 'package:news_app/views/category_view.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categoris = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  var date;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoris = getCategory();
    getNews();
    date = DateFormat.yMMMd().format(new DateTime.now());
  }

  getNews() async
  {
      News newsClass = News();
      await newsClass.getNews();
      articles = newsClass.news;
      setState(() {
        _loading = false;
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   // backgroundColor: Colors.transparent,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("E"),
      //       Text(
      //           "newsic",
      //           style: TextStyle(
      //             color: Colors.red,
      //           ),)
      //     ],
      //   ),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   backgroundColor: Colors.red,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.flag),
      //       title: Text("India"),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.flag),
      //       title: Text("India"),
      //     ),
      //   ],
      // ),
      body: _loading ? Center(
        child:  SpinKitFadingCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.red : Colors.green,
              ),
            );
          },
        ),
      ) : SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.only(left: 40, top: 50, right: 20),
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xAF4386DA),
                      Color(0xCC1D22A),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Container(
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            // color: Colors.red
                          ),
                          child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("E",
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w900,
                                        color: Colors.blueGrey[900],
                                        fontFamily: 'marafont'
                                    ),
                                  ),
                                  Text(
                                      "newsic",
                                      style: TextStyle(
                                        color: Colors.blueGrey[700],
                                        fontSize: 40,
                                        fontFamily: 'marafont'
                                      ),)
                                ],
                              ),
                        ),
                        SizedBox(height: 20,),
                        Text("News Today",
                          style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 18,
                            color: Color(0xFF303030),
                            fontWeight: FontWeight.bold,
                              fontFamily: 'marafont'
                          ),),
                        Text(date)
                      ],
                    ),
                  ),

                  ///Categories
                  Container(
                    height: 70,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categoris.length,
                      itemBuilder: (context, index){
                        return CategoryCollection(
                          imageUrl: categoris[index].categoryImage,
                          categoryName: categoris[index].categoryName,
                        );
                      },
                    ),
                  ),

                  Container(
                    child: AnimationLimiter(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: articles.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 1000),
                            child: SlideAnimation(
                              verticalOffset: 200.0,
                              child: FadeInAnimation(
                                child: BlogCollection(
                                  imageUrl: articles[index].urlToImage,
                                  title: articles[index].title,
                                  Desc: articles[index].description,
                                  url: articles[index].url,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  ///Blogs
                  // Container(
                  //   padding: EdgeInsets.only(top: 15),
                  //   child: ListView.builder(
                  //     shrinkWrap: true,
                  //     physics: NeverScrollableScrollPhysics(),
                  //     itemCount: articles.length,
                  //       itemBuilder: (context, index){
                  //       return BlogCollection(
                  //         imageUrl: articles[index].urlToImage,
                  //         title: articles[index].title,
                  //         Desc: articles[index].description,
                  //         url: articles[index].url,
                  //       );
                  //       }
                  //   ),
                  // )
                ],
              ),
            ),
          ],

        ),
      ),
    );
  }
}

class CategoryCollection extends StatelessWidget {

  String imageUrl;
  String categoryName;

  CategoryCollection({this.imageUrl, this.categoryName});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // print(categoryName);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => CategoryView(
            category: categoryName.toString().toLowerCase(),
          )
        ));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(imageUrl: imageUrl,width: 120,height: 60,fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
              width: 120,height: 60,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text(
                  categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogCollection extends StatelessWidget {

  String imageUrl;
  String title;
  String Desc;
  String url;

  BlogCollection({@required this.imageUrl,@required this.Desc,@required this.title,@required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ArticalView(
                  NewsUrl: url,
          )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(imageUrl,width: double.infinity,height: 200,fit: BoxFit.cover,)),
            Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,height: 200,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w900
                    ),
                  ),
                  Text(Desc,
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
