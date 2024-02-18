import 'package:cbe_mobile_banking/models/service.dart';
import 'package:cbe_mobile_banking/transfer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Index of the selected item
  List<Widget> _pages = [
    HomeScreen2(), // Replace with your actual pages
    SearchScreen(),
    ProfileScreen(),
    HomeScreen2()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.purple,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[300],
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_goldenratio), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accounts'),
          BottomNavigationBarItem(icon: Icon(Icons.refresh), label: 'Recents'),
          // Add more navigation items here
        ],
      ),
    );
  }
}

class BankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Colors.black, // Dark background color
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Image.asset('assets/bank_logo.png'), // Replace with your logo
              Text(
                'The Bank You can always Rely on!',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                'Balance',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '***** Br.', // Display obscured balance
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'Feb 8, 2024 9:14:48 PM', // Last transaction timestamp
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ServiceIcon(icon: Icons.send, label: 'Transfer'),
            ServiceIcon(icon: Icons.event, label: 'Events'),
            ServiceIcon(icon: Icons.settings, label: 'Utilities'),
            // Add more service icons here
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class ServiceIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  ServiceIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32),
          SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }
}

class HomeScreen2 extends StatefulWidget {
  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  bool _isVisible = false;
  String? name;
  int? balance;
  String? accountNumber;

  List<Service> services = [
    Service(
        label: "Transfer",
        icon: Icon(
          Icons.send,
          color: Colors.purple,
          size: 40,
        ),
        widget: Transfer()),
    Service(
        label: "Events",
        icon: Icon(
          Icons.event,
          color: Colors.purple,
          size: 40,
        )),
    Service(
        label: "Utilities",
        icon: Icon(
          Icons.home_filled,
          color: Colors.purple,
          size: 40,
        )),
    Service(
        label: "Top Up",
        icon: Icon(
          Icons.touch_app,
          color: Colors.purple,
          size: 40,
        )),
    Service(
        label: "Help",
        icon: Icon(
          Icons.help,
          color: Colors.purple,
          size: 40,
        )),
    Service(
        label: "Utility",
        icon: Icon(
          Icons.u_turn_right,
          color: Colors.purple,
          size: 40,
        )),
    Service(
        label: "Government Services",
        icon: Icon(
          Icons.room_service,
          color: Colors.purple,
          size: 40,
        )),
    Service(
        label: "Banking",
        icon: Icon(
          Icons.home_mini_outlined,
          color: Colors.purple,
          size: 40,
        )),
  ];
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

  String getAMPM(int hour) {
    if (hour < 12) {
      return "AM";
    } else {
      return "PM";
    }
  }

  String getMinute(int minute) {
    if (minute < 10) {
      return "0$minute";
    } else {
      return "$minute";
    }
  }

  void initSharedPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("name", "Betsegaw Lire Garedew");
      balance = prefs.getInt("balance");
      if (balance == null) {
        prefs.setInt("balance", 1000);
      }
      prefs.setString("account", "1000301476497");
    });
  }

  void getSharedPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name");
      balance = prefs.getInt("balance");
      accountNumber = prefs.getString("account");
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    initSharedPrefs();

    super.initState();
    getSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.purple,
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
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 200,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "images/world_map.jpg"), // Replace with your image path
                    fit: BoxFit.cover,
                    opacity: 0.3 // Adjust the fit as needed
                    ),
                borderRadius: BorderRadius.circular(10),
                color: Colors.black87,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                        child: Image.asset(
                          "images/cbe_logo.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            "Commercial Bank of Ethiopia",
                            style: TextStyle(
                                color: Colors.amber.shade300,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            "The Bank You can always Rely on!",
                            style: TextStyle(
                                color: Colors.amber.shade300, fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Balance",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _isVisible ? "$balance Br." : "***** Br.",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        child: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  Text(
                    _isVisible
                        ? "Saving - 1000301476497"
                        : "Saving - 1000*****6497",
                    style:
                        TextStyle(color: Colors.amber.shade300, fontSize: 16),
                  ),
                  Text(
                    "${getMonthName(DateTime.now().month)} ${DateTime.now().day}, ${DateTime.now().year} ${DateTime.now().hour}:${getMinute(DateTime.now().minute)}:${getMinute(DateTime.now().second)} ${getAMPM(DateTime.now().hour)}",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Services",
              style: TextStyle(color: Colors.purple),
            ),
            Expanded(
              child: Container(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // maxCrossAxisExtent: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: services.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return SizedBox(
                      // height: 150,
                      child: GestureDetector(
                        onTap: () {
                          services[index].widget == null
                              ? null
                              : Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return services[index].widget!;
                                  },
                                ));
                        },
                        child: Card(
                          // height: 50,
                          color: Colors.white,

                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                services[index].icon,
                                Text(
                                  services[index].label,
                                  style: TextStyle(color: Colors.purple),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Search Page'));
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Page'));
  }
}
