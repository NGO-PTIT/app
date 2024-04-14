import 'package:flutter/material.dart';
import '../../../config/constants/app_colors.dart';
import '../../../models/schedule_model.dart';
import '../../common/common_drawer.dart';
import '../../common/common_text.dart';

class MatchInfoPage extends StatefulWidget {
  final Schedule schedule;

  const MatchInfoPage({super.key, required this.schedule});

  @override
  State<MatchInfoPage> createState() => _MatchInfoState();
}

class _MatchInfoState extends State<MatchInfoPage> {
  late final Schedule schedule;

  @override
  void initState() {
    super.initState();
    schedule = widget.schedule;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.white),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: AppColors.emeraldGreen,
          title: const CommonText(
            'MatchInfo',
            fontStyle: FontStyle.bold,
            textColor: AppColors.white,
            variant: Variant.h6,
          ),
        ),
        drawer: const CommonDrawer(),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTitle(),
                      const SizedBox(height: 20),
                      _buildTeamInfo(),
                      const SizedBox(height: 20),
                      _buildWinProbabilityBar(),
                      const SizedBox(height: 20),
                      _buildWeatherInfo(),
                      const SizedBox(height: 20),
                      _buildTabBar(),
                      Expanded(
                        child: TabBarView(
                          children: const [
                            Center(child: Text('Timeline Content')),
                            Center(child: Text('Lineups Content')),
                            Center(child: Text('Stats Content')),
                            Center(child: Text('Trending Content')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.blue, width: 3.0)),
      ),
      child: Text(
        '${schedule.team1} vs ${schedule.team2}',
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTeamInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset(schedule.icon1, width: 50, height: 50),
            Text(schedule.team1),
          ],
        ),
        Text(
          '${schedule.time} AM',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Column(
          children: [
            Image.asset(schedule.icon2, width: 50, height: 50),
            Text(schedule.team2),
          ],
        ),
      ],
    );
  }

  Widget _buildWinProbabilityBar() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.237,
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(5)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FractionallySizedBox(
                widthFactor: 0.491,
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(5)),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('23.7%', style: TextStyle(color: Colors.blue)),
            Text('Win probability', style: TextStyle(color: Colors.black)),
            Text('49.1%', style: TextStyle(color: Colors.red)),
          ],
        ),
      ],
    );
  }

  Widget _buildWeatherInfo() {
    return Row(
      children: const [
        Text('Estadio Ramon de Carranza, Cadiz'),
        Text('  - 21°C'),
      ],
    );
  }

  Widget _buildTabBar() {
    return Material(
      color: AppColors.emeraldGreen,
      child: const TabBar(
        tabs: [
          Tab(text: 'TIMELINE'),
          Tab(text: 'LINEUPS'),
          Tab(text: 'STATS'),
          Tab(text: 'TRENDING'),
        ],
        indicatorColor: Colors.white,
        indicatorWeight: 3,
      ),
    );
  }
}
