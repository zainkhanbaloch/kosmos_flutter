import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        selectedDate = "${picked.year}, ${picked.month}, ${picked.day}";
        print(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "assets/images/appicon.png",
            fit: BoxFit.contain,
            height: 42,
          ),
          toolbarHeight: 68,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          leading: const Icon(Icons.menu),
          actions: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon((Icons.info_outline)),
            ),
          ],
        ),
        body: Scrollable(
          axisDirection: AxisDirection.down,
          viewportBuilder: (context, position) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Card(
                      color: Colors.grey[300],
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: [
                          const SizedBox(
                            height: 8.0,
                          ),
                          const Text("Today's Image",
                              // textScaleFactor: 1.5,

                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 112, 112, 112),
                                fontSize: 20,
                              )),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/sampleimage.jpg",
                              ),
                            ),
                          ),
                          const Text(
                            "Aurora Borealis",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const Text(
                            "The Northern Lights are a natural light display in the Earth's sky, predominantly seen in high-latitude regions (around the Arctic and Antarctic).",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.grey[300],
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            color: Colors.grey[400],
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(children: [
                                Image.asset(
                                  "assets/images/appicon.png",
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text("Mars"),
                              ]),
                            ),
                          ),
                          Card(
                            color: Colors.grey[400],
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(children: [
                                Image.asset(
                                  "assets/images/appicon.png",
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text("News"),
                              ]),
                            ),
                          ),
                          Card(
                            color: Color.fromARGB(255, 199, 199, 199),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(children: [
                                Image.asset(
                                  "assets/images/appicon.png",
                                  width: 40,
                                  height: 40,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text("Blog"),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.grey[300],
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          const Text("Select Date"),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                       const Color.fromARGB(255, 194, 194, 194),
                                    minimumSize: const Size(250, 50),
                                  ),
                                  onPressed: () {
                                    _selectDate(context);
                                  },
                                  child: Text(selectedDate != null
                                      ? "$selectedDate"
                                      : "Select date"),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text("See"),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
