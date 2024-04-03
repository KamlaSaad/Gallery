import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../utils/constants.dart';
import 'package:flutter/material.dart';

class GalleryList extends StatelessWidget {
  final List data;
  const GalleryList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Constant.width);
    return GridView.custom(
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: Constant.width<280?2:(Constant.width<400?3:4),
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 20.w,
        pattern: [
          const WovenGridTile(1, alignment: AlignmentDirectional.topCenter),
          const WovenGridTile(
            0.95, crossAxisRatio: 1,
            alignment: AlignmentDirectional.topCenter,
          ),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate((context, index) {
        String img=data[index];
        return Container(
          width: 108.w,height: 108.h,
          decoration: BoxDecoration(
            color: Constant.greyLight,
            borderRadius: BorderRadius.circular(20.r),
            image: DecorationImage(image: NetworkImage(img),fit: BoxFit.fill),
            boxShadow: [BoxShadow(color: Constant.grey.withOpacity(0.5),blurRadius: 5.r,spreadRadius: 3)]
         ),
        );
       }, childCount: data.length
      ),
    );
  }
}
