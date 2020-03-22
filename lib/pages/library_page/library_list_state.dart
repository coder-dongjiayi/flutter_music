
import 'package:flutter/cupertino.dart';
import 'package:flutter_music/models/play_list_model.dart';
import 'package:provider/provider.dart';

export  'package:provider/provider.dart';

class LibraryListState extends ChangeNotifier{

  var _dataSource = List<PlayItemModel>();

  ///用于记录删除的时候 选中的index 默认没有被选中的 为-1
  var _selectedIndex = -1;

  var isEditing = false;

   List<PlayItemModel> get dataSource => _dataSource;
  void updateSelected(int index){

    if(_selectedIndex >= 0){

      PlayItemModel preItemModel = _dataSource[_selectedIndex];
      preItemModel.selected = false;
    }

    PlayItemModel itemModel = _dataSource[index];
    itemModel.selected = !itemModel.selected;
    _selectedIndex = index;

    notifyListeners();
  }




  static LibraryListState libraryState (BuildContext context){
    return  Provider.of<LibraryListState>(context,listen: false);
  }

  static void initDataSource(BuildContext context,List<PlayItemModel> list){
    Provider.of<LibraryListState>(context,listen: false)._dataSource = list;
  }


  static void updateDeleteState(BuildContext context,int index){
    Provider.of<LibraryListState>(context,listen: false).updateSelected(index);
  }


  static List<PlayItemModel> getDataSource(BuildContext context){

    return Provider.of<LibraryListState>(context,listen: false)._dataSource;
  }



}