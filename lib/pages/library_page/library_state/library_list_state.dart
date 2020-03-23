
import 'package:flutter/cupertino.dart';
import 'package:flutter_music/models/play_list_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/scheduler.dart';
export  'package:provider/provider.dart';


class LibraryListState extends ChangeNotifier{


  var _dataSource = List<PlayItemModel>();

  var deleteIndex = -1;

  var _dissAnimationControllerList = List<AnimationController>();
  var dissAnimationList = List<Animation<Offset>>();

  ///用于记录删除的时候 选中的index 默认没有被选中的 为-1
  var selectedIndex = -1;

  var isEditing = false;

   List<PlayItemModel> get dataSource => _dataSource;
  void updateSelected(int index){

    if(selectedIndex >= 0){
      PlayItemModel preItemModel = _dataSource[selectedIndex];
      preItemModel.selected = false;
    }

    PlayItemModel itemModel = _dataSource[index];
    itemModel.selected = !itemModel.selected;
    selectedIndex = index;

    notifyListeners();
  }



  void deletePlayItem(){

    deleteIndex = 0;
    _dataSource.removeAt(0);
    notifyListeners();

//    _dataSource.removeWhere((item){
//      return item.selected == true;
//     });
//   for(int index =0 ; index < _dataSource.length ; index++){
//     if(_dataSource[index].selected == true){
//       AnimationController controller = _dissAnimationControllerList[index];
//       controller.forward().whenComplete((){
//         _dataSource.removeAt(index);
//       });
//
//       return;
//     }
//   }

    //notifyListeners();
  }

  void initAnimationController(TickerProvider vsync){
    AnimationController animationController = AnimationController(duration: Duration(microseconds: 300),vsync: vsync);
    Animation<Offset>  animation = Tween<Offset>(begin: Offset.zero,end: Offset(1.0,0)).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    _dissAnimationControllerList.add(animationController);


    dissAnimationList.add(animation);

  }

  void initDataSourceList(List<PlayItemModel> list){
    _dataSource = list;
  }




  static LibraryListState libraryState (BuildContext context){
    return  Provider.of<LibraryListState>(context,listen: false);
  }

  static void initDataSource(BuildContext context,List<PlayItemModel> list){
    Provider.of<LibraryListState>(context,listen: false).initDataSourceList(list);
  }


  static void updateDeleteState(BuildContext context,int index){
    Provider.of<LibraryListState>(context,listen: false).updateSelected(index);
  }


  static List<PlayItemModel> getDataSource(BuildContext context){

    return Provider.of<LibraryListState>(context,listen: false)._dataSource;
  }



  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
}