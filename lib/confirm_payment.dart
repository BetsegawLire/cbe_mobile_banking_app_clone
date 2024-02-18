import 'package:cbe_mobile_banking/main.dart';
import 'package:flutter/material.dart';

class ConfirmAlert extends StatefulWidget {
  final String accountName;
  final String accountNumber;
  final String amount;
  final String reason;
  final void Function() onCancel;
  final void Function() onContinue;

  ConfirmAlert({
    required this.accountName,
    required this.accountNumber,
    required this.amount,
    required this.reason,
    required this.onCancel,
    required this.onContinue,
  });

  @override
  State<ConfirmAlert> createState() => _ConfirmAlertState();
}

class _ConfirmAlertState extends State<ConfirmAlert> {
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

  String getMonthName(int month) {
    final now = DateTime.now();
    if (month == 1) {
      return "Jan";
    } else if (month == 2) {
      return "Feb";
    } else if (month == 3) {
      return "Mar";
    } else if (month == 4) {
      return "Apr";
    } else if (month == 5) {
      return "May";
    } else if (month == 6) {
      return "Jun";
    } else if (month == 7) {
      return "Jul";
    } else if (month == 8) {
      return "Aug";
    } else if (month == 9) {
      return "Sep";
    } else if (month == 10) {
      return "Oct";
    } else if (month == 11) {
      return "Nov";
    } else if (month == 12) {
      return "Dec";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(15),
      titlePadding: EdgeInsets.symmetric(vertical: 0),
      buttonPadding: EdgeInsets.symmetric(vertical: 10),
      actionsPadding: EdgeInsets.symmetric(vertical: 10),
      // surfaceTintColor: Colors.purple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // Set border radius
      ),
      title: Container(
        padding: EdgeInsets.only(top: 10, bottom: 20, left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          color: Colors.lightGreen.shade400,
        ),
        // Set purple background color
        // child: Text(
        //   "Transfer",
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //       color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        // ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.safety_check_rounded,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 70,
                      child: Text(
                        "Thank You!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      "Success",
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.download,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ));
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Message",
              style: TextStyle(color: Colors.grey),
            ),
            // SizedBox(height: 16),
            Text(
              "ETB ${widget.amount} debited from ${widget.accountName}-ETB-$lastFourCharacters for 364831996497 (A2A) on ${DateTime.now().day}-${getMonthName(DateTime.now().month)}-${DateTime.now().year} with transaction ID: FT24006Z70N6.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("images/qr_code.jpg"),
              )),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.brown.shade300,
                    borderRadius: BorderRadius.circular(50)),
                width: MediaQuery.of(context).size.width * 0.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.note_add,
                    ),
                    Text("VIEW RECEIPT")
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              // height: 0,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5)),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 0,
                ),
                // leading: Icon(
                //   Icons.balance,
                //   size: 40,
                // )
                // ,
                leading: SizedBox(
                  width: 40,
                  child: Image.asset(
                    "images/cbe_logo.png",
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text(
                  "Commercial Bank of Ethiopia",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                subtitle: Text(
                  "The Bank You always Rely on!",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


// child: AlertDialog(
//           titlePadding: EdgeInsets.symmetric(vertical: 0),
//           buttonPadding: EdgeInsets.symmetric(vertical: 10),
//           actionsPadding: EdgeInsets.symmetric(vertical: 10),
//           // surfaceTintColor: Colors.purple,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(0), // Set border radius
//           ),
//           title: Container(
//             padding: EdgeInsets.only(top: 10, bottom: 20, left: 10),
//             color: Colors.lightGreen, // Set purple background color
//             // child: Text(
//             //   "Transfer",
//             //   textAlign: TextAlign.center,
//             //   style: TextStyle(
//             //       color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
//             // ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.approval,
//                       color: Colors.white,
//                       size: 40,
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 70,
//                           child: Text(
//                             "Thank You!",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 22,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           "Success",
//                           style: TextStyle(
//                             color: Colors.grey[400],
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 Row(
//                   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.share,
//                         color: Colors.white,
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.download,
//                         color: Colors.white,
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                         Navigator.push(context, MaterialPageRoute(
//                           builder: (context) {
//                             return HomeScreen();
//                           },
//                         ));
//                       },
//                       icon: Icon(
//                         Icons.close,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Message",
//                 style: TextStyle(color: Colors.grey),
//               ),
//               // SizedBox(height: 16),
//               Text(
//                 "ETB ${widget.amount} debited from ${widget.accountName}-ETB-$lastFourCharacters for 364831996497 (A2A) on ${DateTime.now().day}-${getMonthName(DateTime.now().month)}-${DateTime.now().year} with transaction ID: FT24006Z70N6.",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 child: Card(
//                     child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Image.asset("images/qr_code.jpg"),
//                 )),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Center(
//                 child: Container(
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                       color: Colors.brown.shade300,
//                       borderRadius: BorderRadius.circular(50)),
//                   width: MediaQuery.of(context).size.width * 0.4,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Icon(
//                         Icons.note_add,
//                       ),
//                       Text("VIEW RECIEPT")
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Container(
//                 // height: 0,
//                 decoration: BoxDecoration(
//                     color: Colors.grey[300],
//                     borderRadius: BorderRadius.circular(5)),
//                 child: ListTile(
//                   contentPadding: EdgeInsets.symmetric(
//                     horizontal: 0,
//                   ),
//                   // leading: Icon(
//                   //   Icons.balance,
//                   //   size: 40,
//                   // )
//                   // ,
//                   leading: SizedBox(
//                     width: 40,
//                     child: Image.asset(
//                       "images/cbe_logo.png",
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   title: Text(
//                     "Commercial Bank of Ethiopia",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//                   ),
//                   subtitle: Text(
//                     "The Bank You always Rely on!",
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),