import 'package:flutter/material.dart';
import 'package:flutter_figma_skill_test/widget/image_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController controller = ScrollController();
  double index = 0;
  List leftList = [];
  List rightList = [];
  List cardData = [
    {
      'name' : 'Kristin Watson',
      'age' : '24',
      'country' : 'Portland',
      'Location' : 'Illinois',
      'distance' : '15 miles',
      'image' : 'asset/image/1.jpeg',
      'liked' : 'None'
    },
    {
      'name' : 'Kirk Franklin',
      'age' : '24',
      'country' : 'UK',
      'Location' : 'London',
      'distance' : '90 miles',
      'image' : 'asset/image/h.jpg',
      'liked' : 'Nope'
    },
    {
      'name' : 'Nati Nigussie',
      'age' : '25',
      'country' : 'USA',
      'Location' : 'New York',
      'distance' : '5 miles',
      'image' : 'asset/image/l.jpeg',
      'liked' : 'Like'
    },
    {
      'name' : 'Kebek Chala',
      'age' : '28',
      'country' : 'Kenya',
      'Location' : 'Mombasa',
      'distance' : '75 miles',
      'image' : 'asset/image/z.jpeg',
      'liked' : 'None'
    },
    {
      'name' : 'Kelkias Emana',
      'age' : '24',
      'country' : 'Ethiopia',
      'Location' : 'Addis Ababa',
      'distance' : '115 miles',
      'image' : 'asset/image/o.jpg',
      'liked' : 'Nope'
    },
  ];
 void initState(){
   for(int i=0; i >= index; i++){
     leftList.add(cardData[i]);
     print('LeftList: $leftList');
   }
   for(double i=index+1; i >= cardData.length; i++){
     rightList.add(cardData[(i).round()]);
     print('RightList: $rightList');
   }

   setState(() {
     index =  controller.position.pixels/MediaQuery.of(context).size.width.ceil()-1;
   });
   super.initState();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('asset/image/Vector.png'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemCount: cardData.length,
                shrinkWrap: true,
                itemBuilder: (ctx,i){
                  return ImageCard(CardItem: cardData[i]);
                }
                ),
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
              alignment: Alignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   border: Border.all(
                     color: Colors.red,
                     width: 2,
                   ),
                  ),
                  ),
                  const Icon(
                    Icons.close_rounded,
                    color: Colors.red,
                    size: 40,
                    )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Stack(
                alignment: Alignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     border: Border.all(
                       color: Colors.lightBlue,
                       width: 1,
                     ),
                    ),
                    ),
                    const Icon(
                      Icons.star_rate_rounded,
                      color: Colors.lightBlue,
                      size: 25,
                      )
                  ],
                ),
              ),
              Stack(
              alignment: Alignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   border: Border.all(
                     color: Colors.green,
                     width: 2,
                   ),
                  ),
                  ),
                  const Icon(
                    Icons.favorite,
                    color: Colors.green,
                    size: 40,
                    )
                ],
              )              
            ],
            ),
            const SizedBox(height: 20,)

        ],
      )
    );
    
  }
}

