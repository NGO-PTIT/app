import 'package:flutter/material.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_constants.dart';
import '../../../common/common_text.dart';

class ScoreBoardWidget extends StatelessWidget {
  const ScoreBoardWidget({
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
          child: Row(
            children: [
              AppConstants.kSpacingItemW8,
              Container(
                width: 50,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: AppColors.black2,
                ),
                child: const Center(
                  child: CommonText(
                    '1',
                    textColor: AppColors.black,
                    variant: Variant.h6,
                    fontStyle: FontStyle.bold,
                  ),
                ),
              ),
              const Spacer(),
              const CommonText(
                'Phạm lỗi',
                textColor: AppColors.black,
                variant: Variant.h7,
                fontStyle: FontStyle.bold,
              ),
              const Spacer(),
              Container(
                width: 50,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: AppColors.black2,
                ),
                child: const Center(
                  child: CommonText(
                    '4',
                    textColor: AppColors.black,
                    variant: Variant.h6,
                    fontStyle: FontStyle.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
