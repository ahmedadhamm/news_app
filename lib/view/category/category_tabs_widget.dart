import 'package:apinew_app/view/category/sourcse_tab_item.dart';
import 'package:apinew_app/view/news/news_list.dart';
import 'package:flutter/material.dart';
import 'package:apinew_app/core/model/Source.dart';

class CategoryTabsWidget extends StatefulWidget {
  List<Source>source;
  CategoryTabsWidget(this.source);

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  int selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: DefaultTabController(
        length: widget.source.length,
        child: Column (
          children: [
            TabBar(
              onTap: (index){
                setState(() {
                  selectedIndex = index;
                });
              },
              indicatorColor: Colors.transparent,
                tabs:widget.source.map((source) => SourseTab( source,
                  widget.source.indexOf(source)== selectedIndex
                )).toList(),
              isScrollable: true,

            ),
            Expanded(child: NewsList(widget.source[selectedIndex]))
          ],
        ),
      ),
    );
  }
}
