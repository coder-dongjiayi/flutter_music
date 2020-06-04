# iMusic

### 视频演示
[哔哩哔哩](https://www.bilibili.com/video/BV1X54y1D7eb)

### 页面效果预览

| <img src="http://ijishuang.oss-cn-hangzhou.aliyuncs.com/GZB/iOSFiles/IMG_1557.jpg" style="zoom:50%;" /> | <img src="http://ijishuang.oss-cn-hangzhou.aliyuncs.com/GZB/iOSFiles/IMG_1558.jpg" style="zoom:50%;" /> | <img src="http://ijishuang.oss-cn-hangzhou.aliyuncs.com/GZB/iOSFiles/IMG_1559.jpg" style="zoom:50%;" /> | <img src="http://ijishuang.oss-cn-hangzhou.aliyuncs.com/GZB/iOSFiles/IMG_1560.jpg" style="zoom:50%;" /> |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
| <img src="http://ijishuang.oss-cn-hangzhou.aliyuncs.com/GZB/iOSFiles/IMG_1561.jpg" style="zoom:50%;" /> | <img src="http://ijishuang.oss-cn-hangzhou.aliyuncs.com/GZB/iOSFiles/IMG_1562.jpg" style="zoom:50%;" /> | <img src="http://ijishuang.oss-cn-hangzhou.aliyuncs.com/GZB/iOSFiles/IMG_1563.jpg" style="zoom:50%;" /> | <img src="http://ijishuang.oss-cn-hangzhou.aliyuncs.com/GZB/iOSFiles/IMG_1564.jpg" style="zoom:50%;" /> |
| <img src="http://ijishuang.oss-cn-hangzhou.aliyuncs.com/GZB/iOSFiles/IMG_1567.jpg" style="zoom:50%;" /> | <img src="http://ijishuang.oss-cn-hangzhou.aliyuncs.com/GZB/iOSFiles/IMG_1568.jpg" style="zoom:50%;" /> | <img src="http://ijishuang.oss-cn-hangzhou.aliyuncs.com/GZB/iOSFiles/IMG_1570.jpg" style="zoom:50%;" /> | <img src="http://ijishuang.oss-cn-hangzhou.aliyuncs.com/GZB/iOSFiles/IMG_1571.jpg" style="zoom:50%;" /> |



## 前言

* flutter 是谷歌2017年推出的一套跨平台解决方案。目前已经支持iOS Android 和 web 端。macOs 也也已经被提上了日程，而且谷歌未来的操作系统FuchsiaOS极大的可能 前端也是用flutter实现 ，flutter 野心很大，有想统一大前端的趋势。


## 运行环境
*  ``` Flutter 1.12.13```
* ```Dart 2.7.0```

## 如何开始
1. ```git clone https://github.com/SHIMLY-GitHub/flutter_music.git```
2. 部署接口地址 ```https://binaryify.github.io/NeteaseCloudMusicApi/#/?id=%e5%ae%89%e8%a3%85```
3. 配置服务器地址 ``` lib/http_request/config.dat``` 更改baseURL 为第二步 中配置的接口地址
4. 在命令行执行```flutter run``` 默认情况下是debug模式。 如果你想获得更好的体验可以执行```flutter run --release``` release模式下会比debug模式运行更流畅

## 依赖简介
*  ```provider``` 状态管理
* ```shared_preferences``` 存储用户信息
* ```flutter_swiper``` 轮播图
* 	```flutter_screenutil``` 屏幕适配
* ``cached_network_image`` 这个网络图片缓存框架 既有动画又有本地缓存 系统自带的要么有缓存没动画 要么有动画没缓存
* ``vibrate``  震动反馈
* ```audioplayers``` 音频播放
* ```flutter_flexible_toast``` 信息提示 

## 对于Flutter的一些看法
* 我是一个iOS开发者，刚刚学习flutter 的时候确实不太适应这种声明式UI布局的理念，但是随着不断学习的深入 我发现之前在iOS上特别复杂的布局 在Flutter上变的如此简单，当你熟悉了以后会发现你的布局效率大大的提升。在学习的过程中 也踩了不少坑，最近写了这个简单的项目 就是想给打算入坑Flutter 但是又不知道如何开始的同学一些思路，在编写代码的过程中 对于widget的命名 我尽量避免了一些iOS平台专有的控件名称比如 ```cell```  ```tableView``` (因为这样对Andoroid的同学很不友好) 在文件命名和方法命名上 我翻阅了Flutter的源代码 尽量和系统保持统一。因为功能不多，也没有复杂的业务逻辑 ，更没有复杂的布局 特别适合新手入门学习 接下来我可能会加入一些UITest 完善一下整个的开发流程

* 关于Flutter的优势以及优点不在赘述，请前往Flutter官网自行查看，我主要说一下Flutter目前存在一些不足之处

    1. 热重载 是Flutter特别推崇的一个功能，但是在实际开发中 当你的布局改动特别大 或者有新建文件的时候 热重载就会失效，我是用的AndroidStudio 有时候莫名其妙的热重载就不好使了 只能重启，重新编译，但是Flutter在iOS平台上重新编译一次时间还不短。
2. AndroidStudio有个Bug Flutter中的bulid 方法莫名其妙的会多执行一次 。
    3. Flutter的特别推崇的hero动画 在动画执行的过程中会多次执行buid方法 这对于高性能的要求很不友好，当然在某种意义下，这可能并不算什么不足。
4. 关于Flutter中的回调地狱，其实我并不想把这个作为不足之处列出来，因为在我看来，这并不是什么特别大的问题 但是大多数人都特别排斥这种操作，所以我就简单说一下，Flutter上有一个库[nested](https://pub.dev/packages/nested)倒是可以解决一些回调地狱的问题，但是我觉得可以通过封装``widget``  提取``widget`` 来减少层级套用，如果你写Object-C代码 手写布局的话 你都写一个方法里 不封装 ，不抽取， 不加注释，其实这样的代码 看起来并不一定比回调地狱好多少。回调地狱的存在恰好可以让你审视自己写的代码 是否可读性强 是否易于维护。
    5. Flutter中如果加载大量的图片会引起闪退 这对于电商应用来说是致命的，不过社区倒是有一些解决方法，但是我还是希望官方能在这方面做一下优化。

*  关于 Flutter 在iOS平台的表现能力，虽然Flutter绕过了js桥接带来的性能损耗 直接使用对应平台的GPU进行渲染，其性能接近原生。就实际来看 也确实如此，不过在iOS平台 实话实说 总感觉跟原生还有有点差距，但这并不是说Flutter的性能比原生要差很多，更多的原因可能是因为iOS平台的动画效果 相对更加流畅，所以给人感觉原生效果似乎性能更好。我知道的商业项目大规模应用Flutter 有阿里旗下的闲鱼，还有京东旗下的芬香 但是闲鱼使用的Flutter 引擎是 经过改造，优化以后的 ，并不是github上开源的，至于芬香  一直听说京东有关于Flutter有深度的定制化 不知道京东用的是不是github上开源的。但是 不管怎样这两款App都很有参考意义。

*  最后关于Flutter的发展 从目前社区活跃度以及中国互联网公司对Flutter的支持来看 大有劲头，Flutter是不是前端的未来 现在不好说 ，但是前端编程大统一 一定是未来，对于这种声明式UI 个人比较看好，因为很多在命令式UI上特别复杂的布局 会变的非常简单。而且谷歌在打造自己的新一代操作系统``Fuchsia ``前端也是使用Flutter。据 坊间传闻，这个操作系统还有可能取代Android 如果这样发展的话Flutter将大有可为。至于swiftUI 他跟Flutter很像，不过目前还不成熟 社区支持也不完善， 但是以苹果技术社区的力量，以及中国互联网公司KPI的诱惑，一旦swiftUI 成熟起来，相关的配套库就会像雨后春笋一样崛起，如果swiftUI 在将来也可以跨平台了 对于开发者和一些中小型公司来说 真的是善莫大焉。总之 不管是Flutter 还是 swiftUI 未来可期。

    


​       

## 最后感谢UI设计师和接口开发团队
1. [無我](https://www.ui.cn/detail/518851.html) 
2. [网易云api](https://github.com/Binaryify/NeteaseCloudMusicApi)
  

  

  