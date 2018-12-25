//
//  CJTimeConfig.m
//  Time
//
//  Created by 孙传俊 on 2018/10/9.
//  Copyright © 2018 孙传俊. All rights reserved.
//

#import "CJTimeConfig.h"


@implementation CJTimeConfig

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    static CJTimeConfig *config;
    dispatch_once(&onceToken, ^{
        config = [[CJTimeConfig alloc] init];

        // 默认为公历
        config.calendarId = NSCalendarIdentifierGregorian;

        // 获取默认时区
        NSTimeZone *zone = [NSTimeZone systemTimeZone];
        config.zoomName = [zone name];

        NSLocale *local = [NSLocale currentLocale];
        config.localeId = local.localeIdentifier;

        config.formatList = @[@"yyyy-MM-dd HH:mm:ss",
                              @"yyyy-MM-dd",
                              @"yyyy/MM/dd HH:mm:ss",
                              @"yyyy/MM/dd",
                              @"yyyy.MM.dd HH:mm:ss",
                              @"yyyy.MM.dd",
                              @"MM-dd-yyyy HH:mm:ss",
                              @"MM-dd-yyyy",
                              @"MM/dd/yyyy HH:mm:ss",
                              @"MM/dd/yyyy",
                              @"MM.dd.yyyy HH:mm:ss",
                              @"MM.dd.yyyy",
                              @"dd-MM-yyyy HH:mm:ss",
                              @"dd-MM-yyyy",
                              @"dd/MM/yyyy HH:mm:ss",
                              @"dd/MM/yyyy",
                              @"dd.MM.yyyy HH:mm:ss",
                              @"dd.MM.yyyy",
                              @"yyyyMMdd HH:mm:ss",
                              @"yyyyMMdd",
                              @"MMddyyyy HH:mm:ss",
                              @"MMddyyyy",
                              @"ddMMyyyy HH:mm:ss",
                              @"ddMMyyyy",
                              @"yyyy_MM_dd HH:mm:ss",
                              @"yyyy_MM_dd",
                              @"MM_dd_yyyy HH:mm:ss",
                              @"MM_dd_yyyy",
                              @"dd_MM_yyyy HH:mm:ss",
                              @"dd_MM_yyyy",
                              @"yyyy·MM·dd HH:mm:ss",
                              @"yyyy·MM·dd",
                              @"MM·dd·yyyy HH:mm:ss",
                              @"MM·dd·yyyy",
                              @"dd·MM·yyyy HH:mm:ss",
                              @"dd·MM·yyyy",
                              @"yyyy MM dd HH:mm:ss",
                              @"yyyy MM dd",
                              @"MM dd yyyy HH:mm:ss",
                              @"MM dd yyyy",
                              @"dd MM yyyy HH:mm:ss",
                              @"dd MM yyyy",
                              @"yyyy年MM月dd日 HH时mm分ss秒",
                              @"yyyy年MM月dd日 HH:mm:ss",
                              @"yyyy年MM月dd日",
                              @"yyyy年MM月dd",
                              @"MM月dd日yyyy年"];
    });
    return config;
}



@end
