# KNPickerView
![Image text](https://github.com/hexiaoba/YZPickerViewThreeColum/blob/master/result.gif)
##用法
```Objective-C
    YZPickerViewThreeColum *pickerView = [[YZPickerViewThreeColum alloc] init];
    pickerView.delegate = self;
    pickerView.oneContents = @[@"北京市", @"上海市", @"深圳市"];
    pickerView.twoContents = @[@"北京市", @"上海市", @"深圳市"];
    pickerView.threeContents = @[@"东城区", @"闵行区", @"南山区"];
    [pickerView show];
```
###回调方法
```Objective-C
- (void)pickerView:(YZPickerViewThreeColum *)pickerView getOneCloumResult:(NSString *)oneColumResult twoColumResult:(NSString *)twoColumResult threeColumResult:(NSString *)threeColumResult {
    NSLog(@"%@ %@ %@", oneColumResult, twoColumResult, threeColumResult);
}
```
