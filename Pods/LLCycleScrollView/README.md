# iOS图片轮播 LLCycleScrollView

[![License](https://img.shields.io/cocoapods/l/LLCycleScrollView.svg?style=flat)](http://cocoapods.org/pods/LLCycleScrollView)
[![Platform](https://img.shields.io/cocoapods/p/LLCycleScrollView.svg?style=flat)](http://cocoapods.org/pods/LLCycleScrollView)

<img src="https://github.com/LvJianfeng/LLCycleScrollView/blob/master/2.gif" width="400" align="center">  <img src="https://github.com/LvJianfeng/LLCycleScrollView/blob/master/screen.gif" width="400" align="center">

## Issues
如果使用过程中，有什么问题欢迎issues。

## Support

* 支持纯图片
* 支持文本图片结合
* 支持横向滚动
* 支持纵向滚动
* 支持手势滑动
* 支持点击回调
* 支持图片数据的延时加载
* 支持没有数据，占位图占位(仅设置CoverImage(有默认图)即可)
* 支持本地图片显示及与网络图的混合显示
* 支持系统UIPageControl位置设置
* 支持StoryBoard
* 支持纯文本

## Update
请使用最新版本 1.3.1

版本信息 | 更新描述
----    |  ------
1.3.2   | * 由于IBDesignable问题，临时取消，后续会检查更新
1.3.1   | * 修复图placeHolder显示问题
1.3.0   | * 修复StoryBoard在部分设备显示问题
1.2.9   | * 增加支持文本Leading约束属性titleLeading<br>* PageControl的Bottom约束属性pageControlBottom
1.2.8   | * 支持纯文本部分属性修改，没有开放Label
1.2.7   | * 支持纯文本
1.2.6   | * 修改自定义PageControl反向滚动时候，pageControl的方向控制问题
1.2.5   | * 修复自定义PageControl快速滚动问题，修复系统UIPageControl位置left&right对换设置问题
1.2.4   | * 支持系统UIPageControl位置设置，其属性pageControlPosition<br>* 公开pageControl及customPageControl两个控件，方便控制及自定义
1.2.3   | * 支持本地图片显示及与网络图的混合显示<br>* 增加图片contentMode的控制
1.2.2   | * 标题显示两行文字
1.2.1   | * 支持不同类型的PageControl<br>* 支持修改PageControl颜色，当前显示颜色等(文件注释)
1.1.1   | * 支持Storyboard

## CocoaPods
* 支持CocoaPods
```ruby
pod 'LLCycleScrollView' 
```
<!--注意：在pod install的时候，比较慢(可能网速问题)，如果在pod update的时候就比较快了，此无解。-->

## Usage
```swift
let bannerDemo = LLCycleScrollView.llCycleScrollViewWithFrame(CGRect.init(x: 0, y: bannerDemo.ll_y + 205, width: w, height: 200))
// 是否自动滚动
bannerDemo.autoScroll = true

// 是否无限循环，此属性修改了就不存在轮播的意义了 😄
bannerDemo.infiniteLoop = true

// 滚动间隔时间(默认为2秒)
bannerDemo.autoScrollTimeInterval = 3.0

// 等待数据状态显示的占位图
bannerDemo.placeHolderImage = #UIImage

// 如果没有数据的时候，使用的封面图
bannerDemo.coverImage = #UIImage

// 设置图片显示方式=UIImageView的ContentMode
bannerDemo.imageViewContentMode = .scaleToFill

// 设置滚动方向（ vertical || horizontal ）
bannerDemo.scrollDirection = .vertical

// 设置当前PageControl的样式 (.none, .system, .fill, .pill, .snake)
bannerDemo.customPageControlStyle = .snake

// 非.system的状态下，设置PageControl的tintColor
bannerDemo.customPageControlInActiveTintColor = UIColor.red

// 设置.system系统的UIPageControl当前显示的颜色
bannerDemo.pageControlCurrentPageColor = UIColor.white

// 非.system的状态下，设置PageControl的间距(默认为8.0)
bannerDemo.customPageControlIndicatorPadding = 8.0

// 设置PageControl的位置 (.left, .right 默认为.center)
bannerDemo.pageControlPosition = .center

// 背景色
bannerDemo.collectionViewBackgroundColor

// 添加到view
self.addSubview(bannerDemo1)

// 模拟网络图片获取
DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
  bannerDemo.imagePaths = imagesURLStrings
}
```


## Example

示例代码见ViewController.swift

## Future

* 优化代码

## Author

LvJianfeng, coderjianfeng@foxmail.com
