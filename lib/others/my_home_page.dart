import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:music_player/others/app_colors.dart' as AppColors;
import 'package:music_player/others/my_tabs.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> popularBooks = [];
  List<Map<String, dynamic>> Books = [];

  late ScrollController _scrollController;
  late TabController _tabController;

  Future<void> readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/popularBooks.json")
        .then((s) {
      setState(() {
        dynamic decodedData = json.decode(s);
        if (decodedData is List) {
          popularBooks = List<Map<String, dynamic>>.from(decodedData);
        }
      });
    });

    await DefaultAssetBundle.of(context)
        .loadString("json/Books.json")
        .then((s) {
      setState(() {
        dynamic decodedData = json.decode(s);
        if (decodedData is List) {
          Books = List<Map<String, dynamic>>.from(decodedData);
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();

    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 10),
                      Icon(Icons.notifications),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                "Popular Albums ",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  decorationStyle: TextDecorationStyle.dashed,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 170,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: -20,
                    right: 0,
                    child: Container(
                      height: 170,
                      child: PageView.builder(
                        controller: PageController(viewportFraction: 0.8),
                        itemCount: popularBooks.length,
                        itemBuilder: (_, i) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(right: 10),
                            height: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(popularBooks[i]["img"]),
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder: (BuildContext context, bool isScroll) {
                  return [
                    // Existing code...

                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 180,
                      flexibleSpace: FlexibleSpaceBar(
                        title: const Text("Your Title"),
                        background: Container(
                          // Change here
                          color: AppColors.Silverbackground, // Change here
                        ),
                      ),
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(50),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10, left: 5),
                          child: TabBar(
                            indicatorPadding: const EdgeInsets.all(0),
                            indicatorSize: TabBarIndicatorSize.label,
                            labelPadding: const EdgeInsets.only(right: 10),
                            controller: _tabController,
                            isScrollable: true,
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 7,
                                  offset: const Offset(0, 0),
                                )
                              ],
                            ),
                            tabs: [
                              AppTabs(color: AppColors.menu1Color, text: "New"),
                              AppTabs(
                                  color: AppColors.menu2Color, text: "Pupolar"),
                              AppTabs(
                                  color: AppColors.menu3Color,
                                  text: "Trending"),

                              // Container(
                              //   width: 120,
                              //   height: 50,
                              //   child: const Text(
                              //     "NEW",
                              //     style: TextStyle(color: Colors.white),
                              //   ),
                              //   alignment: Alignment.center,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10),
                              //     color: AppColors.menu1Color,
                              //     boxShadow: [
                              //       BoxShadow(
                              //         color: Colors.grey.withOpacity(0.3),
                              //         blurRadius: 7,
                              //         offset: const Offset(0, 0),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // Container(
                              //   width: 120,
                              //   height: 50,
                              //   child: const Text(
                              //     "NEW",
                              //     style: TextStyle(color: Colors.white),
                              //   ),
                              //   alignment: Alignment.center,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10),
                              //     color: AppColors.menu2Color,
                              //     boxShadow: [
                              //       BoxShadow(
                              //         color: Colors.grey.withOpacity(0.3),
                              //         blurRadius: 7,
                              //         offset: const Offset(0, 0),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              // Container(
                              //   width: 120,
                              //   height: 50,
                              //   child: const Text(
                              //     "NEW",
                              //     style: TextStyle(color: Colors.white),
                              //   ),
                              //   alignment: Alignment.center,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10),
                              //     color:AppColors.menu3Color,
                              //     boxShadow: [
                              //       BoxShadow(
                              //         color: Colors.grey.withOpacity(0.3),
                              //         blurRadius: 7,
                              //         offset: const Offset(0, 0),
                              //       )
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Add your additional SliverAppBar or other header sliver widgets here
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemCount: Books == null ? 0 : Books.length,
                      itemBuilder: (_, i) {
                        return Container(
                          margin: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.tabVarvViewColor,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  offset: Offset(0, 0),
                                  color: Colors.white10.withOpacity(0.2),
                                )
                              ],
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(Books[i]["img"]),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.star,
                                                  size: 24,
                                                  color: AppColors.starColor),
                                              SizedBox(width: 5),
                                              Text(
                                                Books[i]["rating"].toString(),
                                                style: TextStyle(
                                                    color:
                                                        AppColors.menu2Color),
                                              ),
                                            ],
                                          ),

                                          Text(Books[i]["title"],style: TextStyle(fontSize: 15,fontFamily: "Avenir",fontWeight: FontWeight.bold),),

                                          Text(Books[i]["text"],style: TextStyle(fontSize: 10,fontFamily: "Avenir",),),
                                          // Add more details or widgets as needed
                                        //  Text(Books[i]["Love"],style: TextStyle(fontSize: 15,fontFamily: "Avenir",fontWeight: FontWeight.bold),),
                                            Container(

                                              height: 15,
                                              width: 50,
                                              decoration: BoxDecoration(

                                                borderRadius: BorderRadius.circular(3),
                                                color: AppColors.loveColor,

                                              ),
                                              child: Text("Love",style: TextStyle(fontSize: 10 ,fontFamily: "Avenir",fontWeight: FontWeight.bold,color: Colors.yellow),),
                                                alignment: Alignment.center,

                                            )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Material(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                        title: Text("Content"),
                      ),
                    ),
                    Material(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                        title: Text("Content"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
