import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shop_x_flutter/controllers/product_controller.dart';

class HomePage extends StatelessWidget {
  final ProductController _product_controller = Get.put(ProductController());

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          )
        ],
      ),
      body: Column(children: [
        const TopMenu(),
        Obx(() => StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: _product_controller.products
                .map(
                  (p) => Container(height: 200, width: 100, color: Colors.red),
                )
                .toList()))
      ]),
    );
  }
}

class TopMenu extends StatelessWidget {
  const TopMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Expanded(
              child: Text('ShopX',
                  style: TextStyle(
                    fontFamily: 'avenir',
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  )),
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.view_list_rounded)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.grid_view)),
          ],
        ));
  }
}
