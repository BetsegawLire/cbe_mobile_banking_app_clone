import 'package:cbe_mobile_banking/confirm_payment.dart';
import 'package:cbe_mobile_banking/custome_alert_dialog.dart';
import 'package:cbe_mobile_banking/models/transfer_model.dart';
import 'package:cbe_mobile_banking/select_receiver.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransferAmount extends StatefulWidget {
  final String accountName;
  final String accountNumber;

  TransferAmount(
      {super.key, required this.accountName, required this.accountNumber});

  @override
  State<TransferAmount> createState() => _TransferAmountState();
}

class _TransferAmountState extends State<TransferAmount> {
  TextEditingController amountController = new TextEditingController();
  TextEditingController remarkController = new TextEditingController();

  bool _isButtonEnabled = false;
  int? balance;

  @override
  void initState() {
    getSharedPrefs();
    // TODO: implement initState
    super.initState();
  }

  void getSharedPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      balance = prefs.getInt("balance");
    });
  }

  void setNewBalance(int amount) async {
    // getSharedPrefs();
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      balance = balance! - amount;
      prefs.setInt("balance", balance!);
    });
    print("deducted");
    print(balance);
  }

  void _validateInput(String value) {
    setState(() {
      // Enable the button if the input is not empty
      // _isButtonEnabled = value.isNotEmpty;
      if (amountController.text != "" && remarkController.text != "") {
        setState(() {
          _isButtonEnabled = true;
        });
      } else {
        setState(() {
          _isButtonEnabled = false;
        });
      }
    });
  }

  void _onButtonPressed() {
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        accountName: widget.accountName.toUpperCase(),
        accountNumber: widget.accountNumber,
        amount: amountController.text,
        reason: remarkController.text,
        onCancel: () {
          Navigator.pop(context);
          // Handle cancel action
        },
        onContinue: () {
          if (int.parse(amountController.text) > balance!) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Your balance is insufficient")));
            Navigator.pop(context);
          } else {
            setNewBalance(int.parse(amountController.text));
            Navigator.pop(context);

            showDialog(
              context: context,
              builder: (context) => ConfirmAlert(
                accountName: widget.accountName.toUpperCase(),
                accountNumber: widget.accountNumber,
                amount: amountController.text,
                reason: remarkController.text,
                onCancel: () {
                  Navigator.pop(context);
                  // Handle cancel action
                },
                onContinue: () {
                  Navigator.pop(context);
                  // Handle continue action
                },
              ),
            );
          }
          // Handle continue action
        },
      ),
    );
    // Handle button press
    // print('Button pressed!');
    // Navigator.push(context, MaterialPageRoute(
    //   builder: (context) {
    //     return SelectReceiver(
    //         accountName: accountNameController.text,
    //         accountNumber: accountNumberController.text);
    //   },
    // ));
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
              "payment details ${widget.accountName}".toLowerCase(),
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: amountController,
              onChanged: _validateInput,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Amount',
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
              controller: remarkController,
              onChanged: _validateInput,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Reason',
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
