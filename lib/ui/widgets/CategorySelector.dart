import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayi_oyunu/main.dart';

class CategorySelector extends StatefulWidget {
  final Widget routeChild;
  final String categoryName;

  const CategorySelector({
    @required this.categoryName,
    @required this.routeChild,
  });

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  bool hover;

  @override
  void initState() {
    hover = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (_) {
        setState(() {
          hover = _;
        });
      },
      onTap: () {
        Navigator.push(
          navigatorKey.currentState.overlay.context,
          MaterialPageRoute(builder: (context) => widget.routeChild),
        );
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: hover ? Colors.grey[500] : Colors.grey[600],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(0, 0),
              blurRadius: 14,
              spreadRadius: 7,
            ),
          ],
        ),
        width: 0.175.sw,
        height: 0.125.sw,
        child: Center(
          child: Text(
            widget.categoryName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 8.sp,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
