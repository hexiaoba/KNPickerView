# KNPickerView
![Image text](https://github.com/hexiaoba/YZPickerViewThreeColum/blob/master/result.gif)
## 使用 How to Use it
### Carthage<br> 
<a href="https://github.com/Carthage/Carthage">Carthage</a> 也是一个很好的管理三方框架的工具<br>
#### 安装Carthage
- 你可以使用<a href="https://brew.sh/">Homebrew</a>来安装Carthage
```
$ brew update
$ brew install carthage
```
- 还可以下载Carthage.pkg 文件<a href="https://github.com/Carthage/Carthage/releases">release</a>来安装Carthage<br>

安装Carthage之后，在你的工程里创建一个Cartfile文件 ,并在里面写上下面这句话<br>
```
github "hexiaoba/KNPickerView"
```
然后在终端里执行
```
carthage update
```
- 安装好后只需要在对应 Target 中的 Build Setting 中的 Framework Search Path 项加入以下路径
- ```$(SRCROOT)/Carthage/Build/iOS```

导入头文件 ```#import <KNPickerViewCarthage/KNPickerView.h>```就可以使用了

### 示例代码
```Objective-C
    YZPickerViewThreeColum *pickerView = [[YZPickerViewThreeColum alloc] init];
    pickerView.delegate = self;
    /* 第一列数据，要是只有一列，则只传oneContents */
    pickerView.oneContents = @[@"北京市", @"上海市", @"深圳市"];
     /* 第二列数据，要是只有二列，则要传oneContents和twoContents */
    pickerView.twoContents = @[@"北京市", @"上海市", @"深圳市"];
     /* 第三列数据，要是有三列，则要传oneContents和twoContents和threeContents */
    pickerView.threeContents = @[@"东城区", @"闵行区", @"南山区"];
    [pickerView show];
```
### 回调方法
```Objective-C
- (void)pickerView:(YZPickerViewThreeColum *)pickerView getOneCloumResult:(NSString *)oneColumResult twoColumResult:(NSString *)twoColumResult threeColumResult:(NSString *)threeColumResult {
    NSLog(@"%@ %@ %@", oneColumResult, twoColumResult, threeColumResult);
}
```

#### 补充说明
1、属性cancelButton，可以设置取消按钮的样式</br>
2、属性sureButton， 可是设置确定按钮的样式</br>

