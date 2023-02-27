import 'package:flutter/material.dart';
import '../models/cartItemModel.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../provider/cartProvider.dart';

class cartitemTile extends StatelessWidget {
  final cartItemModel? c;

  const cartitemTile({super.key,required this.c});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
          children: [
              Dismissible(
                key: ValueKey(c!.id),
                
                background: Container(
               
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.redAccent,),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 40,
                )),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                //sirf provider ka function call krna ha delte wala
                Provider.of<Cart>(context, listen: false).deleteItem(c!.id);},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      height: 110,
                      decoration: BoxDecoration(
                          color: const Color(0xffF2F2F4),
                          borderRadius: BorderRadius.circular(14)),
                      child: Center(
                        child: Image(
                          image: AssetImage(c!.image),
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            c!.title,
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "\$${c!.price}",
                            style: const TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xffF2F2F4)),
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
                              ),
                              const SizedBox(width: 10),
                              Text(
                                c!.quantity.toString(),
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xffF2F2F4)),
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
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: Colors.redAccent.withOpacity(0.07),
                        radius: 18,
                        child: const Icon(
                          Iconsax.trash,
                          color: Colors.redAccent,
                          size: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ]
      ),
    );
  }
}