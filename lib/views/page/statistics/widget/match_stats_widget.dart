import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_constants.dart';
import '../../../../models/statistical_model.dart';
import '../../../common/common_text.dart';

class ScoreBoardWidget extends StatelessWidget {
  final MatchStats matchStats;

  ScoreBoardWidget({
    super.key,
    required this.matchStats,
  });

  @override
  Widget build(BuildContext context) {
    var random = Random();
    int randomNumber = random.nextInt(5);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xFFE5E5E5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            right: 8.0,
          ),
          child: Column(
            children: [
              _buildStatRow('Sút', matchStats.shots1.toString(), matchStats.shots2.toString()),
              const SizedBox(height: 8),
              _buildStatRow('Sút trúng đích', matchStats.shotsOnTarget1.toString(),
                  matchStats.shotsOnTarget2.toString()),
              const SizedBox(height: 8),
              _buildStatRow('Số đường chuyền', matchStats.passes1.toString(),
                  matchStats.passes2.toString()
              ),
              const SizedBox(height: 8),
              _buildStatRow('Chuyền thành công', matchStats.passAccuracy1,
                  matchStats.passAccuracy2),
              const SizedBox(height: 8),
              _buildStatRow('Phạm lỗi', matchStats.fouls1.toString(),
                  matchStats.fouls2.toString()),
              const SizedBox(height: 8),
              _buildStatRow('Thẻ vàng', matchStats.yellowCards1.toString(),
                  matchStats.yellowCards2.toString()
              ),
              const SizedBox(height: 8),
              _buildStatRow('Thẻ đỏ', matchStats.redCards1.toString(),
                  matchStats.redCards2.toString()),
              const SizedBox(height: 8),
              _buildStatRow('Việt vị', matchStats.offsides1.toString(),
                  matchStats.offsides2.toString()),
              const SizedBox(height: 8),
              _buildStatRow('Phạt góc', matchStats.corners1.toString(),
                  matchStats.corners2.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String team1Value, String team2Value) {
    return Row(
      children: [
        AppConstants.kSpacingItemW8,
        _buildStatBox(team1Value),
        Spacer(),
        CommonText(
          label,
          textColor: AppColors.black,
          variant: Variant.h7,
          fontStyle: FontStyle.bold,
        ),
        Spacer(),
        _buildStatBox(team2Value),
      ],
    );
  }

  Widget _buildStatBox(String value) {
    return Container(
      width: 50,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: AppColors.black2,
      ),
      child: Center(
        child: CommonText(
          value,
          textColor: AppColors.black,
          variant: Variant.h6,
          fontStyle: FontStyle.bold,
        ),
      ),
    );
  }

}