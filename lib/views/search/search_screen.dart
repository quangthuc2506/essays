import 'package:essays/views/search/list_hot.dart';
import 'package:essays/views/search/product_searched_screen.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        titleSpacing: 0,
        title: SizedBox(
          child: TextFormField(
            onEditingComplete: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductSearchedScreen(
                            name: searchController.text,
                          )));
            },
            controller: searchController,
            decoration: InputDecoration(
              suffixIcon: searchController.text.isNotEmpty
                  ? InkWell(
                      onTap: () {
                        searchController.text = '';
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.highlight_off,
                        color: Colors.grey,
                      ))
                  : null,
              hintText: 'Tìm món ăn của bạn',
              hintStyle: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.w600),
              focusedBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none),
              enabledBorder:
                  const UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size(1, 1),
          child: Divider(
            height: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Món gì đang hot?',
              style: TextStyle(
                  color: Colors.grey[700], fontWeight: FontWeight.w600),
            ),
            Wrap(
              direction: Axis.horizontal,
              children: List.generate(
                  ListHot.listHot.length,
                  (index) => Container(
                      margin: const EdgeInsets.only(right: 15, top: 15),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300],
                      ),
                      child: InkWell(
                          onTap: () {
                            searchController.text =
                                ListHot.listHot[index].toString();
                            setState(() {});
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductSearchedScreen(
                                          name: searchController.text,
                                        )));
                          },
                          child: Text(ListHot.listHot[index].toString())))),
            )
          ],
        ),
      ),
    );
  }
}
