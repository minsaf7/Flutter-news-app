import 'package:flutternews/Models/CategoryModel.dart';

List<CategoryModel> getCategory() {
  List<CategoryModel> category = [];

  CategoryModel model = CategoryModel();
  //1
  model.categoryTitle = "Business";
  model.imageUrl =
      "https://gordontredgold.com/wp-content/uploads/2018/08/business.jpg";

  category.add(model);

//2
  model = CategoryModel();

  model.categoryTitle = "entertainment";
  model.imageUrl =
      "https://analyticsinsight.b-cdn.net/wp-content/uploads/2019/02/Media-and-Entertainment.jpg";

  category.add(model);

//3
  model = CategoryModel();

  model.categoryTitle = "General";
  model.imageUrl =
      "https://images.theconversation.com/files/32912/original/dp2v9tty-1381627354.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=926&fit=clip";

  category.add(model);

  //4
  model = CategoryModel();

  model.categoryTitle = "Health";
  model.imageUrl =
      "https://dawnmagazines.com/wp-content/uploads/2020/12/health.jpg";

  category.add(model);

  //5
  model = CategoryModel();

  model.categoryTitle = "Science";
  model.imageUrl =
      "https://www.rmit.edu.au/content/dam/rmit/au/en/study-with-us/interest-areas/thumbnails/science-study-area-1220x732.jpg";

  category.add(model);

  //6
  model = CategoryModel();

  model.categoryTitle = "Sports";
  model.imageUrl =
      "https://buckssport.org/wp-content/uploads/2021/01/Return_of_Sports.jpg";

  category.add(model);

  //7
  model = CategoryModel();

  model.categoryTitle = "Technology";
  model.imageUrl =
      "https://transcosmos.co.uk/wp-content/uploads/2015/10/technology-customer-support1.jpg";

  category.add(model);

  return category;
}
