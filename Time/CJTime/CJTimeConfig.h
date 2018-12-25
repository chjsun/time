//
//  CJTimeConfig.h
//  Time
//
//  Created by 孙传俊 on 2018/10/9.
//  Copyright © 2018 孙传俊. All rights reserved.
// 全局配置。

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 本类包含自动推算转换类型，自动推算会在未指定明确的转换类型或者指定后无法转换成功时启动
 但是不保证正确率，只是作为一种预防措施。例如1月2日可能会推断出2月1日
 自动推断全部为24小时制 （"HH"代表24小时制, "hh"代表12小时制）
 建议开发者自己明确指定转换类型
 下方为默认自动推算的类型，包含大部分的常用类型，按顺序推算
 开发者也可以自己指定推算的类型和顺序
 */

static NSString * const kFormatType1 = @"yyyy-MM-dd HH:mm:ss";
static NSString * const kFormatType2 = @"yyyy-MM-dd";
static NSString * const kFormatType3 = @"yyyy/MM/dd HH:mm:ss";
static NSString * const kFormatType4 = @"yyyy/MM/dd";
static NSString * const kFormatType5 = @"yyyy.MM.dd HH:mm:ss";
static NSString * const kFormatType6 = @"yyyy.MM.dd";
static NSString * const kFormatType7 = @"MM-dd-yyyy HH:mm:ss";
static NSString * const kFormatType8 = @"MM-dd-yyyy";
static NSString * const kFormatType9 = @"MM/dd/yyyy HH:mm:ss";
static NSString * const kFormatType10 = @"MM/dd/yyyy";
static NSString * const kFormatType11 = @"MM.dd.yyyy HH:mm:ss";
static NSString * const kFormatType12 = @"MM.dd.yyyy";
static NSString * const kFormatType13 = @"dd-MM-yyyy HH:mm:ss";
static NSString * const kFormatType14 = @"dd-MM-yyyy";
static NSString * const kFormatType15 = @"dd/MM/yyyy HH:mm:ss";
static NSString * const kFormatType16 = @"dd/MM/yyyy";
static NSString * const kFormatType17 = @"dd.MM.yyyy HH:mm:ss";
static NSString * const kFormatType18 = @"dd.MM.yyyy";
static NSString * const kFormatType19 = @"yyyyMMdd HH:mm:ss";
static NSString * const kFormatType20 = @"yyyyMMdd";
static NSString * const kFormatType21 = @"MMddyyyy HH:mm:ss";
static NSString * const kFormatType22 = @"MMddyyyy";
static NSString * const kFormatType23 = @"ddMMyyyy HH:mm:ss";
static NSString * const kFormatType24 = @"ddMMyyyy";
static NSString * const kFormatType25 = @"yyyy_MM_dd HH:mm:ss";
static NSString * const kFormatType26 = @"yyyy_MM_dd";
static NSString * const kFormatType27 = @"MM_dd_yyyy HH:mm:ss";
static NSString * const kFormatType28 = @"MM_dd_yyyy";
static NSString * const kFormatType29 = @"dd_MM_yyyy HH:mm:ss";
static NSString * const kFormatType30 = @"dd_MM_yyyy";
static NSString * const kFormatType31 = @"yyyy·MM·dd HH:mm:ss";
static NSString * const kFormatType32 = @"yyyy·MM·dd";
static NSString * const kFormatType33 = @"MM·dd·yyyy HH:mm:ss";
static NSString * const kFormatType34 = @"MM·dd·yyyy";
static NSString * const kFormatType35 = @"dd·MM·yyyy HH:mm:ss";
static NSString * const kFormatType36 = @"dd·MM·yyyy";
static NSString * const kFormatType37 = @"yyyy MM dd HH:mm:ss";
static NSString * const kFormatType38 = @"yyyy MM dd";
static NSString * const kFormatType39 = @"MM dd yyyy HH:mm:ss";
static NSString * const kFormatType40 = @"MM dd yyyy";
static NSString * const kFormatType41 = @"dd MM yyyy HH:mm:ss";
static NSString * const kFormatType42 = @"dd MM yyyy";
static NSString * const kFormatType43 = @"yyyy年MM月dd日 HH时mm分ss秒";
static NSString * const kFormatType44 = @"yyyy年MM月dd日 HH:mm:ss";
static NSString * const kFormatType45 = @"yyyy年MM月dd日";
static NSString * const kFormatType46 = @"yyyy年MM月dd";
static NSString * const kFormatType47 = @"MM月dd日yyyy年";


@interface CJTimeConfig : NSObject

/** 初始化方法，配置时请使用这个函数初始化，否则全局定义无效 */
+ (instancetype)shareInstance;

/** 指定日历的算法
 NSCalendarIdentifierGregorian         公历
 NSCalendarIdentifierBuddhist          佛教日历
 NSCalendarIdentifierChinese           中国农历
 NSCalendarIdentifierHebrew            希伯来日历
 NSCalendarIdentifierIslamic           伊斯兰日历
 NSCalendarIdentifierIslamicCivil      伊斯兰教日历
 NSCalendarIdentifierJapanese          日本日历
 NSCalendarIdentifierRepublicOfChina   中华民国日历（台湾）
 NSCalendarIdentifierPersian           波斯历
 NSCalendarIdentifierIndian            印度日历
 NSCalendarIdentifierISO8601           ISO8601
 默认公历
 */
@property(nonatomic, copy) NSString *calendarId;

/** 设置时区

 默认与系统时区一致
 */
@property(nonatomic, copy) NSString *zoomName;

/** 本地化设置

 默认 currentLocale 本地的
    中国设置 zh_CN
 */
@property(nonatomic, copy) NSString *localeId;

/**
 设置自动推算时间格式的列表，不设置默认上面的类型和顺序，设置一次即可，多次设置以最后一次为准
 */

@property(nonatomic, strong) NSArray *formatList;


@end

NS_ASSUME_NONNULL_END
