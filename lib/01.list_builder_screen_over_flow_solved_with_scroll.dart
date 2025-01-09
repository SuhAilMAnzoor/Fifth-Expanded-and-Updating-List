//Screen Overflow ho khatam ho chuki using physics and shrink wrap,
//shrink kar dega is se zyada nahe bhagega jitna content hai us ke hasb se shrink kar wrap karga parent column men
// shrinkwrap is used for those widgets those have not width and height if you are using
// same time and also we make it scrollable
import 'package:flutter/material.dart';

class ContainerWithListViewBuilder extends StatefulWidget {
  const ContainerWithListViewBuilder({super.key});

  @override
  State<ContainerWithListViewBuilder> createState() =>
      _ContainerWithListViewBuilderState();
}

class _ContainerWithListViewBuilderState
    extends State<ContainerWithListViewBuilder> {
  TextEditingController friendListController = TextEditingController();

  List friendList = ["Waqar", "Sajjad", "Sohail", 'WAQAR', "Sajjad", "Sohail", "Waqar", "Sohail", "Sajjad", "Waqar","SAJJAD","SOHAIL"];

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
        ),
        body: SingleChildScrollView(   // Parent Scrollable For All
          child: Column(children: [
            Container(
              height: 200,
              color: Colors.red,
            ),
                        TextField(
            controller: friendListController,
          ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    friendList.add(friendListController.text);
                    friendListController.clear();
                  });
                },
                child: const Text(
                  "Add Item",
                )),
            ListView.builder(
                shrinkWrap: true,  // shrinkWrap shrink both Listview builder and Container to shrink
                physics: NeverScrollableScrollPhysics(), // reset of Listview builder is scrollable means list is scrollable 
                itemCount: friendList.length, // total length of friendList
                itemBuilder: (bcontext, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child: ListTile(
                      tileColor: Colors.grey,
                      title: Text(friendList[index]), // print the list names that are already stored in frinedList
                      trailing: IconButton(
                          onPressed: () {
                            removeItem(meraBanayahowa: index); // You Can Delete Items or Names You have added 
                          },
                          icon: const Icon(
                            Icons.delete,     
                          )),
                    ),
                  );
                })
          ]),
        ),
      ),
    );
  }
}
