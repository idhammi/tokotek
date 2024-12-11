import 'package:flutter/material.dart';
import 'package:tokotek/data/sample.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Show Menu',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.location_pin),
                  Text("92, High Street, London"),
                  Spacer(),
                  Icon(Icons.chevron_right)
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: null,
                ),
                Text("Select All"),
                Spacer(),
                Icon(Icons.upload_outlined),
                SizedBox(width: 8),
                Icon(Icons.edit_outlined),
              ],
            ),
          ),
          CartItems(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(left: 24, right: 24, bottom: 48),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      )),
                  onPressed: () {},
                  child: const Text('Checkout'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return Container(
          constraints: const BoxConstraints(minHeight: 100, maxHeight: 100),
          decoration: const BoxDecoration(color: Colors.green),
          child: Row(
            children: [
              const Checkbox(
                value: false,
                onChanged: null,
              ),
              Image.asset(
                productList[index].image,
                width: 90,
                height: 90,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      productList[index].name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(productList[index].currency),
                        Text(productList[index].price.toString()),
                        const Spacer(),
                        const CartItemCounter(),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CartItemCounter extends StatefulWidget {
  const CartItemCounter({super.key});

  @override
  State<StatefulWidget> createState() => _CartItemCounterState();
}

class _CartItemCounterState extends State<CartItemCounter> {
  _CartItemCounterState();

  int _amount = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Ink(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (_amount > 1) _amount--;
                    });
                  },
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
              Container(
                constraints: const BoxConstraints(minWidth: 40, maxWidth: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _amount.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Ink(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (_amount < 10) _amount++;
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
