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

@property (nonatomic , strong) NSArray *oneContents;
@property (nonatomic , strong) NSArray *twoContents;
@property (nonatomic , strong) NSArray *threeContents;

@property (nonatomic , weak) id <YZPickerViewThreeColumDelegate> delegate;

- (void)show;

@end
