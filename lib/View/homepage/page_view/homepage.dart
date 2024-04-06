import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controllers/api_helper_controler.dart';
import '../../favorite/page_view/favorite.dart';

class HomePage extends StatelessWidget {
  final QuoteController _quoteController = Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    int page = 1;
    return Scaffold(
      backgroundColor: Colors.grey,
      drawer: Drawer(
        // backgroundColor: Colors.red,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ListTile(
                onTap: () {},
                leading: Icon(Icons.person),
                title: Text(
                  "My Account",
                ),
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.settings),
                title: Text(
                  "Seetings & Privacy",
                ),
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.add_chart_outlined),
                title: Text(
                  "Your Activity",
                ),
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.archive),
                title: Text(
                  "Archive",
                ),
              ),
              Divider(
                height: 1,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.favorite),
                title: Text(
                  "Favorite",
                ),
              ),
              Divider(
                height: 1,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff80D9EB),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(Favorite());
            },
            icon: Icon(Icons.favorite_outline_rounded),
          )
        ],
        title: Text('Quotes'),
      ),
      body: Obx(
        () => Stack(children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            child: Image.asset(
              "assets/images/wall.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
          GridView.builder(
            itemCount: _quoteController.quotes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 4 / 2),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffF8D0D0),
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage("assets/images/ltq2.png"),
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 300,
                    child: ListTile(
                      onTap: () {
                        Get.toNamed("/details", arguments: index);
                      },
                      title: Text(
                        _quoteController.quotes[index]['content'],
                        maxLines: 4,
                        style: GoogleFonts.lexend(
                            textStyle: TextStyle(fontSize: 18)),
                      ),
                      subtitle: Text(
                        _quoteController.quotes[index]['author'],
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 4,
        onPressed: () {
          page++;
          _quoteController.refreshQuotes(page);
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
