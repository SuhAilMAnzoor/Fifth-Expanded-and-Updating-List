//Screen Overflow ho khatam ho chuki using physics and shrink wrap,
//shrink kar dega is se zyada nahe bhagega jitna content hai us ke hasb se shrink kar wrap karga parent column men
// shrinkwrap is used for those widgets those have not width and heigh if you are using
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
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 200,
              color: Colors.red,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (bcontext, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child: ListTile(
                      tileColor: Colors.grey,
                      title: Text(index.toString()),
                      trailing: IconButton(
                          onPressed: () {
                            removeItem(meraBanayahowa: index);
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
