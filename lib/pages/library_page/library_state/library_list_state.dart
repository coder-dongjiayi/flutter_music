
import 'package:flutter/cupertino.dart';
import 'package:flutter_music/models/play_list_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/scheduler.dart';
export  'package:provider/provider.dart';


class LibraryListState extends ChangeNotifier{


  var _dataSource = List<PlayItemModel>();

  ///点击删除按钮列表的编辑动画
  AnimationController editAnimationController;
  Animation editAnimation;

  ///列表删除之后的平移动画
  var sliderAnimationControllerList = List<AnimationController>();
  var sliderAnimationList = List<Animation<Offset>>();

  ///删除平移之后上滑动画
  var sizeAnimationControllerList = List<AnimationController>();
  var sizeAnimationList = List<Animation<double>>();



  ///用于记录删除的时候 选中的index 默认没有被选中的 为-1
  var selectedIndex = -1;

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



  void deleteAction(){

    if(dataSource.length == 0) return;

   if(editAnimationController.status == AnimationStatus.completed){
     editAnimationController.reverse().whenComplete((){
       ///执行删除的位移动画
       if(selectedIndex == -1) return;


       AnimationController sliderAnimationController = sliderAnimationControllerList[selectedIndex];

       PlayItemModel model = _dataSource[selectedIndex];
       model.slideEnd = true;

       AnimationController sizeAnimationController = sizeAnimationControllerList[selectedIndex];

       
       sliderAnimationController.forward().whenComplete((){

         notifyListeners();



         sizeAnimationController.forward().whenComplete((){



           sliderAnimationList.removeAt(selectedIndex);
           sizeAnimationList.removeAt(selectedIndex);

           sliderAnimationControllerList.removeAt(selectedIndex);
           sizeAnimationControllerList.removeAt(selectedIndex);

           _dataSource.removeAt(selectedIndex);
           selectedIndex = -1;
           notifyListeners();


         });

       });

     });

   }else{
     editAnimationController.forward();
   }


  }

  void initEditAnimation(TickerProvider vsync){

    editAnimationController = AnimationController(duration: Duration(milliseconds: 250),vsync: vsync);

    editAnimation = Tween<Offset>(begin: Offset.zero,end: Offset(0.1, 0)).animate(CurvedAnimation(parent:editAnimationController,curve: Curves.easeIn));

  }

  void initDeleteAnimation(TickerProvider vsync){


    ///平移动画
    AnimationController sliderAnimationController = AnimationController(vsync: vsync, duration: Duration(milliseconds: 300));

    Animation sliderAnimation = Tween(begin: Offset.zero, end: Offset(1.0, 0.0))
        .animate(
        CurvedAnimation(parent: sliderAnimationController, curve: Curves.easeOut));

    sliderAnimationControllerList.add(sliderAnimationController);

    sliderAnimationList.add(sliderAnimation);



   /// 上滑动画
    AnimationController sizeAnimationController =
        AnimationController(vsync: vsync, duration: Duration(milliseconds: 300));

    Animation sizeAnimation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: sizeAnimationController, curve: Curves.easeOut));

    sizeAnimationControllerList.add(sizeAnimationController);
    sizeAnimationList.add(sizeAnimation);
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
    sliderAnimationControllerList.forEach((controller){
      controller.dispose();
    });
    sizeAnimationControllerList.forEach((controller){
      controller.dispose();
    });
    editAnimationController.dispose();


    super.dispose();
  }
}