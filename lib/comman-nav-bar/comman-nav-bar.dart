import 'package:flutter/material.dart';

class CommonBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTabTapped;
  final Map<int, String> routeMap; // Add this line to accept the route map
  final BuildContext context; // Add this line to accept the BuildContext

  CommonBottomNavigationBar({required this.currentIndex, required this.onTabTapped, required this.routeMap, required this.context});

  @override
  State<CommonBottomNavigationBar> createState() => CommonBottomNavigationBarState();
}

class CommonBottomNavigationBarState extends State<CommonBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    widget.onTabTapped(index); // Call the parent's onTabTapped callback
    setState(() {
      print('bottom nav clicked @' + index.toString());
      _selectedIndex = index;
    });

    final routeName = widget.routeMap[index];
    if (routeName != null) {
      Navigator.pushNamed(widget.context, routeName);
    }
  }

  Widget buildBottomNavItem({required String iconUrl, required String label, required int index}) {
    final isSelected = widget.currentIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? Color(0xff00AED9) : Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              iconUrl,
              width: 24,
              height: 24,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.black : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0XFF414042),
          borderRadius: BorderRadius.circular(70),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _onItemTapped(0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: widget.currentIndex == 0 ? Color(0XFF00AED9) : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: buildBottomNavItem(
                    iconUrl: 'https://raptorassistant.com/shaw-charity-classic/assets/9-Home%403x.png',
                    label: 'HOME',
                    index: 0,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onTap: () => _onItemTapped(1),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: widget.currentIndex == 1 ? Color(0XFF00AED9) : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: buildBottomNavItem(
                    iconUrl: 'https://raptorassistant.com/shaw-charity-classic/assets/ticket%403x.png',
                    label: 'TICKETS',
                    index: 1,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onTap: () => _onItemTapped(2),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                    color: widget.currentIndex == 2 ? Color(0XFF00AED9) : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: buildBottomNavItem(
                    iconUrl: 'https://raptorassistant.com/shaw-charity-classic/assets/Layer%202%403x.png',
                    label: 'LEADERBOARD',
                    index: 2,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onTap: () => _onItemTapped(3),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: widget.currentIndex == 3 ? Color(0XFF00AED9) : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: buildBottomNavItem(
                    iconUrl: 'https://raptorassistant.com/shaw-charity-classic/assets/money%403x.png',
                    label: 'DONATE 1',
                    index: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
