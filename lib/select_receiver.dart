import 'package:cbe_mobile_banking/account_number.dart';
import 'package:cbe_mobile_banking/models/transfer_model.dart';
import 'package:cbe_mobile_banking/transfer_amount.dart';
import 'package:flutter/material.dart';

class SelectReceiver extends StatefulWidget {
  final String accountNumber;
  final String accountName;

  SelectReceiver(
      {super.key, required this.accountName, required this.accountNumber});

  @override
  State<SelectReceiver> createState() => _SelectReceiverState();
}

class _SelectReceiverState extends State<SelectReceiver> {
  String? lastFourCharacters;

  @override
  initState() {
    super.initState();
    lastFourCharacters = extractLastFourCharacters(widget.accountNumber);
  }

  String extractLastFourCharacters(String input) {
    if (input.length >= 4) {
      return input.substring(input.length - 4);
    } else {
      // Handle cases where the input string is less than 4 characters
      return "Input string is too short!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.purple,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Am",
                style: TextStyle(
                  color: Colors.purple,
                ),
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.refresh,
                color: Colors.purple,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.qr_code,
          color: Colors.black,
          size: 35,
        ),
        backgroundColor: Colors.purple,
        shape: CircleBorder(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Saving - ETB - $lastFourCharacters",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            tileColor: Colors.white,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return TransferAmount(
                    accountName: widget.accountName,
                    accountNumber: widget.accountNumber,
                  );
                },
              ));
            },
            leading: Icon(
              Icons.account_balance,
              color: Colors.purple,
              size: 40,
            ),
            title: Text(
              "${widget.accountName}-ETB-$lastFourCharacters".toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.purple),
            ),
            subtitle: Text(
              widget.accountName.toUpperCase(),
              style: TextStyle(color: Colors.grey),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
              color: Colors.purple,
            ),
          )
        ],
      ),
    );
  }
}
