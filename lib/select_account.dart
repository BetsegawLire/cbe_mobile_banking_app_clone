import 'package:cbe_mobile_banking/account_number.dart';
import 'package:cbe_mobile_banking/models/transfer_model.dart';
import 'package:flutter/material.dart';

class SelectAccount extends StatelessWidget {
  SelectAccount({super.key});

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
            "Select",
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
                  return AccountNumber();
                },
              ));
            },
            leading: Icon(
              Icons.account_balance,
              color: Colors.purple,
              size: 40,
            ),
            title: Text(
              "Saving - ETB - 6497",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.purple[900]),
            ),
            subtitle: Text(
              "Balance: ETB 8,691.84",
              style: TextStyle(color: Colors.grey),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
              color: Colors.purple[900],
            ),
          )
        ],
      ),
    );
  }
}
