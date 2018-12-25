//
//  CJTime.h
//  Time
//
//  Created by 孙传俊 on 2018/10/9.
//  Copyright © 2018 孙传俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJTimeConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface CJTime : NSObject

#pragma mark - 设置 -- 全局设置

/**
 设置自动推算列表，不设置默认上面的类型和顺序，设置一次即可，多次设置以最后一次为准

 @param formatList 类型列表
 */

+ (void)configAutoGuessFormat:(NSArray <NSString *>*)formatList;

#pragma mark - 防止方法不全，吧转换暴漏出来
+ (NSDateFormatter *)format;
+ (NSCalendar *)calendar;

#pragma mark - 提供一些数组方便使用

/**
 中国的农历代表的y年份

 @return 年的称呼 60年一循环
 */
+ (NSArray *)chineseYears;

/**
 中国的月份

 @return 月的称呼
 */
+ (NSArray *)chineseMonth;
/**
 中国的日子

 @return 每天的称呼
 */
+ (NSArray *)chineseDay;

+ (NSArray *)weekday;


#pragma mark - 获取当前日期

#pragma mark - 转换操作

/**
 字符串转时间

 @param string 时间字符串
 @param type 转换类型
 @return 时间对象
 */
+ (NSDate *)stringToDate:(NSString *)string format:(NSString *)type;

/**
 时间转字符串

 @param date 时间对象
 @param type 字符串格式类型
 @return 字符串对象
 */
+ (NSString *)dateToString:(NSDate *)date format:(NSString *)type;

/**
 字符串转字符串 -- 格式化成另一种样式

 @param string 需要格式化的字符串
 @param fromType 需要格式化的字符串类型
 @param toType 转换成的类型
 @return 转换结果
 */
+ (NSString *)changeString:(NSString *)string fromFormat:(NSString *)fromType toFormat:(NSString *)toType;


#pragma mark - 获取今日时间分解属性
/**
 获取当前年月日时分秒

 @return [2018, 2, 3, 13, 34, 54] = [年, 月, 日, 时, 分, 秒]
 */
+ (NSArray *)getNow;

#pragma mark - 根据时间分解属性

/**
 获取年月日时分秒, 时区为config配置

 @param date 时间
 @return [2018, 4, 4, 13, 34, 54] = [年, 月, 日, 时, 分, 秒]
 */
+ (NSArray *)getArrayWithDate:(NSDate *)date;

#pragma mark - 根据时间字符串分解属性

/**
 获取年月日时分秒, 时区为config配置

 @param string 时间
 @param type kFormatType1这种
 @return [2018, 4, 4, 13, 34, 54] = [年, 月, 日, 时, 分, 秒]
 */
+ (NSArray *)getArrayWithString:(NSString *)string format:(NSString *)type;

/**
 根据时间或年月获取这个月有多少天

 @param year 年
 @param month 月
 @return 28 | 29 | 30 | 31
 */
+ (NSInteger)getDayCountWithYear:(NSString *)year Month:(NSString *)month;
+ (NSInteger)getDayCountWithDate:(NSDate *)date;
// format kFormatType1这种
+ (NSInteger)getDayCountWithDate:(NSString *)date formatType:(NSString *)type;

/**
 根据时间返回是周几

 @param date 时间
 @return 0-周日 or 1－周一 or 2－周二 or 3－周三 or 4－周四 or 5－周五 or 6－周六
 */
+ (NSInteger)getWeekdayWithDate:(NSDate *)date;
// format kFormatType1这种
+ (NSInteger)getWeekdayWithString:(NSString *)date formatType:(NSString *)type;


/**
 返回该日期所在月有几个周

 @param date 时间
 @return 4 | 5 | 6
 */
+ (NSInteger)weekCountWithDate:(NSDate *)date;
// format kFormatType1这种
+ (NSInteger)weekCountWithDate:(NSString *)date formatType:(NSString *)type;

/**
 距离现在过了多少时间(两个时间差)

 // 这个差值是完整的时间之间的差，
 例如
 2018-11-09 16:15:10
 2011-11-09 16:14:00
 返回 [7年, 0月, 0日, 0时, 1分, 10秒];
 @param date 时间
 @return [1,2,3,4,5,6] => [年, 月, 日, 时, 分, 秒]
 */
+ (NSArray *)distanceNowDate:(NSDate *)date;
// format kFormatType1这种
+ (NSArray *)distanceNowDate:(NSString *)date formatType:(NSString *)type;

/**
 距离今天过了多少年
 比较年

 @param date 时间
 @return 距离的年
 */
+ (NSInteger)distanceYearDate:(NSDate *)date;
// format kFormatType1这种
+ (NSInteger)distanceYearDate:(NSString *)date formatType:(NSString *)type;

/**
 距离今天过了多少月
 比较月
 @param date 时间
 @return 距离的天数，1代表昨天，2代表前天 以此类推
 */
+ (NSInteger)distanceMonthDate:(NSDate *)date;
// format kFormatType1这种
+ (NSInteger)distanceMonthDate:(NSString *)date formatType:(NSString *)type;

/**
 距离今天过了多少天

 @param date 时间
 @return 距离的天数，1代表昨天，2代表前天 以此类推
 */
+ (NSInteger)distanceToday:(NSDate *)date;
// format kFormatType1这种
+ (NSInteger)distanceToday:(NSString *)date formatType:(NSString *)type;


/**
 距离现在过了多少小时

 @param date 时间
 @return 多少个小时
 */
+ (NSInteger)distanceHoursDate:(NSDate *)date;
// format kFormatType1这种
+ (NSInteger)distanceHoursDate:(NSString *)date formatType:(NSString *)type;

/**
 距离现在过了多少分钟

 @param date 时间
 @return 多少分钟
 */
+ (NSInteger)distanceMinuteDate:(NSDate *)date;
// format kFormatType1这种
+ (NSInteger)distanceMinuteDate:(NSString *)date formatType:(NSString *)type;
/**
 距离现在过了多少秒

 @param date 时间
 @return 多少秒
 */
+ (NSInteger)distanceSecondDate:(NSDate *)date;
// format kFormatType1这种
+ (NSInteger)distanceSecondDate:(NSString *)date formatType:(NSString *)type;

/**
 获得两个时间的年数差

 @param date 时间
 @return 多少秒
 */
+ (NSInteger)distanceYearDate:(NSDate *)date nextDate:(NSDate *)nextDate;
// dateFormat kFormatType1这种 nextDateFormat kFormatType1这种
+ (NSInteger)distanceYearDate:(NSString *)date dateFormat:(NSString *)dateFormat nextDate:(NSString *)nextDate nextDateFormat:(NSString *)nextDateFormat;

/**
 获得两个时间的月数差

 @param date 时间
 @return 多少秒
 */
+ (NSInteger)distanceMonthDate:(NSDate *)date nextDate:(NSDate *)nextDate;
// dateFormat kFormatType1这种 nextDateFormat kFormatType1这种
+ (NSInteger)distanceDate:(NSString *)date dateFormat:(NSString *)dateFormat nextDate:(NSString *)nextDate nextDateFormat:(NSString *)nextDateFormat;

/**
 获得两个时间的日数差

 @param date 时间
 @return 多少秒
 */
+ (NSInteger)distanceDayDate:(NSDate *)date nextDate:(NSDate *)nextDate;
// dateFormat kFormatType1这种 nextDateFormat kFormatType1这种
+ (NSInteger)distanceDayDate:(NSString *)date dateFormat:(NSString *)dateFormat nextDate:(NSString *)nextDate nextDateFormat:(NSString *)nextDateFormat;

/**
 获得两个时间的时数差

 @param date 时间
 @return 多少秒
 */
+ (NSInteger)distanceHourDate:(NSDate *)date nextDate:(NSDate *)nextDate;
// dateFormat kFormatType1这种 nextDateFormat kFormatType1这种
+ (NSInteger)distanceHourDate:(NSString *)date dateFormat:(NSString *)dateFormat nextDate:(NSString *)nextDate nextDateFormat:(NSString *)nextDateFormat;

/**
 获得两个时间的分数差

 @param date 时间
 @return 多少秒
 */
+ (NSInteger)distanceMinuteDate:(NSDate *)date nextDate:(NSDate *)nextDate;
// dateFormat kFormatType1这种 nextDateFormat kFormatType1这种
+ (NSInteger)distanceMinuteDate:(NSString *)date dateFormat:(NSString *)dateFormat nextDate:(NSString *)nextDate nextDateFormat:(NSString *)nextDateFormat;


/**
 获得两个时间的秒数差

 @param date 时间
 @return 多少秒
 */
+ (NSInteger)distanceSecondDate:(NSDate *)date nextDate:(NSDate *)nextDate;
// format kFormatType1这种
+ (NSInteger)distanceSecondDate:(NSString *)date dateFormat:(NSString *)dateFormat nextDate:(NSString *)nextDate nextDateFormat:(NSString *)nextDateFormat;


/**
 在当前的基础上加上x年

 @param date 基础时间
 @param year 年数
 @return 加上后的时间
 */
+ (NSDate *)dateAddYear:(NSDate *)date year:(NSInteger)year;
// format kFormatType1这种
+ (NSDate *)dateAddYear:(NSString *)date format:(NSString *)type year:(NSInteger)year;

/**
 在当前的基础上加上x月

 @param date 基础时间
 @param month 月数
 @return 加上后的时间
 */
+ (NSDate *)dateAddMonth:(NSDate *)date month:(NSInteger)month;
// format kFormatType1这种
+ (NSDate *)dateAddMonth:(NSString *)date format:(NSString *)type month:(NSInteger)month;

/**
 在当前的基础上加上x日

 @param date 基础时间
 @param day 日数
 @return 加上后的时间
 */
+ (NSDate *)dateAddDay:(NSDate *)date day:(NSInteger)day;
// format kFormatType1这种
+ (NSDate *)dateAddDay:(NSString *)date format:(NSString *)type day:(NSInteger)day;

/**
 在当前的基础上加上x小时

 @param date 基础时间
 @param hour 小时数
 @return 加上后的时间
 */
+ (NSDate *)dateAddHour:(NSDate *)date hour:(NSInteger)hour;
// format kFormatType1这种
+ (NSDate *)dateAddHour:(NSString *)date format:(NSString *)type hour:(NSInteger)hour;

/**
 在当前的基础上加上x分钟

 @param date 基础时间
 @param minute 分钟数
 @return 加上后的时间
 */
+ (NSDate *)dateAddMinute:(NSDate *)date minute:(NSInteger)minute;
// format kFormatType1这种
+ (NSDate *)dateAddMinute:(NSString *)date format:(NSString *)type minute:(NSInteger)minute;

/**
 在当前的基础上加上x秒

 @param date 基础时间
 @param second 秒钟数
 @return 加上后的时间
 */
+ (NSDate *)dateAddSecond:(NSDate *)date second:(NSInteger)second;
// format kFormatType1这种
+ (NSDate *)dateAddSecond:(NSString *)date format:(NSString *)type second:(NSInteger)second;


/**
 两个时间比较大小，返回大/小的那个

 @param date 对象时间
 @param date2 参数时间
 @param bigDate 返回大的/小的
 @return 结果
 */
+ (NSDate *)compareDate:(NSDate *)date andDate:(NSDate *)date2 bigDate:(BOOL)bigDate;
// dateFormat, andDateFormat kFormatType1这种
+ (NSDate *)compareDate:(NSString *)date dateFormat:(NSString *)dateFormat andDate:(NSString *)date2 andDateFormat:(NSString *)andDateFormat bigDate:(BOOL)bigDate;

/**
 第一个时间与第二个时间的大小关系，如果相同，返回0；对象时间早于参数时间，返回-1；对象时间晚于参数时间，返回1

 @param date 对象时间
 @param date2 参数时间
 @return 结果
 */
+ (NSInteger)compareDate:(NSDate *)date andDate:(NSDate *)date2;
// dateFormat, andDateFormat kFormatType1这种
+ (NSInteger)compareDate:(NSString *)date dateFormat:(NSString *)dateFormat andDate:(NSString *)date2 andDateFormat:(NSString *)andDateFormat;



@end

NS_ASSUME_NONNULL_END
