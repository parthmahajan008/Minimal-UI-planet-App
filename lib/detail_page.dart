import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:minimal_ui/constants.dart';
import 'package:minimal_ui/data.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailPage({Key? key, required this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 300,
                    ),
                    Text(
                      planetInfo.name,
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 56,
                        color: primaryTextColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "Solar System",
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 31,
                        color: primaryTextColor,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const Divider(
                      color: Colors.black38,
                    ),
                    Text(
                      planetInfo.description,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 20,
                        color: contentTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const Divider(
                      color: Colors.black38,
                    ),
                  ],
                ),
              ),
              Text(
                "Gallery",
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 25,
                  color: primaryTextColor,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.left,
              ),
              Container(
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: planetInfo.images.length,
                    itemBuilder: (context, index) {
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: AspectRatio(
                            aspectRatio: 1,
                            // decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(30)),
                            child: Image.network(
                              planetInfo.images[index],
                              fit: BoxFit.cover,
                            )),
                      );
                    }),
              )
            ],
          ),
        ),
        Positioned(
            right: -64,
            child: Hero(
                tag: planetInfo.position,
                child: Image.asset(planetInfo.iconImage))),
        Positioned(
          top: 60,
          left: 32,
          child: Text(
            planetInfo.position.toString(),
            style: TextStyle(
              fontFamily: 'Avenir',
              fontSize: 247,
              color: primaryTextColor.withOpacity(0.1),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios))
      ])),
    );
  }
}
