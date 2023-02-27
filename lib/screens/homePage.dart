import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:vhem_copy/provider/productProvider.dart';

import '../widgets/productTile.dart';
import '../provider/themeChanger.dart';
import '../screens/cartPage.dart';

class homePage extends StatelessWidget {
  
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themee = Provider.of<themeChanger>(context,listen: false);
   
    return Scaffold(
      //backgroundColor: Colors.white,
      //apna app baar bana rahe

      appBar: AppBar(
        elevation: 0,
        backgroundColor:Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 4.w,),
          child: Container(
            width: 50.w,
            height: 50.h,
            //olor: Colors.black,
            decoration: const BoxDecoration(color: Color(0xffF2F2F4)),
            child: const Center(
              child: Icon(
                Icons.chevron_left_outlined,
                color: Colors.grey,
                size: 26,
              ),
            ),
          ),
        ),
        actions: [
        GestureDetector(onTap: (){Navigator.of(context).pushNamed(CartPage.routename);},child: Container( decoration: const  BoxDecoration(color: Color(0xffF2F2F4),), width: 14.w,child:const  Icon(Iconsax.shopping_bag,color: Colors.grey))),
        SizedBox(width: 1.w,),
        Padding(padding: EdgeInsets.only(right: 4.0.w),
          child: GestureDetector(onTap: () {themee.setTheme();},
           child: Container(
            width: 14.w,
            //olor: Colors.black,
            decoration: const  BoxDecoration(color: Color(0xffF2F2F4)),
            child: Consumer<themeChanger>(builder: (context,value,child)
            {
              return  value.isdark? const Icon(Icons.dark_mode,color: Colors.grey, ): const Icon(Icons.light_mode,color: Colors.grey );
              
            })
    
            
                
              ),
            ),
          ),
          
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height/0.9.h,
          width: MediaQuery.of(context).size.width.w,
          child: Column(      
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
        Text(
          "Hi-Fi Shop & Service",
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 1.h),
        Text(
          "Audio shop on Rustaveli Ave 57.",
          style: TextStyle(
              fontSize: 10.sp, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
        SizedBox(height: 1.h),
        Text(
          "This shop offers both products and services",
          style: TextStyle(
              fontSize: 10.sp, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
       ]  ,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children:  [
                   Text(
                    "Products",
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    " 45",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ],
              ),
               Text(
                "See all",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff0040FF)),
              ),
            ],
          ), 
          SizedBox(height: 1.h),


          SizedBox(height: MediaQuery.of(context).size.height/0.55.h,
            child: Expanded(
                  child: ListView.builder(
                    itemCount: Provider.of<productProvider>(context).products.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>  
                      Consumer<productProvider>(
                        builder: (context,value,_) {
                          return   productTile(p: value.products[index]);
                        }
                      ),
                    ),
                    
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children:  [
                   Text(
                    "Accessories",
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    " 69",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ],
              ),

               Text(
                "See all",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff0040FF)),
              ),
              
            ],
          ), 
          SizedBox(height: 1.h),


          SizedBox(height: MediaQuery.of(context).size.height/0.55.h,
            child: Expanded(
                  child: ListView.builder(
                    itemCount: Provider.of<productProvider>(context).accessories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>  
                      Consumer<productProvider>(
                        builder: (context,value,_) {
                          return productTile(p: value.accessories[index]);
                        }
                      ),
                    ),
                    
                  ),
                ),
          ],
          
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedLabelStyle:
            const TextStyle(fontSize: 11, color: Colors.black),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Iconsax.home,
                size: 20,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Iconsax.shop,
                size: 20,
              ),
              label: "Shop"),
          BottomNavigationBarItem(
              icon: Icon(
                Iconsax.save_2,
                size: 20,
              ),
              label: "Saved"),
          BottomNavigationBarItem(
              icon: Icon(
                Iconsax.user,
                size: 20,
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}
