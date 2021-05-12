import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/real_estate.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class DetailScreen extends StatefulWidget {
  final RealEstate realEstate;

  const DetailScreen({Key key, this.realEstate}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DetailScreenState();
  }
}

class _DetailScreenState extends State<DetailScreen> {
  int _current = 0;

  final List<Widget> imageSliders = imgList.map((item) => Container(
    child: Container(
      margin: EdgeInsets.only(top :48.0, left:5.0, right: 5.0, bottom: 5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(29.0)),
          child: Image.network(item, fit: BoxFit.cover, width: 1000.0)
      ),
    ),
  )).toList();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF411FBC),
      body: Stack(
        children: [
          Stack(
            children:[
              Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Column(
                    children: [
                      CarouselSlider(
                        items: imageSliders,
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.map((url) {
                          int index = imgList.indexOf(url);
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Color.fromRGBO(0, 0, 0, 0.9)
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          );
                        }).toList(),
                      ),
                    ]
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                    width: size.width,
                    height: size.height / 10 *5.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(49),
                        topLeft: Radius.circular(49),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top:30.0, left: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "8 Tỷ 800 triệu",
                                  style: TextStyle(
                                      color: Color(0xFF411FBC),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                    "Tam Trinh, p.Yên Sở, q.Hoàng Mai, HN",
                                    style: TextStyle(
                                        color: Color(0xFF707070)
                                    )
                                ),
                                SingleChildScrollView(
                                  padding: EdgeInsets.only(top:35.0, left: 5.0, right: 5.0),
                                  child: Text("Diện tích xây dựng: 90.0m2,"
                                      "\nĐiện: Đầy đủ,"
                                      "\nDiện tích sàn: 90.0m2,"
                                      "\nSàn nhà: Bê tông,"
                                      "\nNội thất: Cơ bản,"
                                      "\n1Phòng bếp,"
                                      "\n1Phòng khách,"
                                      "\n1Phòng tắm"
                                      "\nGiới hạn xây dựng: Xây dựng tự do theo quy hoạch,"
                                      "\nTình trạng pháp lý: Bình Thường"
                                      "\nTình trạng sử dụng: Đang ở,"
                                      "\nSố mặt tiền: 1 mặt tiền"),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            top: 10, right: 30,
                            child: Row(
                              children: [
                                IconButton(icon: Icon(Icons.share_outlined, color: Color(0xFF411FBC)), onPressed: (){}),
                                IconButton(icon: Icon(Icons.favorite, color: Color(0xFF411FBC),), onPressed: (){}),
                              ],
                            )
                        )

                      ],
                    )
                ),
              ),
              Positioned(
                top: 295,
                left: 40,
                child: Container(
                    padding: EdgeInsets.all(7.0),
                    height: 30.0,
                    width: 80.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCB42B),
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text("Biệt thự", style: TextStyle(color: Colors.white, fontSize: 15),)
                ),
              ),
              SafeArea(
                child: Container(
                  margin: EdgeInsets.only(top:20.0, left: 20.0),
                  height: 40.0,
                  child: IconButton(icon: Icon(Icons.chevron_left, color: Colors.white), onPressed: (){
                    Navigator.of(context).pop();
                  }),
                ),
              ),
              Positioned(
                top: 20, right: 20,
                child: Container(
                  margin: EdgeInsets.only(top:20.0),
                  height: 40.0,
                  width: 40.0,
                  child: IconButton(icon: Icon(Icons.notifications_none, color: Colors.white), onPressed: (){}),
                ),
              ),
            ]
        ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.only(left: 50, right: 50, bottom: 50, top: 20) ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: (){}),
                  Container(
                    padding: EdgeInsets.all(7.0),
                    height: 60.0,
                    width: size.width*0.75,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF411FBC),
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Padding(
                           padding: EdgeInsets.only(bottom: 5.0),
                             child: Text("LIÊN HỆ NGAY", style: TextStyle(color: Colors.white, fontSize: 18),)
                         ),
                        Text("09493800004", style: TextStyle(color: Colors.white, fontSize: 12))
                      ],
                    )
                )
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}