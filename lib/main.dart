import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:clone_user_app/Menu/login.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resaurant Mobile App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: ListView(
          children: [
            SizedBox(height: 16.0),
            MyAppBar(),
            SizedBox(height: 16.0),
            Carousel(),
            SizedBox(height: 16.0),
            TabLogin(),
            SizedBox(height: 16.0),
            MenuList(),
            SizedBox(height: 16.0),
            ChartMusicList(),
          ],
        ),
      ),
    );
  }
}

// Images

final List<String> imagesList = [
  'https://media-cdn.tripadvisor.com/media/photo-s/14/ac/b1/5e/burger-menu.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJWbrbo-RF-n6g_v8-HujMwT6NWtbnVHNSYQ&usqp=CAU',
  'https://www.ismaya.com/storage/app/uploads/public/620/221/2a2/6202212a22462047074626.jpeg',
  'https://i.pinimg.com/736x/bf/ee/f4/bfeef4e16e76af17b73c5e5645df298f.jpg',
];

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hi, HolyPeople',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                'Click To Login',
                style: TextStyle(color: Colors.yellowAccent),
              ),
            ],
          ),
          const Icon(
            Icons.notifications,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            //scrollDirection: Axis.vertical,
            onPageChanged: (index, reason) {
              setState(
                () {
                  _currentIndex = index;
                },
              );
            },
          ),
          items: imagesList
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    margin: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    elevation: 6.0,
                    shadowColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imagesList.map((urlOfItem) {
            int index = imagesList.indexOf(urlOfItem);
            return Container(
              width: 10.0,
              height: 10.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Colors.yellow : Colors.white,
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

class TabLogin extends StatelessWidget {
  const TabLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Login()));
        },
        child: Container(
          padding: const EdgeInsets.only(left: 20.0),
          height: 85.0,
          width: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.amber),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                FontAwesomeIcons.userCircle,
                size: 40.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "Login To See Voucher And Point Information",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Expanded(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(
                FontAwesomeIcons.addressBook,
                color: Colors.yellow,
                size: 40.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Contact",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
          Column(
            children: [
              Icon(
                FontAwesomeIcons.moneyBill,
                color: Colors.yellow,
                size: 40.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Bills",
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              )
            ],
          ),
          Column(
            children: [
              Icon(
                FontAwesomeIcons.motorcycle,
                color: Colors.yellow,
                size: 40.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Delivery",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
          Column(
            children: [
              Icon(
                FontAwesomeIcons.shoppingBag,
                color: Colors.yellow,
                size: 40.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Shop",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
        ],
      )),
    );
  }
}

class ChartMusic extends StatelessWidget {
  const ChartMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/id/4/45/Divide_cover.png'),
                      fit: BoxFit.cover)),
              height: 100.0,
              width: 100.0,
            ),
            SizedBox(
              width: 16.0,
            ),
            Container(
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Nama Band',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    Container(
                        width: 200.0,
                        child: Text('Judul',
                            style: TextStyle(color: Colors.white30))),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class ChartMusicList extends StatelessWidget {
  const ChartMusicList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xff696564),
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chart Music List',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ChartMusic(),
                  ChartMusic(),
                  ChartMusic(),
                  ChartMusic(),
                  ChartMusic(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(
                            FontAwesomeIcons.delicious,
                            size: 35,
                          ),
                          Text(
                            "Delicius",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            FontAwesomeIcons.delicious,
                            size: 35,
                          ),
                          Text(
                            "Delicius",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
