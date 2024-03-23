import 'package:flutter/material.dart';

import 'reportAProblem.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                //margin: EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 159, 234, 187),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    SizedBox(width: 100),
                    Center(
                      child: Text(
                        "Helps",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => ReportProblem.showReportProblem(context),
                    child: const Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          'Report a problem',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),

                        Spacer(), // Spacer để đẩy Icon sang bên phải của Row
                        Icon(
                          Icons.chevron_right,
                          // color: Colors.lightBlueAccent,
                          size: 40, // Điều chỉnh kích thước nếu cần
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // Handle when the user taps the row
                    },
                    child: const Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          'Account Status',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.chevron_right,
                          // color: Colors.lightBlueAccent,
                          size: 40, // Điều chỉnh kích thước nếu cần
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // Handle when the user taps the row
                    },
                    child: const Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          'Help Center',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.chevron_right,
                          // color: Colors.lightBlueAccent,
                          size: 40, // Điều chỉnh kích thước nếu cần
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // Handle when the user taps the row
                    },
                    child: const Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          'Privacy and Security Help',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.chevron_right,
                          // color: Colors.lightBlueAccent,
                          size: 40, // Điều chỉnh kích thước nếu cần
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // Handle when the user taps the row
                    },
                    child: const Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          'Support Requests',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.chevron_right,
                          // color: Colors.lightBlueAccent,
                          size: 40, // Điều chỉnh kích thước nếu cần
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
