import 'package:flutter/material.dart';
import 'package:sociout/utils/colors.dart';
import 'package:sociout/utils/constraints.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Chats',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: mainColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    //contentPadding: const EdgeInsets.all(16),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: kBlack,
                    ),
                    hintText: 'Search for Chat & Message',
                    hintStyle: const TextStyle(color: kBlack),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: kBlack),
                    )),
              ),
              kheight20,
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://cdn.dribbble.com/users/3734064/screenshots/14348087/media/a99ab961c8f8c7d29b5f7136e0b19ca4.png?compress=1&resize=400x300&vertical=top'),
                      ),
                      title: Text(
                        'Jhon Smith',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'You: Hey, will you come to the \n part Saturday 😄',
                      ),
                      trailing: Icon(Icons.check),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return kheight20;
                  },
                  itemCount: 6)
            ],
          ),
        ),
      ),
    );
  }
}
