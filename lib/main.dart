import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Account',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(icon: Icon(Icons.message,color: Colors.white,), onPressed: null),
              IconButton(icon: Icon(Icons.settings_outlined,color: Colors.white,), onPressed: null)
            ],
            expandedHeight: 200,
            floating: true,
            pinned: true,
            snap: false,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints){
                top = constraints.biggest.height;
                return FlexibleSpaceBar(
                    centerTitle: false,
                    title: top==80.0? AnimatedOpacity(
                        duration: Duration(milliseconds: 0),
                        opacity: top == 80.0 ? 1.0 : 0.0,
                        //opacity: 1.0,
                        child: Text(
                          'Sign In / Register',
                          style: TextStyle(
                            fontSize: 16
                        ),
                        )
                    ): Container(
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: Get.height/10,
                            child: Text(
                                'Sign In / Register',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(height: 2,),
                                Text(
                                  'Wishlist',
                                  style: TextStyle(
                                    fontSize: 8
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: Get.width/5,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(height: 2,),
                                Text(
                                  'Viewed',
                                  style: TextStyle(
                                      fontSize: 8
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: Get.width/2.5,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.wysiwyg,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(height: 2,),
                                Text(
                                  'Coupons',
                                  style: TextStyle(
                                      fontSize: 8
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.deepOrange,
                            Colors.orange[100],
                          ]
                      ),
                    ),
                  )
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                child: Column(
                  children: [
                    _orders(),
                    _wallet(),
                    _funWaysToSave(),
                    _services(),
                    _orders(),
                    _wallet(),
                    _funWaysToSave(),
                    _services(),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200]
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

Widget _orders(){
  return Padding(
    padding: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
    child: Container(
      width: Get.width,
      height: Get.height/6,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(14)
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, top: 15),
            child: Text(
              'Orders',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                fontSize: 17
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20,top: 15),
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Icon(
                          Icons.pending,
                        size: 30,
                        color: Colors.deepOrange[300],
                      ),
                    ),
                    Text(
                        "Pending",
                      style: TextStyle(
                        fontSize: 11
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: Get.width/10),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Icon(
                          Icons.update,
                          size: 30,
                          color: Colors.deepOrange[300],
                        ),
                      ),
                      Text(
                        "Processing",
                        style: TextStyle(
                            fontSize: 11,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Get.width/10),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Icon(
                          Icons.airplanemode_on_rounded,
                          size: 30,
                          color: Colors.deepOrange[300],
                        ),
                      ),
                      Text(
                        "Shipped",
                        style: TextStyle(
                            fontSize: 11
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Get.width/10),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Icon(
                          Icons.message,
                          size: 30,
                          color: Colors.deepOrange[300],
                        ),
                      ),
                      Text(
                        "Review",
                        style: TextStyle(
                            fontSize: 11
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _wallet(){
  return Padding(
    padding: EdgeInsets.only(bottom: 10, left: 5, right: 5),
    child: Container(
      width: Get.width,
      height: Get.height/9,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(14)
          )
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                'Wallet',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10,top: 15),
              child: Row(
                children: [
                  Text('Points',
                    style: TextStyle(
                        fontSize: 13
                    ),
                  ),
                  SizedBox(width: Get.width/20,),
                  Text(
                    '0',
                    style: TextStyle(
                      color: Colors.deepOrange[300],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: Get.width/3,),
                  Text('Amount',
                    style: TextStyle(
                        fontSize: 13
                    ),
                  ),
                  SizedBox(width: Get.width/20,),
                  Text(
                    '\$0.00',
                    style: TextStyle(
                        color: Colors.deepOrange[300],
                        fontWeight: FontWeight.bold,
                        fontSize: 13
                    ),
                  ),
                ],
              ),
            ),
          ]
      ),
    ),
  );
}

Widget _funWaysToSave(){
  return Padding(
    padding: EdgeInsets.only(bottom:10, left: 5, right: 5),
    child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(14)
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 15),
              child: Text(
                'Fun Ways To Save',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Wrap(
                children: [
                  _funWaysToSaveItem("Get It Free", Icons.attach_money,Colors.orange),
                  SizedBox(width:25),
                  _funWaysToSaveItem("Group Buy", Icons.person,Colors.blue),
                  SizedBox(width:25),
                  _funWaysToSaveItem("Get 10% off", Icons.disc_full_rounded,Colors.pinkAccent),
                  SizedBox(width:25),
                  _funWaysToSaveItem("Game", Icons.videogame_asset,Colors.pink[100]),
                  SizedBox(width:25),
                  _funWaysToSaveItem("Check In", Icons.check,Colors.red[300]),
                ],
              ),
            )
          ],
        )
    ),
  );
}

Widget _funWaysToSaveItem(String name, IconData icon, Color color){
  return Padding(
    padding: EdgeInsets.only(bottom: Get.height/65),
    child: Column(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  color,
                  Colors.white,
                ],
            ),
          ),
          child: Icon(
            icon,
            color: color,
            size: 22,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            name,
            style: TextStyle(
                fontSize: 11
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _services(){
  return Padding(
    padding: EdgeInsets.only(bottom: 10, left: 5, right: 5),
    child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(14)
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 15),
              child: Text(
                'Services',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Wrap(
                children: [
                  _servicesItem("Address Book", Icons.location_on),
                  SizedBox(width: Get.width/30,),
                  _servicesItem("Help Center", Icons.headset_mic_rounded),
                  SizedBox(width: Get.width/30,),
                  _servicesItem("My Reviews", Icons.message),
                  SizedBox(width: Get.width/30,),
                  _servicesItem("Return/Repair", Icons.replay),
                  SizedBox(width: Get.width/30,),
                  _servicesItem("Settings", Icons.settings),
                ],
              ),
            )
          ],
        )
    ),
  );
}

Widget _servicesItem(String name, IconData icon){
  return Padding(
    padding: EdgeInsets.only(bottom: Get.height/65),
    child: Column(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.deepPurple[50],
                  Colors.white,
                ]
            ),
          ),
          child: Icon(
            icon,
            color: Colors.deepOrange[300],
            size: 22,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            name,
            style: TextStyle(
                fontSize: 11
            ),
          ),
        ),
      ],
    ),
  );
}
