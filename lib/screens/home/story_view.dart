import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:projects/utils/size_config.dart';
import 'package:story/story_page_view/story_page_view.dart';

class StoryView extends StatelessWidget {
  const StoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: StoryPageView(
        backgroundColor: Colors.black26,
        itemBuilder: (context, pageIndex, storyIndex) {
          return Stack(
            children: [
              Container(
                height: SizeConfig.height*100,
                width: SizeConfig.width*100,
                child: CachedNetworkImage(
                  imageUrl: "https://picsum.photos/200/300?random=2",
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 44, left: 8),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://picsum.photos/200/300?random=88"),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                   const  Text(
                      "usere",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },

        storyLength: (pageIndex) {
          return 3;
        },
        pageLength: 4,
      ),
    ));
  }
}
