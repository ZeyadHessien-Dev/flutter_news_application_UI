import 'package:flutter/material.dart';
import 'package:news_application_ui/models/article_model.dart';

import '../widgets/bottom_bar.dart';

class DiscoverScreen extends StatelessWidget {
  DiscoverScreen({Key? key}) : super(key: key);
  static const routeName = '/discover';
  List<String> tabs = ['Health', 'Politics', 'Art', 'Food', 'Sports'];
  List<Article> article = Article.articles;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        bottomNavigationBar: BottomBarNavigation(
          index: 1,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 75,
              right: 15,
              left: 15,
              bottom: 15,
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _DiscoverNews(),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    TabBar(
                      physics: const BouncingScrollPhysics(),
                      indicatorColor: Colors.blue,
                      isScrollable: true,
                      tabs: tabs
                          .map(
                            (tab) => Tab(
                          child: Text(
                            tab,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 19.0,
                            ),
                          ),
                        ),
                      )
                          .toList(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        children: tabs
                            .map(
                              (tap) => ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {

                                      Navigator.pushNamed(
                                        context,
                                        '/active',
                                        arguments: article[index],
                                      );
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .33,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              .13,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              20.0,
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                article[index].imageUrl,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 7.5,
                                                  left: 5.5,
                                                ),
                                                child: Text(
                                                  article[index].title,
                                                  maxLines: 2,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        height: 1.3,
                                                      ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                  MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons
                                                            .watch_later_outlined,
                                                        color: Colors.grey,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        '${DateTime.now().difference(article[index].createdAt).inHours} hours ago',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.visibility,
                                                        color: Colors.grey,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        '${article[index].views}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                itemCount: article.length,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Discover',
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 5),
        Text(
          'News from all over the world',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            suffixIcon: const RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.tune,
                color: Colors.grey,
              ),
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                15.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
