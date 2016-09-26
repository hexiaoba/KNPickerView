//
//  DayPickerView.h
//  风向标
//
//  Created by 何凯楠 on 15/10/27.
//  Copyright (c) 2015年 何凯楠. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YZPickerViewThreeColum;
@protocol YZPickerViewThreeColumDelegate <NSObject>

@optional

- (void)pickerView:(YZPickerViewThreeColum *)pickerView didSelectOneColumResult:(NSString *)OneColumResult twoColumResult:(NSString *)twoColumResult threeColumResult:(NSString *)threeColumResult inComponent:(NSInteger)component;

- (void)pickerView:(YZPickerViewThreeColum *)pickerView getOneCloumResult:(NSString *)oneColumResult twoColumResult:(NSString *)twoColumResult threeColumResult:(NSString *)threeColumResult;

@end

@interface YZPickerViewThreeColum : UIView

/**
 第一列数据，要是只有一列，则只传oneContents
 */
@property (nonatomic , strong) NSArray *oneContents;
/**
 第二列数据，要是只有二列，则要传oneContents和twoContents
 */
@property (nonatomic , strong) NSArray *twoContents;
/**
 第三列数据，要是有三列，则要传oneContents和twoContents和threeContents
 */
@property (nonatomic , strong) NSArray *threeContents;

@property (nonatomic , weak) id <YZPickerViewThreeColumDelegate> delegate;

/**
 取消按钮
 */
@property (nonatomic , weak) UIButton *cancelButton;

/**
 确定按钮
 */
@property (nonatomic , weak) UIButton *sureButton;
/**
 显示视图
 */
- (void)show;


@end
