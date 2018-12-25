//
//  CJTime.m
//  Time
//
//  Created by 孙传俊 on 2018/10/9.
//  Copyright © 2018 孙传俊. All rights reserved.
//

#import "CJTime.h"

@implementation CJTime

#pragma mark - z提供的数组
+ (NSArray *)chineseYears{
    return @[@"甲子鼠年", @"乙丑牛年", @"丙寅虎年", @"丁卯兔年", @"戊辰龙年", @"己巳蛇年", @"庚午马年", @"辛未羊年", @"壬申猴年", @"癸酉鸡年",
             @"甲戌狗年", @"乙亥猪年", @"丙子鼠年", @"丁丑牛年", @"戊寅虎年", @"己卯兔年", @"庚辰龙年", @"辛己蛇年", @"壬午马年", @"癸未羊年",
             @"甲申猴年", @"乙酉鸡年", @"丙戌狗年", @"丁亥猪年", @"戊子鼠年", @"己丑牛年", @"庚寅虎年", @"辛卯兔年", @"壬辰龙年", @"癸巳蛇年",
             @"甲午马年", @"乙未羊年", @"丙申猴年", @"丁酉鸡年", @"戊戌狗年", @"己亥猪年", @"庚子鼠年", @"辛丑牛年", @"壬寅虎年", @"癸卯兔年",
             @"甲辰龙年", @"乙巳蛇年", @"丙午马年", @"丁未羊年", @"戊申猴年", @"己酉鸡年", @"庚戌狗年", @"辛亥猪年", @"壬子鼠年", @"癸丑牛年",
             @"甲寅虎年", @"乙卯兔年", @"丙辰龙年", @"丁巳蛇年", @"戊午马年", @"己未羊年", @"庚申猴年", @"辛酉鸡年", @"壬戌狗年", @"癸亥猪年"];
}

+ (NSArray *)chineseMonth{
    return @[@"正月", @"二月", @"三月", @"四月",
             @"五月", @"六月", @"七月", @"八月",
             @"九月", @"十月", @"冬月", @"腊月"];
}

+ (NSArray *)chineseDay{
    // 廿代表二十，所以二十这天要写成二十，而不是廿十，不然就代表了二十十了。
    return @[@"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
             @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
             @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十"];
}

+ (NSArray *)weekday{
    return @[@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六"];
}

#pragma mark - 处理函数

/**
 格式化

 @return 格式化
 */
+ (NSDateFormatter *)format{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setTimeZone:[NSTimeZone timeZoneWithName:[CJTimeConfig shareInstance].zoomName]];
    [format setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:[CJTimeConfig shareInstance].calendarId]];

    return format;
}


/**
 日历

 @return 日历对象
 */
+ (NSCalendar *)calendar{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:[CJTimeConfig shareInstance].calendarId];
    [calendar setTimeZone:[NSTimeZone timeZoneWithName:[CJTimeConfig shareInstance].zoomName]];
    [calendar setLocale:[[NSLocale alloc] initWithLocaleIdentifier:[CJTimeConfig shareInstance].localeId]];
    return calendar;
}

/**
 转换推算

 @param format format
 @param string 要转换的字符串
 @return 转换后的结果
 */
+ (NSDate *)dateWithFormat:(NSDateFormatter *)format date:(NSString *)string{
    int i = 0;
    NSDate *date;
    while (!(date = [format dateFromString:string])) {
        NSArray *list = [CJTimeConfig shareInstance].formatList;
        if (i >= list.count) {
            return nil;
        }
        [format setDateFormat: list[i]];
        i++;
    }
    return date;
}

#pragma mark - 提供的接口

/**
 设置自动推算列表，不设置默认上面的类型和顺序，设置一次即可，多次设置以最后一次为准

 @param formatList 类型列表
 */

+ (void)configAutoGuessFormat:(NSArray <NSString *>*)formatList{
    [CJTimeConfig shareInstance].formatList = formatList;
}

#pragma mark - 获取当前日期

#pragma mark - 转换操作

/**
 字符串转时间

 @param string 时间字符串
 @param type 转换类型
 @return 时间对象
 */
+ (NSDate *)stringToDate:(NSString *)string format:(NSString *)type{
    NSDateFormatter *format = [self format];
    [format setDateFormat:type];
    return [self dateWithFormat:format date:string];
}

/**
 时间转字符串

 @param date 时间对象
 @param type 字符串格式类型
 @return 字符串对象
 */
+ (NSString *)dateToString:(NSDate *)date format:(NSString *)type{
    NSDateFormatter *format = [self format];
    [format setDateFormat:type];
    return [format stringFromDate:date];
}

/**
 字符串转字符串 -- 格式化成另一种样式

 @param string 需要格式化的字符串
 @param fromType 需要格式化的字符串类型
 @param toType 转换成的类型
 @return 转换结果
 */
+ (NSString *)changeString:(NSString *)string fromFormat:(NSString *)fromType toFormat:(NSString *)toType{
    NSDate *date = [self stringToDate:string format:fromType];

    if (!date) {
        return string;
    }

    return [self dateToString:date format:toType];
}


#pragma mark - 获取今日时间分解属性
/**
 获取当前年月日时分秒
 @return [2018, 2, 3, 13, 34, 54] = [年, 月, 日, 时, 分, 秒]
 */
+ (NSArray *)getNow{
    return [self getArrayWithDate:[NSDate date]];
}

#pragma mark - 根据时间分解属性

/**
 获取年月日时分秒, 时区为config配置
 @return [2018, 4, 4, 13, 34, 54] = [年, 月, 日, 时, 分, 秒]
 */
+ (NSArray *)getArrayWithDate:(NSDate *)date{
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;

    NSDateComponents *dateComponent = [[self calendar] components:unitFlags fromDate:date];
    NSInteger year = [dateComponent year];
    NSInteger month =  [dateComponent month];
    NSInteger day = [dateComponent day];
    NSInteger hour =  [dateComponent hour];
    NSInteger minute =  [dateComponent minute];
    NSInteger second = [dateComponent second];

    return @[@(year), @(month), @(day), @(hour), @(minute), @(second)];
}

#pragma mark - 根据时间字符串分解属性

/**
 获取年月日时分秒, 时区为config配置
 @return [2018, 4, 4, 13, 34, 54] = [年, 月, 日, 时, 分, 秒]
 */
+ (NSArray *)getArrayWithString:(NSString *)string format:(NSString *)type{
    NSDate *date = [self stringToDate:string format:type];
    if (!date) {
        return @[@0, @0, @0, @0, @0, @0];
    }

    return [self getArrayWithDate:date];
}

/**
 根据时间或年月获取这个月有多少天

 @param year 年
 @param month 月
 @return 28 | 29 | 30 | 31
 */
+ (NSInteger)getDayCountWithYear:(NSString *)year Month:(NSString *)month{
    NSDate *date = [self stringToDate:[NSString stringWithFormat:@"%@-%@-01", year, month] format:kFormatType2];
    return [self getDayCountWithDate:date];
}

+ (NSInteger)getDayCountWithDate:(NSDate *)date{
    NSRange range = [[self calendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return range.length;
}

+ (NSInteger)getDayCountWithDate:(NSString *)date formatType:(NSString *)type{
    NSDate *dates = [self stringToDate:date format:type];
    return [self getDayCountWithDate:dates];
}

/**
 根据时间返回是周几

 @param date 时间
 @return 0-周日 or 1－周一 or 2－周二 or 3－周三 or 4－周四 or 5－周五 or 6－周六
 */
+ (NSInteger)getWeekdayWithDate:(NSDate *)date{
    NSCalendar *calendar = [self calendar];
    NSDateComponents *comps = [calendar components:NSCalendarUnitWeekOfMonth|NSCalendarUnitWeekday fromDate:date];
    return comps.weekday - 1;
}

+ (NSInteger)getWeekdayWithString:(NSString *)date formatType:(NSString *)type{
    NSDate *time = [self stringToDate:date format:type];
    return [self getWeekdayWithDate:time];
}


/**
 返回该日期所在月有几个周

 @param date 时间
 @return 4 | 5 | 6
 */
+ (NSInteger)weekCountWithDate:(NSDate *)date{

    // 这个月有多少天
    NSInteger dayNumber = [self getDayCountWithDate:date];
    // 获取这一天是周几
    NSInteger weekday = [self getWeekdayWithDate:date];

    NSInteger weeks = 0;

    if (weekday) {
        weeks += 1;
        dayNumber -= (7-weekday);
    }
    weeks += dayNumber/7;
    weeks += dayNumber % 7? 1: 0;

    return weeks;
}

+ (NSInteger)weekCountWithDate:(NSString *)date formatType:(NSString *)type{
    NSDate *time = [self stringToDate:date format:type];
    return [self weekCountWithDate:time];
}


/**
 距离今天过了多少年

 @param date 时间
 @return 距离的年，1代表去年，2代表前年 以此类推
 */
+ (NSArray *)distanceNowDate:(NSDate *)date{
    NSCalendar *calendar = [self calendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *result = [calendar components:unitFlags fromDate:date toDate:[NSDate date] options:NSCalendarWrapComponents];
    return @[@(result.year), @(result.month), @(result.day), @(result.hour), @(result.minute), @(result.second)];
}

+ (NSArray *)distanceNowDate:(NSString *)date formatType:(NSString *)type{
    NSDate *time = [self stringToDate:date format:type];
    return [self distanceNowDate:time];
}


/**
 距离今天过了多少年
 比较年

 @param date 时间
 @return 距离的年
 */
+ (NSInteger)distanceYearDate:(NSDate *)date{
    NSCalendar *calendar = [self calendar];
    NSDateComponents *result = [calendar components:NSCalendarUnitYear fromDate:date toDate:[NSDate date] options:NSCalendarWrapComponents];
    return result.year;
}
+ (NSInteger)distanceYearDate:(NSString *)date formatType:(NSString *)type{
    NSDate *time = [self stringToDate:date format:type];
    return [self distanceYearDate:time];
}

/**
 距离今天过了多少月
 比较月
 @param date 时间
 @return 距离的天数，1代表昨天，2代表前天 以此类推
 */
+ (NSInteger)distanceMonthDate:(NSDate *)date{
    NSCalendar *calendar = [self calendar];
    NSDateComponents *result = [calendar components:NSCalendarUnitMonth fromDate:date toDate:[NSDate date] options:NSCalendarWrapComponents];
    return result.month;
}
+ (NSInteger)distanceMonthDate:(NSString *)date formatType:(NSString *)type{
    NSDate *time = [self stringToDate:date format:type];
    return [self distanceMonthDate:time];
}


/**
 距离今天过了多少天

 @param date 时间
 @return 距离的天数，1代表昨天，2代表前天 以此类推
 */
+ (NSInteger)distanceToday:(NSDate *)date{
    NSCalendar *calendar = [self calendar];
    NSDateComponents *result = [calendar components:NSCalendarUnitDay fromDate:date toDate:[NSDate date] options:NSCalendarWrapComponents];
    return result.day;
}
+ (NSInteger)distanceToday:(NSString *)date formatType:(NSString *)type{
    NSDate *time = [self stringToDate:date format:type];
    return [self distanceToday:time];
}


/**
 距离现在过了多少小时

 @param date 时间
 @return 多少个小时
 */
+ (NSInteger)distanceHoursDate:(NSDate *)date{
    NSCalendar *calendar = [self calendar];
    NSDateComponents *result = [calendar components:NSCalendarUnitHour fromDate:date toDate:[NSDate date] options:NSCalendarWrapComponents];
    return result.hour;
}
+ (NSInteger)distanceHoursDate:(NSString *)date formatType:(NSString *)type{
    NSDate *time = [self stringToDate:date format:type];
    return [self distanceHoursDate:time];
}

/**
 距离现在过了多少分钟

 @param date 时间
 @return 多少分钟
 */
+ (NSInteger)distanceMinuteDate:(NSDate *)date{
    NSCalendar *calendar = [self calendar];
    NSDateComponents *result = [calendar components:NSCalendarUnitMinute fromDate:date toDate:[NSDate date] options:NSCalendarWrapComponents];
    return result.minute;
}
+ (NSInteger)distanceMinuteDate:(NSString *)date formatType:(NSString *)type{
    NSDate *time = [self stringToDate:date format:type];
    return [self distanceMinuteDate:time];
}

/**
 距离现在过了多少秒

 @param date 时间
 @return 多少秒
 */
+ (NSInteger)distanceSecondDate:(NSDate *)date{
    NSCalendar *calendar = [self calendar];
    NSDateComponents *result = [calendar components:NSCalendarUnitSecond fromDate:date toDate:[NSDate date] options:NSCalendarWrapComponents];
    return result.second;
}
+ (NSInteger)distanceSecondDate:(NSString *)date formatType:(NSString *)type{
    NSDate *time = [self stringToDate:date format:type];
    return [self distanceSecondDate:time];
}


/**
 获得两个时间的年数差

 @param date 时间
 @return 多少秒
 */
+ (NSInteger)distanceYearDate:(NSDate *)date nextDate:(NSDate *)nextDate{
    NSCalendar *calendar = [self calendar];
    NSDateComponents *result = [calendar components:NSCalendarUnitYear fromDate:date toDate:nextDate options:NSCalendarWrapComponents];
    return result.year;
}
+ (NSInteger)distanceYearDate:(NSString *)date dateFormat:(NSString *)dateFormat nextDate:(NSString *)nextDate nextDateFormat:(NSString *)nextDateFormat{
    NSDate *time = [self stringToDate:date format:dateFormat];
    NSDate *nextTime = [self stringToDate:nextDate format:nextDateFormat];

    return [self distanceYearDate:time nextDate:nextTime];
}

/**
 获得两个时间的月数差

 @param date 时间
 @return 多少秒
 */
+ (NSInteger)distanceMonthDate:(NSDate *)date nextDate:(NSDate *)nextDate{
    NSCalendar *calendar = [self calendar];
    NSDateComponents *result = [calendar components:NSCalendarUnitMonth fromDate:date toDate:nextDate options:NSCalendarWrapComponents];
    return result.month;
}
+ (NSInteger)distanceDate:(NSString *)date dateFormat:(NSString *)dateFormat nextDate:(NSString *)nextDate nextDateFormat:(NSString *)nextDateFormat{
    NSDate *time = [self stringToDate:date format:dateFormat];
    NSDate *nextTime = [self stringToDate:nextDate format:nextDateFormat];

    return [self distanceMonthDate:time nextDate:nextTime];
}

/**
 获得两个时间的日数差

 @param date 时间
 @return 多少秒
 */
+ (NSInteger)distanceDayDate:(NSDate *)date nextDate:(NSDate *)nextDate{
    NSCalendar *calendar = [self calendar];
    NSDateComponents *result = [calendar components:NSCalendarUnitDay fromDate:date toDate:nextDate options:NSCalendarWrapComponents];
    return result.day;
}
+ (NSInteger)distanceDayDate:(NSString *)date dateFormat:(NSString *)dateFormat nextDate:(NSString *)nextDate nextDateFormat:(NSString *)nextDateFormat{

    NSDate *time = [self stringToDate:date format:dateFormat];
    NSDate *nextTime = [self stringToDate:nextDate format:nextDateFormat];

    return [self distanceDayDate:time nextDate:nextTime];
}

/**
 获得两个时间的时数差

 @param date 时间
 @return 多少秒
 */
+ (NSInteger)distanceHourDate:(NSDate *)date nextDate:(NSDate *)nextDate{
    NSCalendar *calendar = [self calendar];
    NSDateComponents *result = [calendar components:NSCalendarUnitHour fromDate:date toDate:nextDate options:NSCalendarWrapComponents];
    return result.hour;
}
+ (NSInteger)distanceHourDate:(NSString *)date dateFormat:(NSString *)dateFormat nextDate:(NSString *)nextDate nextDateFormat:(NSString *)nextDateFormat{
    NSDate *time = [self stringToDate:date format:dateFormat];
    NSDate *nextTime = [self stringToDate:nextDate format:nextDateFormat];

    return [self distanceHourDate:time nextDate:nextTime];
}

/**
 获得两个时间的分钟差

 @param date 时间
 @return 多少分
 */
+ (NSInteger)distanceMinuteDate:(NSDate *)date nextDate:(NSDate *)nextDate{
    NSCalendar *calendar = [self calendar];
    NSDateComponents *result = [calendar components:NSCalendarUnitMinute fromDate:date toDate:nextDate options:NSCalendarWrapComponents];
    return result.minute;
}
+ (NSInteger)distanceMinuteDate:(NSString *)date dateFormat:(NSString *)dateFormat nextDate:(NSString *)nextDate nextDateFormat:(NSString *)nextDateFormat{
    NSDate *time = [self stringToDate:date format:dateFormat];
    NSDate *nextTime = [self stringToDate:nextDate format:nextDateFormat];

    return [self distanceMinuteDate:time nextDate:nextTime];
}


/**
 获得两个时间的秒数差

 @param date 时间
 @return 多少秒
 */
+ (NSInteger)distanceSecondDate:(NSDate *)date nextDate:(NSDate *)nextDate{
    NSCalendar *calendar = [self calendar];
    NSDateComponents *result = [calendar components:NSCalendarUnitSecond fromDate:date toDate:nextDate options:NSCalendarWrapComponents];
    return result.second;
}

+ (NSInteger)distanceSecondDate:(NSString *)date dateFormat:(NSString *)dateFormat nextDate:(NSString *)nextDate nextDateFormat:(NSString *)nextDateFormat{
    NSDate *time = [self stringToDate:date format:dateFormat];
    NSDate *nextTime = [self stringToDate:nextDate format:nextDateFormat];

    return [self distanceSecondDate:time nextDate:nextTime];
}


/**
 在当前的基础上加上x年

 @param date 基础时间
 @param year 年数
 @return 加上后的时间
 */
+ (NSDate *)dateAddYear:(NSDate *)date year:(NSInteger)year{
    NSCalendar *calendar = [self calendar];
    return [calendar dateByAddingUnit:NSCalendarUnitYear value:year toDate:date options:NSCalendarWrapComponents];
}

+ (NSDate *)dateAddYear:(NSString *)date format:(NSString *)type year:(NSInteger)year{
    NSDate *time = [self stringToDate:date format:type];
    return [self dateAddYear:time year:year];
}

/**
 在当前的基础上加上x月

 @param date 基础时间
 @param month 月数
 @return 加上后的时间
 */
+ (NSDate *)dateAddMonth:(NSDate *)date month:(NSInteger)month{
    NSCalendar *calendar = [self calendar];
    return [calendar dateByAddingUnit:NSCalendarUnitMonth value:month toDate:date options:NSCalendarWrapComponents];
}

+ (NSDate *)dateAddMonth:(NSString *)date format:(NSString *)type month:(NSInteger)month{
    NSDate *time = [self stringToDate:date format:type];
    return [self dateAddMonth:time month:month];
}

/**
 在当前的基础上加上x日

 @param date 基础时间
 @param day 日数
 @return 加上后的时间
 */
+ (NSDate *)dateAddDay:(NSDate *)date day:(NSInteger)day{
    NSCalendar *calendar = [self calendar];
    return [calendar dateByAddingUnit:NSCalendarUnitDay value:day toDate:date options:NSCalendarWrapComponents];
}

+ (NSDate *)dateAddDay:(NSString *)date format:(NSString *)type day:(NSInteger)day{
    NSDate *time = [self stringToDate:date format:type];
    return [self dateAddDay:time day:day];
}

/**
 在当前的基础上加上x小时

 @param date 基础时间
 @param hour 小时数
 @return 加上后的时间
 */
+ (NSDate *)dateAddHour:(NSDate *)date hour:(NSInteger)hour{
    NSCalendar *calendar = [self calendar];
    return [calendar dateByAddingUnit:NSCalendarUnitHour value:hour toDate:date options:NSCalendarWrapComponents];
}

+ (NSDate *)dateAddHour:(NSString *)date format:(NSString *)type hour:(NSInteger)hour{
    NSDate *time = [self stringToDate:date format:type];
    return [self dateAddHour:time hour:hour];
}

/**
 在当前的基础上加上x分钟

 @param date 基础时间
 @param minute 分钟数
 @return 加上后的时间
 */
+ (NSDate *)dateAddMinute:(NSDate *)date minute:(NSInteger)minute{
    NSCalendar *calendar = [self calendar];
    return [calendar dateByAddingUnit:NSCalendarUnitMinute value:minute toDate:date options:NSCalendarWrapComponents];
}

+ (NSDate *)dateAddMinute:(NSString *)date format:(NSString *)type minute:(NSInteger)minute{
    NSDate *time = [self stringToDate:date format:type];
    return [self dateAddMinute:time minute:minute];
}

/**
 在当前的基础上加上x秒

 @param date 基础时间
 @param second 秒钟数
 @return 加上后的时间
 */
+ (NSDate *)dateAddSecond:(NSDate *)date second:(NSInteger)second{
    NSCalendar *calendar = [self calendar];
    return [calendar dateByAddingUnit:NSCalendarUnitSecond value:second toDate:date options:NSCalendarWrapComponents];
}

+ (NSDate *)dateAddSecond:(NSString *)date format:(NSString *)type second:(NSInteger)second{
    NSDate *time = [self stringToDate:date format:type];
    return [self dateAddSecond:time second:second];
}

/**
 两个时间比较大小
 */
+ (NSDate *)compareDate:(NSDate *)date andDate:(NSDate *)date2 bigDate:(BOOL)bigDate{
    if (bigDate) {
        return [date laterDate:date2];
    }else{
        return [date earlierDate:date2];
    }
}

// dateFormat, andDateFormat kFormatType1这种
+ (NSDate *)compareDate:(NSString *)date dateFormat:(NSString *)dateFormat andDate:(NSString *)date2 andDateFormat:(NSString *)andDateFormat bigDate:(BOOL)bigDate{
    NSDate *time = [self stringToDate:date format:dateFormat];
    NSDate *nextTime = [self stringToDate:date2 format:andDateFormat];
    return [self compareDate:time andDate:nextTime bigDate:bigDate];
}

/**
 第一个时间与第二个时间的大小关系，date > date2 return true
 */
+ (NSInteger)compareDate:(NSDate *)date andDate:(NSDate *)date2{
    return [date compare:date2];
}
// dateFormat, andDateFormat kFormatType1这种
+ (NSInteger)compareDate:(NSString *)date dateFormat:(NSString *)dateFormat andDate:(NSString *)date2 andDateFormat:(NSString *)andDateFormat{
    NSDate *time = [self stringToDate:date format:dateFormat];
    NSDate *nextTime = [self stringToDate:date2 format:andDateFormat];
    return [self compareDate:time andDate:nextTime];
}



@end
