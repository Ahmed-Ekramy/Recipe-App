import 'package:flutter/material.dart';
import 'package:recipe/features/mael_plan/data/models/plan_model.dart';
import 'package:recipe/features/mael_plan/presentation/widgets/day_meals_content.dart';

class GetPlaneView extends StatelessWidget {
  final PlanModel planModel;
  const GetPlaneView({super.key, required this.planModel});

  @override
  Widget build(BuildContext context) {
    final week = planModel.week;
    final Map<String, Day?> daysMap = {
      'Mon': week?.monday,
      'Tue': week?.tuesday,
      'Wed': week?.wednesday,
      'Thu': week?.thursday,
      'Fri': week?.friday,
      'Sat': week?.saturday,
      'Sun': week?.sunday,
    };
    final activeDays = daysMap.entries.toList();
    return DefaultTabController(
      length: activeDays.length,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_rounded,)),
          title: const Text("Weekly Meal Plan"),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.black,
            isScrollable: true,
            indicatorColor: Colors.orange,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: activeDays.map((entry) => Tab(text: entry.key)).toList(),
          ),
        ),
        body: TabBarView(
          children: activeDays.map((entry) {
            if (entry.value == null) {
              return const Center(child: Text("No meals planned for this day"));
            }
            return DayMealsContent(day: entry.value!);
          }).toList(),
        ),
      ),
    );
  }
}
