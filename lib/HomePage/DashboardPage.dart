import 'package:flutter/material.dart';


class DashboardPage extends StatelessWidget {
  final Animation<Offset> offsetAnimation;

  DashboardPage({required this.offsetAnimation});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlideTransition(
          position: offsetAnimation,
          child: Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.blue,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.person,
                    size: 40.0,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'john.doe@example.com',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Spacer to create some space between profile and boxes
        SizedBox(height: 20.0),

        // Boxes with Images and Text
        buildBoxRow('Manage Parents', Icons.people),
        SizedBox(height: 10.0),
        buildBoxRow('Homework', Icons.assignment),
        SizedBox(height: 10.0),
        buildBoxRow('Clear Student Doubts', Icons.question_answer),
        SizedBox(height: 10.0),
        buildBoxRow('Maintain Attendance', Icons.event_available),
        SizedBox(height: 10.0),
        buildBoxRow('Organize Events', Icons.event),
        SizedBox(height: 10.0),
        buildBoxRow('Complaints', Icons.warning),
      ],
    );
  }

  Widget buildBoxRow(String title, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Row(
        children: [
          Icon(
            icon,
            size: 40.0,
            color: Colors.blue,
          ),
          SizedBox(width: 16.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 15.0,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}