import 'package:flutter/material.dart';
import 'package:healcare_mobile/components/filled_outline_button.dart';
import 'package:healcare_mobile/utils/constant.dart';

import 'chat_card.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(
                kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
            color: kPrimaryColor,
            child: Text(
              "Nhắn tin",
              style: TextStyle(fontSize: 16),
            )
            // Row(
            //   children: [
            //     FillOutlineButton(
            //       press: () {}, text: "Recent Message"),
            //     SizedBox(width: kDefaultPadding),
            //     FillOutlineButton(
            //       press: () {},
            //       text: "Active",
            //       isFilled: false,
            //     ),
            //   ],
            // ),
            ),
        // Expanded(
        //   child: ListView.builder(
        //     // itemCount: chatsData.length,
        //     // itemBuilder: (context, index) => ChatCard(
        //     //   chat: chatsData[index],
        //     //   press: () => Navigator.push(
        //     //     context,
        //     //     MaterialPageRoute(
        //     //       builder: (context) => MessagesScreen(),
        //     //     ),
        //     //   ),
        //     // ),
        //   ),
        // ),
      ],
    );
  }
}
