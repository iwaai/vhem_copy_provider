import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../provider/productProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../provider/cartProvider.dart';

class descPage extends StatelessWidget {
  static const routename = '/desc-page-screen';
  const descPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productId =ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct = Provider.of<productProvider>(context,listen:false).getitembyId(productId);

    return Scaffold(
      //backgroundColor: Colors.redAccent,
      appBar: AppBar( elevation: 0,),
      body: Padding(
        padding:   EdgeInsets.all(12.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
          //c1 
          //images
          Stack(children: [
            Container(height: MediaQuery.of(context).size.height/0.4.h,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(loadedProduct.assetName)),color:const Color(0xffF2F2F4)))
          ],),

          //c2 description
          
           SizedBox(height: 4.h,),
              Text(
                loadedProduct.name,
                style:  TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
           SizedBox(height: 2.h,),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eros quam, faucibus quis convallis eu, sodales ut nunc',
                style:  TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
            SizedBox(height: 1.h,),
            const Divider(thickness: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "\$ ${loadedProduct.price}",
                    style:  TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                  ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(height: 4.h,width: 8.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.blueGrey,border: Border.all(color: Colors.black,width: 2.1,)),),
                  SizedBox(width: 2.h,),
                  Container(height: 4.h,width: 8.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.black,border: Border.all(color: Colors.black,width: 2.1,)),),
                  SizedBox(width: 2.h,),
                  Container(height: 4.h,width: 8.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.red,border: Border.all(color: Colors.black,width: 2.1,)),)
                ],)
              ],
            ),
            const Divider(thickness: 2,),
            SizedBox(height: 2.h,),
            Text("Have a coupon ? :)",style: TextStyle(fontSize: 12.sp, color: Colors.grey,fontWeight: FontWeight.w500),),
            SizedBox(height: 1.h,),
            const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Coupon',
                ),
              ),
              SizedBox(height: 5.3.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              
                  children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Center(
                          child: Icon(
                            Iconsax.minus,
                            color: Colors.grey,
                            size: 14,
                          ),
                        ),
                      ),
                      SizedBox(width: 3.w,),
                      const Text('4',style: TextStyle(fontSize: 15 , color: Colors.grey),),
                      SizedBox(width: 3.w,),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Center(
                          child: Icon(
                            Iconsax.add,
                            color: Colors.grey,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(onTap: (){Provider.of<Cart>(context,listen: false).additem(loadedProduct.id,loadedProduct.price, loadedProduct.name,loadedProduct.assetName);},
                  child: Container(
                    width: MediaQuery.of(context).size.width/0.55.w,
                    height:55,
                    decoration:BoxDecoration(
                      color:const  Color(0xff0040FF),
                      borderRadius: BorderRadius.circular(13)),
                      child: const Center(
                        child:  Text('Continue',style: TextStyle(color: Colors.white,fontSize: 16))),))

                ],
              ),
              

          ],
      
        ),
      )

    );
  }
}