import 'package:flutter/material.dart';

class MyA1 extends StatefulWidget {
  @override
  _MyA1State createState() => _MyA1State();
}

class _MyA1State extends State<MyA1> with SingleTickerProviderStateMixin {
  var myanicon;
  var animation;
  var animation2;

  @override
  void initState() {
    super.initState();
    myanicon = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    print(myanicon);

    animation = CurvedAnimation(parent: myanicon, curve: Curves.bounceInOut)
      ..addListener(() {
        setState(() {
          print(animation.value);
        });
      });

    print(animation);

    myanicon.forward();
    print(myanicon);
  }

  @override
  void dispose() {
    super.dispose();
    myanicon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String url =
        "https://hips.hearstapps.com/hmg-prod/amv-prod-cad-assets/wp-content/uploads/2016/04/2016-Lamborghini-Aventador-LP750-4-SV-201.jpg?resize=980:*";
    return Center(
      child: Card(
        elevation: 15 * animation.value,
        child: GestureDetector(
          onTap: () {
            myanicon.forward(from: 0.5);
            print("clicked ..");
          },
          child: Container(
            width: 200 * animation.value + 50,
            height: 250 * animation.value + 50,
            color: Colors.amber,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: new EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.red,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(url),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Divyansh Sinha',
                      style: TextStyle(
                        fontSize: 24.0 * animation.value + 8.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
