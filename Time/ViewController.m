//
//  ViewController.m
//  Time
//
//  Created by 孙传俊 on 2018/10/9.
//  Copyright © 2018 孙传俊. All rights reserved.
//

#import "ViewController.h"

#import "CJTime/CJTime.h"

@interface ViewController ()

@end

@implementation ViewController


#pragma mark - --------------生命周期--------------
- (void)viewDidLoad {
    [super viewDidLoad];
    [self somePrepare];
}

#pragma mark - --------------SomePrepare--------------


#pragma mark - SomePrepare
-(void)somePrepare{
    // 全局设置
    // 数据初始化
    [self prepareData];
    // UI初始化
    [self prepareUI];
    // 网络数据请求 (放在ui后)
    [self netWorkData];
}

-(void)prepareData{
//                                           2018-11-09
    NSLog(@"%@", [CJTime distanceNowDate:@"2011-11-09 16:14:00" formatType:kFormatType1]);

    NSLog(@"%ld", (long)[CJTime distanceToday:@"2011-10-01" formatType:kFormatType2]);

}

-(void)prepareUI{
    // 全局设置
    // 子控件设置
    [self configSubView];
}

- (void)netWorkData{

}

#pragma mark - --------------系统代理----------------------


#pragma mark - --------------自定义代理----------------------


#pragma mark - --------------自定义响应----------------------


#pragma mark - --------------自定义方法----------------------


#pragma mark - --------------get/set----------------------


#pragma mark - --------------UI----------------------
// 创建子控件
- (void)configSubView{
    self.view.backgroundColor = [UIColor colorWithRed:0.12 green:0.12 blue:0.14 alpha:1];
}


#pragma mark - --------------懒加载----------------------


#pragma mark - --------------other----------------------

- (void)dealloc{
}


@end
