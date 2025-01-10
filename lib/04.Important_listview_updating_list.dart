import 'package:flutter/material.dart';
//This is the Item Remeber Application that perform all CRUD operations
// i have create a list where you can add, update, delete, and store your items using listview builder

class ListviewUpdatingList extends StatefulWidget {
  const ListviewUpdatingList({super.key});

  @override
  State<ListviewUpdatingList> createState() => _ListviewUpdatingListState();
}

class _ListviewUpdatingListState extends State<ListviewUpdatingList> {
  TextEditingController friendListController = TextEditingController();

  TextEditingController updateItemController = TextEditingController(); // Editing Controller for Getting Input
  List Items = ["Murgi - Kilo-Gram", "Tamatos 1KG", "Red Chile 0.5 Gram"]; //Some stored names in the Items Variable  

  //Add Items using TextField
  addItem() {
    setState(() {
      Items.add("value");
    });
  }

  // removeAt Function
  removeItem({meraBanayahowa}) {
    setState(() {
      Items.removeAt(meraBanayahowa); //Delete item from list
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Items Remeber Application")
        ),
        body: Column(
          children: [
            TextField(
          controller: friendListController,
        ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  Items.add(friendListController.text);
                  friendListController.clear();
                });
              },
              child: const Text(
                "Add Item",
              )),
            Expanded(
              child: ListView.builder(
                  itemCount: Items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 3),
                      child: ListTile(
                        tileColor: const Color.fromARGB(255, 243, 177, 55),
                        title: Text(Items[index]),
                        trailing: Wrap(
                          children: [
                            IconButton(
                              onPressed: () {
                                updateItemController.text = Items[index];
                                showDialog(
                                    context: context,
                                    // barrierDismissible: false,   //use for lock the alreat dialog pop
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Update Value"),
                                        content: TextField(
                                          controller:
                                              updateItemController, //getting the input for updation in updateItemController
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                Items[
                                                        index] = //When a user click any edit button it will change
                                                    updateItemController
                                                        .text; //that index's value
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
          ],
        ),
      ),
    );
  }
}
