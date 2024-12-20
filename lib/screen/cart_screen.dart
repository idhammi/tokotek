import 'package:flutter/material.dart';
import 'package:tokotek/constant/colors.dart';
import 'package:tokotek/constant/utils.dart';
import 'package:tokotek/data/sample.dart';
import 'package:tokotek/screen/home_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        toolbarHeight: 60,
        title: Row(
          children: [
            const Text(
              "Cart",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButtonCircle(
              icon: Icons.more_horiz_outlined,
              color: AppColors.background,
              onPressed: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              },
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Material(
              color: AppColors.background,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.place_outlined, color: Colors.grey),
                      SizedBox(width: 8),
                      Text(
                        "92, High Street, London",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                  bottom: 32,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CheckboxCart(),
                        const SizedBox(width: 8),
                        const Text(
                          "Select All",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          },
                          icon: const Icon(Icons.upload_outlined),
                        ),
                        IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          },
                          icon: const Icon(Icons.edit_outlined),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Expanded(
                      child: CartItems(),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 42,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        },
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckboxCart extends StatefulWidget {
  const CheckboxCart({super.key});

  @override
  State<CheckboxCart> createState() => _CheckboxCartState();
}

class _CheckboxCartState extends State<CheckboxCart> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<WidgetState> states) {
      const Set<WidgetState> interactiveStates = <WidgetState>{
        WidgetState.pressed,
        WidgetState.hovered,
        WidgetState.focused,
        WidgetState.selected,
      };
      if (states.any(interactiveStates.contains)) {
        return AppColors.secondary;
      }
      return Colors.transparent;
    }

    return Transform.scale(
      scale: 1.1,
      child: Checkbox(
        checkColor: Colors.white,
        fillColor: WidgetStateProperty.resolveWith(getColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: const BorderSide(
          color: AppColors.secondary,
          width: 1.8,
        ),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    );
  }
}

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      // itemCount: productList.length,
      itemCount: 2,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 100,
          child: Row(
            children: [
              const CheckboxCart(),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Image.asset(
                  productList[index].image,
                  width: 64,
                  height: 64,
                ),
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
                        Text(
                          "${productList[index].currency}${productList[index].currentPrice.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
      separatorBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.only(left: 135),
          child: Divider(
            thickness: 2,
            color: AppColors.background,
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
        Row(
          children: [
            IconButtonCircle(
              icon: Icons.remove,
              onPressed: () {
                setState(() {
                  if (_amount > 1) _amount--;
                });
              },
              color: AppColors.background,
              padding: 14,
              iconSize: 16,
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
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            IconButtonCircle(
              icon: Icons.add,
              onPressed: () {
                setState(() {
                  if (_amount < 10) _amount++;
                });
              },
              color: AppColors.background,
              padding: 14,
              iconSize: 16,
            ),
          ],
        ),
      ],
    );
  }
}
