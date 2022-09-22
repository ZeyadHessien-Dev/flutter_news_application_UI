import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';

class ActiveScreen extends StatelessWidget {
  const ActiveScreen({Key? key}) : super(key: key);
  static const routeName = '/active';

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            article.imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(150),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        article.category,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  article.title,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.25,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  article.subtitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(
                    10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(
                              10.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 15.0,
                                  backgroundImage:
                                      NetworkImage(article.authorImageUrl),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  article.author,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.all(
                              10.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.watch_later_outlined,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '${DateTime.now().difference(article.createdAt).inHours}h',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          Container(
                            padding: const EdgeInsets.all(
                              10.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.visibility,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '${article.views}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        article.title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        article.body,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(height: 1.5),
                      ),
                      const SizedBox(height: 10,),
                      GridView.count(
                        crossAxisCount: 2,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
                        children: List.generate(2, (index) => Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20.0,
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                article.imageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
