# KNPickerView
![Image text](https://github.com/hexiaoba/YZPickerViewThreeColum/blob/master/result.gif)
##用法
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
###回调方法
```Objective-C
- (void)pickerView:(YZPickerViewThreeColum *)pickerView getOneCloumResult:(NSString *)oneColumResult twoColumResult:(NSString *)twoColumResult threeColumResult:(NSString *)threeColumResult {
    NSLog(@"%@ %@ %@", oneColumResult, twoColumResult, threeColumResult);
}
```

####补充说明
1、属性cancelButton，可以设置取消按钮的样式</br>
2、属性sureButton， 可是设置确定按钮的样式</br>

