//
//  DayPickerView.m
//  风向标
//
//  Created by 何凯楠 on 15/10/27.
//  Copyright (c) 2015年 何凯楠. All rights reserved.
//

#import "YZPickerViewThreeColum.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

static CGFloat const DayPickerViewHeight = 246.f;
static CGFloat const DayPickerShowDimissAnimationDuration = 0.5f;

@interface YZPickerViewThreeColum()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic , strong) UIPickerView *pickerView;

@property (nonatomic , copy) NSString *selectedOneColum;
@property (nonatomic , copy) NSString *selectedTwoColum;
@property (nonatomic , copy) NSString *selectedThreeColum;

@property (nonatomic , weak) UIView *converView;

@end

@implementation YZPickerViewThreeColum

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
        self.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, DayPickerViewHeight);
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)setupViews
{
    UIView *aboveBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    aboveBgView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    [self addSubview:aboveBgView];
    
    UIButton *dismissBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dismissBtn.frame = CGRectMake(0, 0, 50, 30);
    [dismissBtn setTitle:@"取消" forState:UIControlStateNormal];
    [dismissBtn addTarget:self action:@selector(dismissBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [dismissBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    dismissBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [aboveBgView addSubview:dismissBtn];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(SCREEN_WIDTH - 50, 0, 50, 30);
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [aboveBgView addSubview:sureBtn];

    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, 216)];
    self.pickerView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:1];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    [self addSubview:self.pickerView];
}
- (void)setOneContents:(NSArray *)oneContents {
    _oneContents = oneContents;
    if (oneContents.count) {
        self.selectedOneColum = oneContents[0];
    } else {
        self.selectedOneColum = @"";
    }
    
    [self.pickerView reloadComponent:0];
}

-(void)setTwoContents:(NSArray *)twoContents {
    _twoContents = twoContents;
    if (twoContents.count) {
        self.selectedTwoColum = twoContents[0];
    }else {
        self.selectedTwoColum = @"";
    }
    
    [self.pickerView reloadComponent:1];
}

- (void)setThreeContents:(NSArray *)threeContents {
    _threeContents = threeContents;
    
    if (threeContents.count) {
        self.selectedThreeColum = threeContents[0];
    }else {
        self.selectedThreeColum = @"";
    }
    
    [self.pickerView reloadComponent:2];
}

#pragma mark- UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.oneContents.count;
    } else if (component == 1) {
        return self.twoContents.count;
    } else {
        return self.threeContents.count;
    }
}

#pragma mark- UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return self.oneContents[row];
    } else if (component == 1) {
        return self.twoContents[row];
    } else {
        return self.threeContents[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        NSString *one = self.oneContents[row];
        self.selectedOneColum = one;
    } else if (component == 1) {
        NSString *two = self.twoContents[row];
        self.selectedTwoColum = two;
    } else {
        NSString *three = self.threeContents[row];
        self.selectedThreeColum = three;
    }
    
    if ([self.delegate respondsToSelector:@selector(pickerView:didSelectOneColumResult:twoColumResult:threeColumResult:inComponent:)]) {
        [self.delegate pickerView:self didSelectOneColumResult:self.selectedOneColum twoColumResult:self.selectedTwoColum threeColumResult:self.selectedThreeColum inComponent:component];
    }
}

- (void)setupConverView
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIView *converView = [[UIView alloc] initWithFrame:window.bounds];
    converView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [window addSubview:converView];
    self.converView = converView;
    [self.converView addSubview:self];
    UITapGestureRecognizer *removeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeConverView)];
    [self.converView addGestureRecognizer:removeTap];
}

- (void)removeConverView
{
    [self dismiss];
}

- (void)show
{
    [self setupConverView];
    
    [UIView animateWithDuration:DayPickerShowDimissAnimationDuration animations:^{
        self.frame = CGRectMake(0, SCREEN_HEIGHT - DayPickerViewHeight, SCREEN_WIDTH, DayPickerViewHeight);
        self.userInteractionEnabled = NO;
    } completion:^(BOOL finished) {
        self.userInteractionEnabled = YES;
    }];
}

- (void)dismiss
{
    [UIView animateWithDuration:DayPickerShowDimissAnimationDuration animations:^{
        self.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, DayPickerViewHeight);
        self.userInteractionEnabled = NO;
    } completion:^(BOOL finished) {
        self.userInteractionEnabled = YES;
        [self.converView removeFromSuperview];
    }];
}


- (void)dismissBtnClick
{
    [self dismiss];
}

- (void)sureBtnClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(pickerView:getOneCloumResult:twoColumResult:threeColumResult:)]) {
        [self.delegate pickerView:self getOneCloumResult:self.selectedOneColum twoColumResult:self.selectedTwoColum threeColumResult:self.selectedThreeColum];
    }
    [self dismiss];
}


@end
