import 'package:flutter/material.dart';
import 'package:flutternews/Helpers/News.dart';
import 'package:flutternews/Helpers/data.dart';
import 'package:flutternews/Models/ArticleModel.dart';
import 'package:flutternews/Models/CategoryModel.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoryModel = [];
  List<ArticleModel> articles = [];
  bool isLoading = true;

  getArticles() async {
    News newsArticle = News();
    await newsArticle.getNews();
    articles = newsArticle.news;
    print("articles");
    print(articles);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getArticles();
    categoryModel = getCategory();
    print(categoryModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flutter",
              style: GoogleFonts.nunito(fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w600, color: Colors.red),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 70,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryModel.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      categoryTitle: categoryModel[index].categoryTitle,
                      imageUrl: categoryModel[index].imageUrl,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryTitle;
  const CategoryTile({Key? key, this.imageUrl, this.categoryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.5),
              ),
              child: Text(
                categoryTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String imageUrl, title, description;
  const NewsTile(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Image.network(imageUrl), Text(title), Text(description)],
      ),
    );
  }
}
