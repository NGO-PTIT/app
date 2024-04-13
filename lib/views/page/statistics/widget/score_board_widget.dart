import 'package:flutter/material.dart';
import 'package:football_news_app/config/constants/app_option.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_constants.dart';
import '../../../../models/statistical_model.dart';
import '../../../common/common_text.dart';

class ScoreBoardWidget extends StatelessWidget {
  MatchStats team1Stats = AppOption.team1Stats;
  MatchStats team2Stats = AppOption.team2Stats;
  ScoreBoardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              _buildStatRow('Sút', team1Stats.shots.toString(), team2Stats.shots.toString()),
              const SizedBox(height: 8),
              _buildStatRow('Sút trúng đích', team1Stats.shotsOnTarget.toString(),
                  team2Stats.shotsOnTarget.toString()),
              const SizedBox(height: 8),
              _buildStatRow('Kiểm soát bóng', team1Stats.possession.toString(),
                  team2Stats.possession.toString()),
              const SizedBox(height: 8),
              _buildStatRow('Số đường chuyền', team1Stats.passes.toString(),
                  team1Stats.passes.toString()
              ),
              const SizedBox(height: 8),
              _buildStatRow('Chuyền thành công', team1Stats.passAccuracy,
                  team2Stats.passAccuracy),
              const SizedBox(height: 8),
              _buildStatRow('Phạm lỗi', team1Stats.fouls.toString(),
                  team2Stats.fouls.toString()),
              const SizedBox(height: 8),
              _buildStatRow('Thẻ vàng', team1Stats.yellowCards.toString(),
                  team2Stats.yellowCards.toString()
              ),
              const SizedBox(height: 8),
              _buildStatRow('Thẻ đỏ', team1Stats.redCards.toString(),
                  team2Stats.redCards.toString()),
              const SizedBox(height: 8),
              _buildStatRow('Việt vị', team1Stats.offsides.toString(),
                  team2Stats.offsides.toString()),
              const SizedBox(height: 8),
              _buildStatRow('Phạt góc', team1Stats.corners.toString(),
                  team1Stats.corners.toString()),
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