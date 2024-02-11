import 'package:cbe_mobile_banking/models/transfer_model.dart';
import 'package:cbe_mobile_banking/select_account.dart';
import 'package:flutter/material.dart';

class Transfer extends StatelessWidget {
  Transfer({super.key});

  List<TransferModel> transferModels = [
    TransferModel(
      title: "Transfer to CBEBirr Wallet",
      subtitle: "Bank to CBEBirr Wallet transfer",
    ),
    TransferModel(
        title: "Make payment to beneficiary",
        subtitle: "Transfer to your beneficieries"),
    TransferModel(
      widget: SelectAccount(),
      title: "Transfer to CBE Account",
      subtitle: "Transfer to CBE Account",
    ),
    TransferModel(
        title: "Local Money Transfer",
        subtitle: "Transfer to any non CBE customer"),
    TransferModel(
        title: "Manage Beneficieries",
        subtitle: "Add or delete your friend accounts"),
    TransferModel(
        title: "Own Account Transfer",
        subtitle: "Transfer between your accounts"),
    TransferModel(
        title: "Transfer to Own Telebirr Wallet",
        subtitle: "Transfer to Own Telebirr Wallet"),
    TransferModel(
        title: "Transfer to CBEBirr Wallet",
        subtitle: "Bank to CBEBirr Wallet transfer"),
    TransferModel(
        title: "Transfer to Other Banks", subtitle: "Transfer to Other Banks"),
    TransferModel(title: "Transfer to Wallet", subtitle: "Transfer to Wallet"),
  ];

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
        title: Text(
          "transfer",
          style: TextStyle(fontWeight: FontWeight.bold),
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
      body: ListView.separated(
        itemCount: transferModels.length,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1, indent: 70),
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              transferModels[index].widget == null
                  ? null
                  : Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return transferModels[index].widget!;
                      },
                    ));
            },
            leading: Icon(
              Icons.share,
              color: Colors.purple,
              size: 40,
            ),
            title: Text(
              transferModels[index].title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.purple[900]),
            ),
            subtitle: Text(
              transferModels[index].subtitle,
              style: TextStyle(color: Colors.grey),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
