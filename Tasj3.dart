// Tasj3.dart

import 'package:flutter/material.dart';

void main() {
  runApp(const TaskManagerApp());
}

const Color darkGreen = Color(0xFF073F32);
const Color green = Color(0xFF5F9675);
const Color cream = Color(0xFFF3F0E7);
const Color yellow = Color(0xFFFFB900);

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 20,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                DashboardPanel(),
                SizedBox(width: 60),
                DashboardPanel(showForm: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardPanel extends StatelessWidget {
  final bool showForm;

  const DashboardPanel({
    super.key,
    this.showForm = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 316,
      height: 580,
      color: cream,
      child: Stack(
        children: [
          Column(
            children: [
              const Header(),
              const SearchBarWidget(),
              const FilterButtons(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: const [
                    TaskCard(
                      title: 'Reading books',
                      subtitle: 'Atomic habit',
                      priority: 'Medium',
                      category: 'Study',
                      date: 'Sep 1, 2026',
                      color: Color(0xFFC28D4B),
                    ),
                    TaskCard(
                      title: 'Finish Flutter Week 3 task',
                      subtitle: 'StatefulWidget, setState and form widgets.',
                      priority: 'Medium',
                      category: 'Study',
                      date: 'Nov 3, 2026',
                      color: Color(0xFFC28D4B),
                    ),
                    TaskCard(
                      title: 'Buy groceries',
                      priority: 'Low',
                      category: 'Shopping',
                      color: green,
                    ),
                    TaskCard(
                      title: 'Plan the week ⭐',
                      subtitle: 'List top 3 goals and block time for each.',
                      priority: 'High',
                      category: 'Personal',
                      date: 'Today',
                      color: yellow,
                    ),
                  ],
                ),
              ),
            ],
          ),

          Positioned(
            bottom: 9,
            right: 14,
            child: FloatingActionButton.extended(
              backgroundColor: yellow,
              foregroundColor: darkGreen,
              elevation: 2,
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text(
                'New task',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),

          if (showForm) ...[
            Container(
              color: Colors.black54,
            ),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: NewTaskForm(),
            ),
          ],
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  Widget statBox(IconData icon, String number, String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 7),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: yellow, size: 14),
            const SizedBox(height: 4),
            Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF064735), Color(0xFF326C53)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                'Sun, Nov 1, 2026',
                style: TextStyle(color: Colors.white70, fontSize: 9),
              ),
              Spacer(),
              Icon(Icons.more_vert, color: Colors.white, size: 19),
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good evening',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'You have 4 task(s) left.',
                      style: TextStyle(
                        color: yellow,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 53,
                width: 53,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white38,
                    width: 4,
                  ),
                ),
                child: const Center(
                  child: Text(
                    '0%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              statBox(Icons.calendar_month, '4', 'Total'),
              statBox(Icons.bolt, '4', 'Active'),
              statBox(Icons.check_circle, '0', 'Done'),
              statBox(Icons.alarm, '1', 'Overdue'),
            ],
          ),
        ],
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: green, size: 16),
          SizedBox(width: 9),
          Text(
            'Search tasks, notes or categories',
            style: TextStyle(color: Colors.blueGrey, fontSize: 11),
          ),
        ],
      ),
    );
  }
}

class FilterButtons extends StatelessWidget {
  const FilterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Row(
        children: [
          filter('All', true),
          filter('Active', false),
          filter('Completed', false),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 7,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: green),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sort, size: 12),
                  SizedBox(width: 3),
                  Text('Newest first', style: TextStyle(fontSize: 8)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget filter(String title, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: selected ? darkGreen : Colors.white,
        border: Border.all(color: green),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.white : darkGreen,
          fontSize: 9,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String priority;
  final String category;
  final String? date;
  final Color color;

  const TaskCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.priority,
    required this.category,
    this.date,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border(
          left: BorderSide(color: color, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.circle_outlined,
                color: green,
                size: 16,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: darkGreen,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(
                Icons.delete_outline,
                color: Colors.red,
                size: 16,
              ),
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Text(
                subtitle!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 9,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ],
          const SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.only(left: 26),
            child: Wrap(
              spacing: 5,
              children: [
                chip(priority, color),
                chip(category, const Color(0xFFEAF1EC)),
                if (date != null)
                  chip(date!, const Color(0xFFF8E9E4)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget chip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color == const Color(0xFFEAF1EC) ||
                  color == const Color(0xFFF8E9E4)
              ? darkGreen
              : Colors.white,
          fontSize: 8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class NewTaskForm extends StatelessWidget {
  const NewTaskForm({super.key});

  InputDecoration inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, size: 17, color: green),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFC28D4B),
          fontSize: 9,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 14),
      decoration: const BoxDecoration(
        color: cream,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(22),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.green.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'New task',
            style: TextStyle(
              color: darkGreen,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          sectionTitle('TITLE'),
          TextField(
            decoration: inputDecoration(
              'Going to park for walk',
              Icons.edit_note,
            ),
            style: const TextStyle(fontSize: 11),
          ),

          sectionTitle('NOTES (OPTIONAL)'),
          TextField(
            maxLines: 2,
            decoration: inputDecoration(
              'Add some details',
              Icons.notes,
            ),
            style: const TextStyle(fontSize: 11),
          ),

          sectionTitle('PRIORITY'),
          const Row(
            children: [
              Icon(Icons.circle_outlined, color: green, size: 15),
              SizedBox(width: 4),
              Text('Low', style: TextStyle(fontSize: 10)),
              SizedBox(width: 12),
              Icon(Icons.radio_button_checked,
                  color: darkGreen, size: 15),
              SizedBox(width: 4),
              Text('Medium', style: TextStyle(fontSize: 10)),
              SizedBox(width: 12),
              Icon(Icons.circle_outlined, color: green, size: 15),
              SizedBox(width: 4),
              Text('High', style: TextStyle(fontSize: 10)),
            ],
          ),

          sectionTitle('CATEGORY'),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 11,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.favorite, color: green, size: 14),
                SizedBox(width: 9),
                Text(
                  'Health',
                  style: TextStyle(
                    color: darkGreen,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(Icons.keyboard_arrow_down, size: 17),
              ],
            ),
          ),

          sectionTitle('DUE DATE'),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.calendar_month, color: darkGreen, size: 14),
                SizedBox(width: 8),
                Text('Pick a date',
                    style: TextStyle(fontSize: 10)),
              ],
            ),
          ),

          const SizedBox(height: 10),
          const Row(
            children: [
              Icon(Icons.star_border, color: yellow, size: 19),
              SizedBox(width: 7),
              Text(
                'Mark as important',
                style: TextStyle(
                  color: darkGreen,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(Icons.toggle_on, color: green, size: 36),
            ],
          ),

          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: darkGreen,
                    side: const BorderSide(color: green),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: const Text('Cancel',
                      style: TextStyle(fontSize: 10)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  icon: const Icon(Icons.check_circle_outline, size: 14),
                  label: const Text(
                    'Add task',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
