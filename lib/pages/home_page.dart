import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_apps/data/bialogiya_quiz_repository.dart';
import 'package:quiz_apps/pages/quiz_page.dart';
import 'package:quiz_apps/utils/colors.dart';
import 'package:quiz_apps/utils/icons.dart';
import 'package:quiz_apps/widgets/select_test_item.dart';

import '../model/quiz_data.dart';

class HomePage extends StatefulWidget {
  static final String id = "myQuiz";

  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<QuizData> bialogiyaTest=BialogiyaQuizRepository.bialogiyaTest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.black54,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light),
        leading: Image.asset(
          MyIcons.wallet,
        ),
        title: Image.asset(
          MyIcons.whiteLogo,
          width: 120,
        ),
        actions: [
          InkWell(
              onTap: () {},
              child: Image.asset(
                MyIcons.info,
                scale: 6.7,
              ))
        ],
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(bottom: 40, right: 15, left: 15, top: 10),
          child: Column(
            children: [
              SelectTestsItem(
                  subjectName: "Biologiya",
                  iconPath: MyIcons.bookStack,
                  gradientColors: MyColors.yellowBar,
                  direction: 1,
                  questionsCount: 10,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                      return QuizPage(quizList: bialogiyaTest, quizName: "Bialogiya");
                    }));
                  }
              ),
              SelectTestsItem(
                  subjectName: "Englesh",
                  iconPath: MyIcons.bookStack,
                  gradientColors: MyColors.blueBar,
                  direction: 1,
                  questionsCount: 10,
                  onTap: () {}
              ),
              SelectTestsItem(
                  subjectName: "Matematika",
                  iconPath: MyIcons.bookStack,
                  gradientColors: MyColors.greenBar,
                  direction: 1,
                  questionsCount: 10,
                  onTap: () {}
              ),
              SelectTestsItem(
                  subjectName: "Sport",
                  iconPath: MyIcons.bookStack,
                  gradientColors: MyColors.redBar,
                  direction: 1,
                  questionsCount: 10,
                  onTap: () {}
              ),
              SelectTestsItem(
                  subjectName: "Sciens",
                  iconPath: MyIcons.bookStack,
                  gradientColors: MyColors.purpleBar,
                  direction: 1,
                  questionsCount: 10,
                  onTap: () {}
              ),
            ],
          ),
        ),
      ),
    );
  }
}
