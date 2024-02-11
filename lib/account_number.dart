import 'package:cbe_mobile_banking/models/transfer_model.dart';
import 'package:cbe_mobile_banking/select_receiver.dart';
import 'package:flutter/material.dart';

class AccountNumber extends StatefulWidget {
  AccountNumber({super.key});

  @override
  State<AccountNumber> createState() => _AccountNumberState();
}

class _AccountNumberState extends State<AccountNumber> {
  TextEditingController accountNumberController = new TextEditingController();
  TextEditingController accountNameController = new TextEditingController();

  bool _isButtonEnabled = false;

  void _validateInput(String value) {
    setState(() {
      // Enable the button if the input is not empty
      _isButtonEnabled = value.isNotEmpty;
    });
  }

  void _onButtonPressed() {
    // Handle button press
    print('Button pressed!');
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return SelectReceiver(
            accountName: accountNameController.text,
            accountNumber: accountNumberController.text);
      },
    ));
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Saving - etb - 6497",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: accountNumberController,
              onChanged: _validateInput,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Account No',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 10,
                ),
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.purple.shade400, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.purple.shade400, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              controller: accountNameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Account Name',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 10,
                ),
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.purple.shade400, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.purple.shade400, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: !_isButtonEnabled ? Colors.grey.shade300 : Colors.purple,
              ),
              child: TextButton(
                  onPressed: _isButtonEnabled ? _onButtonPressed : null,
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
