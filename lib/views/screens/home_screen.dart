import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tasks',
          style: TextStyle(
            color: Color(0xFF000000),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color(0xFFffffff),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello, Zozo!',
              style: TextStyle(
                shadows: [
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 3.0,
                    color: Color(0xFF3f52e3),
                  ),
                ],
                color: Color(0xFF000000),
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              'have a nice day!',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontFamily: 'Roboto',
                height: 1.2,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 180,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    width: 250,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF3f52e3)
                              .withAlpha((0.5 * 255).toInt()),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: const Color(0xFF3f52e3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Column(
                            children: [
                              Text(
                                'Task name',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  'the part of يبلبيليبل يبليب ل  سيبس يسيب description of task',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              )
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Positioned(
                              child: SizedBox(
                                width: 60,
                                height: 60,
                                child: CircularProgressIndicator(
                                  value: 0.70, // 75% completion
                                  backgroundColor: Colors.white,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.indigoAccent),
                                  strokeWidth: 5,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 15,
                              top: 18,
                              child: Text(
                                '75%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            const Text(
              "Today's Todos",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            //? List of tasks
          ],
        ),
      ),
    );
  }
}
