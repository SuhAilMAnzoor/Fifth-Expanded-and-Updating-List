// *IMPORTANT For me to look it again and learn more how things work
//This is the application that perform CRUD operations
//using listview builder

// Same Previous Program <04.listview_updating_list.dart> but some modification
// in this Application i made a function of updating the content usiing function
// FOR SHOWING REUSEIBLITY OF THE CODE and good approch to follow
import 'package:flutter/material.dart';

class ListviewUpdatingListWithUpdateFunction extends StatefulWidget {
  const ListviewUpdatingListWithUpdateFunction({super.key});

  @override
  State<ListviewUpdatingListWithUpdateFunction> createState() =>
      _ListviewUpdatingListWithUpdateFunctionState();
}

class _ListviewUpdatingListWithUpdateFunctionState
    extends State<ListviewUpdatingListWithUpdateFunction> {
  TextEditingController friendListController = TextEditingController();

  TextEditingController updateItemController = TextEditingController();
  List friendList = ["Waqar", "Sajjad", "Sohail"];

  //Add Items using TextField
  addItem() {
    setState(() {
      friendList.add("value");
    });
  }

  // Update Item
  updateItem(index) {
    updateItemController.text = friendList[index];
    showDialog(
        context: context,
        // barrierDismissible: false,   //use for lock the alreat dialog pop
        builder: (context) {
          return AlertDialog(
            title: const Text("Update Value"),
            content: TextField(
              controller: updateItemController,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    friendList[index] = updateItemController.text;
                  });
                  updateItemController.clear();
                  Navigator.pop(context);
                },
                child: const Text(
                  "Update",
                ),
              )
            ],
          );
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
    return Scaffold(
      appBar: AppBar(
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
      body: SafeArea(
        child: ListView.builder(
            itemCount: friendList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: ListTile(
                  tileColor: Colors.grey,
                  title: Text(friendList[index]),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        onPressed: () {
                          updateItem(index);
                        },
                        icon: const Icon(
                          Icons.edit,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            removeItem(meraBanayahowa: index);
                          },
                          icon: const Icon(
                            Icons.delete,
                          )),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
