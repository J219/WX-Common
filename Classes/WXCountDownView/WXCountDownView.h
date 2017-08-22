//
//  EHCountDownView.h
//  EHealth
//
//  Created by WangXun on 14/12/13.
//  Copyright (c) 2014年 focuschina. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^EHCountDownClickBlock)();

/**
 *  倒计时
 */
@interface WXCountDownView : UIView

/**
 *  剩余时间
 */
@property (nonatomic, readonly) NSTimeInterval restTime;

/// 可点击时的标题，默认为“获取验证码”
@property (nonatomic, copy) NSString *readyTitle;

/// 倒计时标题，在后面会拼接“60s”，默认为“获取验证码”
@property (nonatomic, copy) NSString *countDownTitle;

/// 回调
@property (nonatomic, copy) void (^countDownClickBlock)();

/**
 *  开始倒计时
 *
 *  @param maxTime 总时间
 */
- (void)startCountDownWithMax:(NSTimeInterval)maxTime;

@end
