import 'package:flutter/material.dart';
import 'package:flutter_grid_view/entity_button.dart';
import 'package:flutter_grid_view/models/entity.dart';
class EntityList extends StatelessWidget {
  const EntityList({Key? key, required this.index_Entity}) : super(key: key);
  final int index_Entity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ClipOval(
              child: Image.network(
                entityList[index_Entity].photo,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  entityList[index_Entity].name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Описание: ${entityList[index_Entity].complex}',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 4),
                // Цена
                Text(
                  'Цена: ${entityList[index_Entity].cost} ₽',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 8),
                ToEntity(index_Entity: index_Entity),
              ],
            ),
          ),
        ],
      ),
    );
  }
}