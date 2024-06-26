
import 'package:auth/dashboard/dashboard_control/dashboard_cubit.dart';
import 'package:auth/dashboard/favorite/view/page/favorite_page.dart';
import 'package:auth/dashboard/pages/productpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth/core/my_theme.dart';

class dashboard_page extends StatelessWidget {
  const dashboard_page({super.key});
  final List title = const ["products", 'favurite', 'cart'];
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => Dashboard_Cubit(),
      child: BlocBuilder<Dashboard_Cubit, DashboardCubitState>(
            builder: (context, state) {
              final Dashboard_Cubit dashboardCubit = context.read<Dashboard_Cubit>();
           
    
              return Scaffold(
                appBar: AppBar(
                
                  title: Text(
                    title[dashboardCubit.count],
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  actions: [
                    IconButton(onPressed: (){
                      Navigator.pushNamed(context, 'NewproductPage');
                    }, icon:Icon(CupertinoIcons.add) )
                  ],
                ),
                body: PageView(
                  controller: dashboardCubit.pagecontrol,
                  onPageChanged: dashboardCubit.onchange,
                  children: [
                    ProductPage(),
                    FavoritePage(),
                    
                  ],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: dashboardCubit.count,
                  onTap: dashboardCubit.onchange,
                  unselectedItemColor: Colors.black,
                  showUnselectedLabels: true,
                  unselectedLabelStyle: const TextStyle(fontSize: 15, color: Colors.red),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.collections),
                      label: 'products',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.heart),
                      label: 'fav',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.cart),
                      label: 'cart',
                    ),
                  ],
                ),
              );
            },
          ),
    );
    
  }
}
