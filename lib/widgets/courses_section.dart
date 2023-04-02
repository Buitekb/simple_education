import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_education/constants/app_images.dart';

class CoursesSection extends StatefulWidget {
  CoursesSection({Key? key}) : super(key: key);

  @override
  State<CoursesSection> createState() => _CoursesSectionState();
}

class _CoursesSectionState extends State<CoursesSection> {
  List<CoursesData> courseData = [
    CoursesData('General English', 'Alan Alexander'),
    CoursesData('Mathematics', 'John Doe'),
    CoursesData('Biology', 'Jane Smith'),
    CoursesData('Programming', 'Jane Smith'),
  ];

  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Assignments'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Gradebook'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AccountWidget(),
              const SizedBox(height: 21),
              const SearchWidget(),
              const SizedBox(height: 30),
              const Text(
                'Courses',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFF121212),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: courseData.length,
                  itemBuilder: (context, index) {
                    return CoursesWidget(data: courseData[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CoursesData {
  final String nameOfDiscipline;
  final String nameOfTeacher;

  CoursesData(this.nameOfDiscipline, this.nameOfTeacher);
}

class CoursesWidget extends StatelessWidget {
  final CoursesData data;

  const CoursesWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 17, right: 7, bottom: 17),
        child: Row(
          children: [
            const ImageDisciplineWidget(),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameDisciplineWidget(data: data),
                  const SizedBox(height: 10),
                  NameTeacherWidget(nameOfTeacher: data.nameOfTeacher),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 39),
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class NameTeacherWidget extends StatelessWidget {
  final String nameOfTeacher;

  const NameTeacherWidget({
    Key? key,
    required this.nameOfTeacher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      nameOfTeacher,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFF8B8C98),
      ),
    );
  }
}

class NameDisciplineWidget extends StatelessWidget {
  final CoursesData data;

  const NameDisciplineWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data.nameOfDiscipline,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Color(0xFF121212),
      ),
    );
  }
}

class ImageDisciplineWidget extends StatelessWidget {
  const ImageDisciplineWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AppImages.generalEnglish,
      height: 60,
      width: 60,
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xFFD8D9DD),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: Color(0xFF5B6975),
        ),
        suffixIcon: const Icon(
          Icons.filter,
          color: Color(0xFF5B6975),
        ),
        hintText: "Search",
      ),
    );
  }
}

class AccountWidget extends StatelessWidget {
  const AccountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: AppImages.userPhoto2,
          radius: 32,
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hello,',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF8B8C98),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Bayan Buitek',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF121212),
                ),
              ),
            ],
          ),
        ),
        SvgPicture.asset(
          'assets/svg/not_read_notifications.svg',
          width: 37,
          height: 37,
        ),
      ],
    );
  }
}
