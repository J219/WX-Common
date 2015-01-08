//
//  DTDesignView.m
//  DemoTest
//
//  Created by WangXun on 15/1/7.
//  Copyright (c) 2015年 WangXun. All rights reserved.
//

#import "WXNibDesignAbsView.h"
#import <objc/runtime.h>

@interface WXNibDesignAbsView()

@end

@implementation WXNibDesignAbsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupFromNib];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupFromNib];
    }
    return self;
}


- (void)setupFromNib
{
    UIView *aView = [self loadViewFromNib];
    if (aView) {
        aView.frame = self.bounds;
        aView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:aView];
    }
}

- (UIView *)loadViewFromNib
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UIView *view = nil;
    if (bundle) {
        NSArray *nibArray = [bundle loadNibNamed:[self nibFileName] owner:self options:nil];
        if (nibArray) {
            view = nibArray.firstObject;
        }
    }
    return view;
}

- (NSString *)nibFileName
{
    NSString *className = [NSString stringWithCString:object_getClassName(self)encoding:NSUTF8StringEncoding];
    return className;
}

@end
