import 'package:flutter/material.dart';
import 'package:news_application_ui/models/article_model.dart';
import 'package:news_application_ui/modules/discover_screen.dart';

import '../widgets/bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/';
  List<Article> article = Article.articles;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.menu,
        ),
      ),
      bottomNavigationBar: BottomBarNavigation(
        index: index,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          _NewsOfTheDay(
            article: article,
          ),
          const _CustomHeaders(),
          _BreakingNews(
            article: article,
          ),
        ],
      ),
    );
  }
}

class _NewsOfTheDay extends StatelessWidget {
  const _NewsOfTheDay({
    Key? key,
    required this.article,
  }) : super(key: key);
  final List<Article> article;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .4,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(
                20.0,
              ),
              bottomRight: Radius.circular(
                20.0,
              ),
            ),
            image: DecorationImage(
              image: NetworkImage(
                article[0].imageUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsetsDirectional.all(
                  10.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                ),
                child: Text(
                  'News Of The Day',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                article[0].title,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.25,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      'Learn More',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CustomHeaders extends StatelessWidget {
  const _CustomHeaders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Text(
            'Breaking News',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text('More', style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}

class _BreakingNews extends StatelessWidget {
  const _BreakingNews({Key? key, required this.article}) : super(key: key);
  final List<Article> article;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, DiscoverScreen.routeName);
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .52,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        right: 10,
                      ),
                      width: MediaQuery.of(context).size.width * .51,
                      height: MediaQuery.of(context).size.height * .17,
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
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .49,
                      child: Text(
                        article[index].title,
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold, height: 1.3),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${DateTime.now().difference(article[index].createdAt).inHours} hours ago',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'by ${article[index].author}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: article.length,
        ),
      ),
    );
  }
}
