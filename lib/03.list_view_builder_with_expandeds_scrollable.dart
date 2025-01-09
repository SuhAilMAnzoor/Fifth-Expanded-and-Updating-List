//Listview Builder with Expanded Scrollable
//Make Container Or Any Widget at the top Like Banners like Advertising Ads or Announcment
//and reset other content perform scrollable action expect Above Banner or Advertising 
import 'package:flutter/material.dart';

class ListviewBuilderWithExpandedsScrollable extends StatefulWidget {
  const ListviewBuilderWithExpandedsScrollable({super.key});

  @override
  State<ListviewBuilderWithExpandedsScrollable> createState() =>
      _ListviewBuilderWithExpandedsScrollableState();
}

class _ListviewBuilderWithExpandedsScrollableState
  extends State<ListviewBuilderWithExpandedsScrollable> {
  TextEditingController friendListController = TextEditingController();

  List friendList = ["Waqar", "Sajjad", "Sohail", "Sario", "Waqar", "Sajjad", "Sohail"];

//Add Items using TextField
  addItem() {
    setState(() {
      friendList.add("value");
    });
  }

  // removeAt Function
  removeItem({meraBanayahowa}) {
    setState(() {
      friendList.removeAt(meraBanayahowa); // Delete item from list
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 119, 3, 41),
          title: TextField(
            controller: friendListController,
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    friendList.add(friendListController.text);
                    friendListController.clear();
                  });
                },
                child: const Text(
                  "Add Item",
                ))
          ],
        ),
        body: Column(children: [
          Container(
            height: 170,    // Suppose This Container is Banner or Advs, its height of Banner or Ad is 170
            color: Colors.red,
          ),
          Expanded(          // Expaneded is Use For Lisview.builder to to 
            child: ListView.builder(
                itemCount: friendList.length, 
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 5), // margin at bottom of each is 5
                    child: ListTile(
                      tileColor: Colors.grey,
                      title: Text(friendList[index]),
                      trailing: IconButton(
                          onPressed: () {
                            removeItem(meraBanayahowa: index);
                          },                
                          icon: const Icon(
                            Icons.delete),
                          ),
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
