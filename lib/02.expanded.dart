//Screen Overflow ho khatam ho chuki using physics and shrink wrap,
//shrink kar dega is se zyada nahe bhagega jitna content hai us ke hasb se shrink kar wrap karga parent column men
// shrinkwrap is used for those widgets those have not width and heigh if you are using
// same time and also we make it scrollable
import 'package:flutter/material.dart';

class ContainerWithExpanded extends StatefulWidget {
  const ContainerWithExpanded({super.key});

  @override
  State<ContainerWithExpanded> createState() => _ContainerWithExpandedState();
}

class _ContainerWithExpandedState extends State<ContainerWithExpanded> {
  TextEditingController friendListController = TextEditingController();

  List friendList = ["Waqar", "Sajjad", "Sohail"];

//Add Items using TextField
  addItem() {
    setState(() {
      friendList.add("value");
    });
  }

  // removeAt Function
  removeItem({meraBanayahowa}) {
    setState(() {
      friendList.removeAt(meraBanayahowa); //Delete item from list
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Try Expanded"),
          titleSpacing: 110,  // title spacing
        ),
        body: SafeArea(
          child: Column(children: [
            // Expanded Added
            Expanded(
              flex: 2, //get the maximum space of screen red,by deafult it is 1
              child: Container(
                height: 50,    // RED Container height is 200
                color: Colors.red,  // Colors Set For this container
              ),
              // Second Expanded Added
            ),
            Expanded(
              child: Container(
                height: 200, // YELLOW Container height is Maximum 200 ,but you will see RED container height is actully BIG from rest of two
                color: Colors.yellow, // Color set for this container
              ),
            ),
            Container(
              height: 100,  // GREY Container height is 100
              color: Colors.grey,
            ),
          ]),
        ),
      ),
    );
  }
}
