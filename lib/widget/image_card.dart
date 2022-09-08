import 'package:flutter/material.dart';
import 'package:flutter_figma_skill_test/core/constants.dart';

class ImageCard extends StatefulWidget {
  final CardItem;
  ImageCard({required this.CardItem});

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05, vertical: 25),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width*0.9,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.CardItem['image']),
            fit: BoxFit.cover 
            ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Align(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child:(widget.CardItem['liked'] == nope) ? 
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                             color: Colors.red,
                             width: 3,
                           ),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Text(
                            'NOPE',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: Colors.red
                            ),
                            ),
                  ),
                ],
              ):(widget.CardItem['liked'] == like) ? 
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                             color: Colors.lightGreen,
                             width: 3,
                           ),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Text(
                      'LIKE',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Colors.lightGreen
                      ),
                      ),
                  ),
                ],
              ): Container()),
              const Spacer(),
              Text(
                '${widget.CardItem['name']},${widget.CardItem['age']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.w600
                ),
              ),
              Text(
                'Lives in ${widget.CardItem['country']},${widget.CardItem['Location']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  // fontWeight: FontWeight.w600
                ),  
                ),
                Text(
                '${widget.CardItem['distance']} away',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  // fontWeight: FontWeight.w600
                ),  
                ),
                const SizedBox(height: 20,)  
            ],
          ),
        ),
      ),
    );
  }
}