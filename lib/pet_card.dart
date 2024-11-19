import 'package:flutter/material.dart';
import 'package:flutter_grid_view/hotbuy_menu.dart';
import 'package:flutter_grid_view/table.dart';
import 'package:flutter_grid_view/models/entity.dart';
import 'package:flutter_grid_view/swiper.dart';
import 'package:flutter_grid_view/video_player.dart';


class Cardofpet extends StatefulWidget {
  int index_Entity;
  Cardofpet({super.key, required this.index_Entity});

  @override
  State<Cardofpet> createState() => _CardofpetState(index_Entity);
}

class _CardofpetState extends State<Cardofpet> {
  final int index_Entity;
  bool _isFavorite = false;
  Color _FavColor = Colors.black;
  int count = 0;
  _CardofpetState(this.index_Entity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 200,
            child: SwiperImage(index_Entity: index_Entity),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: Text('Имя питомца: ${entityList[index_Entity].name}', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
          ),
          Container(
            margin: EdgeInsets.all(8),

            child: Row(
              children: [
                Text('Цена: ${entityList[index_Entity].cost}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                IconButton(onPressed: (){
                  if (_isFavorite == false) {
                    favorites.add(entityList[index_Entity]);
                    _FavColor = Colors.red;
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  }
                  else if (_isFavorite == true){
                    favorites.removeWhere((element) => element.id == entityList[index_Entity].id);
                    _FavColor = Colors.black;
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  }
                }, icon: Icon(Icons.favorite),
                  color: _FavColor,
                  selectedIcon: Icon(Icons.favorite),
                  isSelected: _isFavorite,
                ),
                IconButton(onPressed: (){
                  shoppingCart.add(entityList[index_Entity]);
                }, icon: Icon(Icons.shopping_cart)
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: Colors.greenAccent,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HotBuy()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: Text('Описание:'),
          ),
          Container(
            width: 200,
            height: 100,
            child: ListView(
              children: <Widget>[
                Text('${entityList[index_Entity].description}')
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: Text('Доп. информация:'),
          ),
          Container(

            child: ExampleTable(index_Entity: index_Entity),
          ),
          Container(
            margin: EdgeInsets.all(8),
            child: VideoWidget(index_Entity: index_Entity),
          )
        ],
      ),
    );
  }
}


