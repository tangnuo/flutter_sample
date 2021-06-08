import 'package:flutter/material.dart';
import 'package:flutter_sample/actual/provider/ChangeNotifierProvider.dart';
import 'package:flutter_sample/actual/provider/Consumer.dart';
import 'package:flutter_sample/actual/provider/cart/CartModel.dart';

/// https://book.flutterchina.club/chapter7/provider.html#provider
class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("跨组件状态管理-Provider"),
      ),
      body: buildBody(),
    );
  }

  Center buildBody() {
    return Center(
      child: ChangeNotifierProvider<CartModel>(
        data: CartModel(),
        child: Builder(builder: (context) {
          return Column(
            children: <Widget>[
              Consumer<CartModel>(
                builder: (context, cart) => Text("总价：${cart.totalPrice}"),
              ),
              // Builder(builder: (context) {
              //   var cart = ChangeNotifierProvider.of<CartModel>(context);
              //   return Text("总价: ${cart.totalPrice}\n数量：${cart.items.length}");
              // }),
              Builder(builder: (context) {
                print("RaisedButton build"); //在后面优化部分会用到
                return RaisedButton(
                  child: Text("添加商品"),
                  onPressed: () {
                    //给购物车中添加商品，添加后总价会更新
                    ChangeNotifierProvider.of<CartModel>(context, listen: false)
                        .add(Item(20.0, 1));
                  },
                );
              }),
            ],
          );
        }),
      ),
    );
  }
}
