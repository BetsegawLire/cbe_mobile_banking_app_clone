import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAlertDialog extends StatefulWidget {
  final String accountName;
  final String accountNumber;
  final String amount;
  final String reason;
  final void Function() onCancel;
  final void Function() onContinue;

  CustomAlertDialog({
    required this.accountName,
    required this.accountNumber,
    required this.amount,
    required this.reason,
    required this.onCancel,
    required this.onContinue,
  });

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  String? lastFourCharacters;
  int? balance;

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

  void getSharedPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    balance = prefs.getInt("balance");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: AlertDialog(
        // insetPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        // titlePadding: EdgeInsets.symmetric(vertical: 0),
        // buttonPadding: EdgeInsets.symmetric(vertical: 10),
        actionsPadding: EdgeInsets.symmetric(vertical: 10),
        // surfaceTintColor: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0), // Set border radius
        ),
        title: Container(
          padding: EdgeInsets.all(16.0),
          // width: double.infinity,
          color: Colors.purple, // Set purple background color
          child: Text(
            "Transfer",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Message",
              style: TextStyle(color: Colors.grey),
            ),
            // SizedBox(height: 16),
            Text(
              "Debit Acc: Betsegaw Lire Garedew",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Credit Acc: ${widget.accountName}-ETB-$lastFourCharacters",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Amount: ${widget.amount}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Reason: ${widget.reason}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: widget.onCancel,
            child: Text(
              "CANCEL",
              style: TextStyle(color: Colors.purple),
            ),
          ),
          TextButton(
            onPressed: widget.onContinue,
            child: Text(
              "CONTINUE",
              style: TextStyle(color: Colors.purple),
            ),
          ),
        ],
      ),
      // child: AlertDialog(
      //   insetPadding: EdgeInsets.zero,
      //   titlePadding: EdgeInsets.zero,
      //   // titlePadding: EdgeInsets.symmetric(vertical: 0),
      //   // buttonPadding: EdgeInsets.symmetric(vertical: 10),
      //   actionsPadding: EdgeInsets.symmetric(vertical: 10),
      //   // surfaceTintColor: Colors.purple,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(0), // Set border radius
      //   ),
      //   title: Container(
      //     padding: EdgeInsets.all(16.0),
      //     // width: double.infinity,
      //     color: Colors.purple, // Set purple background color
      //     child: Text(
      //       "Transfer",
      //       textAlign: TextAlign.center,
      //       style: TextStyle(
      //           color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      //     ),
      //   ),
      //   content: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         "Message",
      //         style: TextStyle(color: Colors.grey),
      //       ),
      //       // SizedBox(height: 16),
      //       Text(
      //         "Debit Acc: ${widget.accountName}",
      //         style: TextStyle(fontWeight: FontWeight.bold),
      //       ),
      //       Text(
      //         "Credit Acc: ${widget.accountName}-ETB-$lastFourCharacters",
      //         style: TextStyle(fontWeight: FontWeight.bold),
      //       ),
      //       Text(
      //         "Amount: ${widget.amount}",
      //         style: TextStyle(fontWeight: FontWeight.bold),
      //       ),
      //       Text(
      //         "Reason: ${widget.reason}",
      //         style: TextStyle(fontWeight: FontWeight.bold),
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     TextButton(
      //       onPressed: widget.onCancel,
      //       child: Text(
      //         "CANCEL",
      //         style: TextStyle(color: Colors.purple),
      //       ),
      //     ),
      //     TextButton(
      //       onPressed: widget.onContinue,
      //       child: Text(
      //         "CONTINUE",
      //         style: TextStyle(color: Colors.purple),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
