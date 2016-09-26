//
//  ViewController.m
//  YZPickerViewThreeColum
//
//  Created by 何凯楠 on 16/8/23.
//  Copyright © 2016年 HeXiaoBa. All rights reserved.
//

#import "ViewController.h"
#import "KNPickerView.h"

@interface ViewController ()<KNPickerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 100, 20);
    label.center = self.view.center;
    label.text = @"点击屏幕";
    [self.view addSubview:label];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    KNPickerView *pickerView = [[KNPickerView alloc] init];
    pickerView.delegate = self;
    pickerView.oneContents = @[@"北京市", @"上海市", @"深圳市"];
    pickerView.twoContents = @[@"北京市", @"上海市", @"深圳市"];
    pickerView.threeContents = @[@"东城区", @"闵行区", @"南山区"];
    [pickerView show];
}

- (void)pickerView:(KNPickerView *)pickerView getOneCloumResult:(NSString *)oneColumResult twoColumResult:(NSString *)twoColumResult threeColumResult:(NSString *)threeColumResult {
    NSLog(@"%@ %@ %@", oneColumResult, twoColumResult, threeColumResult);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
