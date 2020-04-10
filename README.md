# iMusic

### 页面效果预览

| <img src="./imgs/IMG_1557.jpg" style="zoom:50%;" /> | <img src="./imgs/IMG_1558.jpg" style="zoom:50%;" /> | <img src="./imgs/IMG_1559.jpg" style="zoom:50%;" /> | <img src="./imgs/IMG_1560.jpg" style="zoom:50%;" /> |
| :-------------------------------------------------: | :-------------------------------------------------: | :-------------------------------------------------: | :-------------------------------------------------: |
| <img src="./imgs/IMG_1561.jpg" style="zoom:50%;" /> | <img src="./imgs/IMG_1562.jpg" style="zoom:50%;" /> | <img src="./imgs/IMG_1563.jpg" style="zoom:50%;" /> | <img src="./imgs/IMG_1564.jpg" style="zoom:50%;" /> |
| <img src="./imgs/IMG_1567.jpg" style="zoom:50%;" /> | <img src="./imgs/IMG_1568.jpg" style="zoom:50%;" /> | <img src="./imgs/IMG_1570.jpg" style="zoom:50%;" /> | <img src="./imgs/IMG_1571.jpg" style="zoom:50%;" /> |



## 前言

* flutter 是谷歌2017年推出的一套跨平台解决方案。目前已经支持iOS Android 和 web 端。macOs 也也已经被提上了日程，而且谷歌未来的操作系统FuchsiaOS极大的可能 前端也是用flutter实现 ，flutter 野心很大，有想统一大前端的趋势。


## 运行环境
*  ``` Flutter 1.12.13```
* ```Dart 2.7.0```

## 如何开始
1. ```git clone https://github.com/SHIMLY-GitHub/flutter_music.git```
2. 部署接口地址 ```https://binaryify.github.io/NeteaseCloudMusicApi/#/?id=%e5%ae%89%e8%a3%85```
3. 配置服务器地址 ``` lib/http_request/config.dat``` 更改baseURL 为第二步 中配置的接口地址
4. ```flutter run```默认情况下是debug模式 如果你想获得更好的体验 可以执行```flutter run --release```

## 依赖简介
*  ```provider``` 状态管理
* ```shared_preferences``` 存储用户信息
* ```flutter_swiper``` 轮播图
* 	```flutter_screenutil``` 屏幕适配
* ``cached_network_image`` 这个网络图片缓存框架 既有动画又有本地缓存 系统自带的要么有缓存没动画 要么有动画没缓存
* ``vibrate``  震动反馈
* ```audioplayers``` 音频播放
* ```flutter_flexible_toast``` 信息提示 


## 最后感谢UI设计师和接口开发团队
1. [無我](https://www.ui.cn/detail/518851.html) 
2. [网易云api](https://github.com/Binaryify/NeteaseCloudMusicApi)
  

  

  