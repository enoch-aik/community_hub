import 'package:community_hub/lib.dart';

class CategoryHeader extends StatelessWidget {
  final String header;
  final void Function()? onTap;
  final bool showActionButton;

  const CategoryHeader(
      {super.key,
      required this.header,
      this.onTap,
      this.showActionButton = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4.w,
          height: 20.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: context.secondary),
        ),
        RowSpacing(10.w),
        KText(
          header,
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
        ),
        const Spacer(),
        if (showActionButton)
          SizedBox(
              height: 35.h,
              child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    side: BorderSide(color: context.secondary, width: 0.5),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text('See all'), Icon(Icons.chevron_right)],
                  ))),
      ],
    );
  }
}
