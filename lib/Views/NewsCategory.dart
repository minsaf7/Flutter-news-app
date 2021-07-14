import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/Helpers/News.dart';
import 'package:flutternews/Models/ArticleModel.dart';
import 'package:flutternews/Views/ArticleView.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsCategory extends StatefulWidget {
  final categoryName;
  const NewsCategory({Key? key, this.categoryName}) : super(key: key);

  @override
  _NewsCategoryState createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {
  List<ArticleModel> articles = [];

  bool isLoading = true;

  getCategoryNews() async {
    CategoryNews categoryNews = CategoryNews();
    await categoryNews.getNews(widget.categoryName);
    articles = categoryNews.news;

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName + " news"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        // height: 480,
        height: MediaQuery.of(context).size.height,
        child: Container(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => ArticleVIew(
                              url: articles[index].url,
                            )));
                  },
                  child: NewsTile(
                    imageUrl: articles[index].urlToImage!,
                    title: articles[index].title,
                    description: articles[index].description!,
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String? imageUrl;
  final String title, description;
  const NewsTile(
      {Key? key,
      this.imageUrl =
          "https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg",
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            // child: Image.network(imageUrl!),
            child: CachedNetworkImage(
              imageUrl: imageUrl!,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              description,
              style: GoogleFonts.nunito(color: Colors.grey[800]),
            ),
          ),
          Divider(
            height: 20,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
