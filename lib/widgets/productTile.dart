import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../provider/productProvider.dart';
import 'package:iconsax/iconsax.dart';
import '../models/productModel.dart';
import '../screens/descPage.dart';

class productTile extends StatelessWidget {

  final productModel p;
  const productTile({super.key,required this.p});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child:GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(descPage.routename,arguments: p.id);},
        child: Container(
        //color: Colors.red,
        width: MediaQuery.of(context,).size.width/0.5.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffF2F2F2),
                    ),
                    child: Center(
                      child: Image(
                        image: AssetImage(p.assetName),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                const Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 255, 255, 255),
                              radius: 13,
                              child: Icon(
                                Iconsax.bag,
                                color: Colors.grey,
                                size: 14,
                              ),
                            ),
                  )
                ],
              ),            
            const SizedBox(height: 4),
              Text(
                p.name,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            const SizedBox(height: 3),
              Text(
                "\$${p.price}",
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              )
          ]
        )
          ),
      ));
    
  }
}