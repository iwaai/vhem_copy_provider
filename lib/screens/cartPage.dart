import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vhem_copy/models/cartItemModel.dart';
import '../provider/cartProvider.dart';
import '../widgets/cartItemTile.dart';


class CartPage extends StatelessWidget {
  static const routename = '/cart-page';
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartdata = Provider.of<Cart>(context);

    return Scaffold(
      appBar:AppBar(        
        elevation: 0,
        backgroundColor:Colors.white,
        title:  Text(
          "Order Details",
          style: TextStyle(fontSize: 15.sp),
        ),
        actions: [Padding(
          padding:  EdgeInsets.only(right: 2.w),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffF2F2F4)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Icon(
                Iconsax.user,
                color: Colors.grey,
                size: 18,
              ),
            ),
          ),
        ),],
        ) ,


      //
      body: SafeArea(child : 
      Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(children: [      
            Expanded(
          // ignore: sort_child_properties_last
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx,i) => cartitemTile(c: cartdata.items.values.toList()[i]),
            itemCount:cartdata.items.length,
          ),
        ),
        Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Order Info",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:const  [
                       Text(
                        "Sub total",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      Text(
                        "\$145",
                        style:  TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:const [
                       Text(
                        "Shopping cost",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      Text(
                        "123",
                        style:  TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                       const Text(
                        "Total",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      Consumer<Cart>(builder: (_,value, child ){
                        return Text(
                        value.totalAmount.toString(),
                        style:  const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      );})
                     
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xff0040FF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Consumer<Cart>(builder:(_, value, child) {
                      return Text(
                            "CHECKOUT  \$${value.totalAmount}",
                            style:  const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 12),
                          );
                    },)
                  )
                  )
            ],
          ),
    ))
    );
  }
}