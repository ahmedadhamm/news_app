import 'package:flutter/material.dart';
import 'package:apinew_app/view/home/category_grid_view.dart';

class CategoryGridView extends StatelessWidget {
  Category category;
  int index;
  Function onCilckItem;

  CategoryGridView({
    required this.category,
    required this.index,
    required this.onCilckItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCilckItem(category);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: category.categoryBackgroud,
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(20),
            topLeft: const Radius.circular(20),
            bottomRight: Radius.circular(index % 2 == 0 ? 0 : 25),
            bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(category.categoryImage),
            Text(
              category.categoryTitle,
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
      ),
    );
  }
}

class Category {
  String categoryID;
  String categoryImage;
  String categoryTitle;
  Color categoryBackgroud;

  Category(
      {required this.categoryID,
      required this.categoryImage,
      required this.categoryTitle,
      required this.categoryBackgroud});
}
