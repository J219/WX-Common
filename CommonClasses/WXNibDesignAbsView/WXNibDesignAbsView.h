//
//  DTDesignView.h
//  DemoTest
//
//  Created by WangXun on 15/1/7.
//  Copyright (c) 2015年 WangXun. All rights reserved.
//
//  参考了Morten Bøgh的代码：http://justabeech.com/2014/07/27/xcode-6-live-rendering-from-nib/

#import <UIKit/UIKit.h>

/**
 *  通过xib绘制view的基类，并且支持IB实时渲染，使用时需要创建一个继承于此类的子类
 *  注意：子类必须有对应的xib文件，否则会异常
 */
IB_DESIGNABLE
@interface WXNibDesignAbsView : UIView

/**
 *  重写此方法，返回该view的xib名称(不含".xib")，会自动取对应xib的fristObject，如果不重写此方法，则默认返回与类名相同的xib名
 *
 *  @return 对应xib的名称
 */
- (NSString *)nibFileName;

/**
 *  重写此方法，返回一个通过xib加载的View，如果重写了此方法，则nibFileName:方法会被忽略
 *
 *  @return UIView实例
 */
- (UIView *)loadViewFromNib;

@end
