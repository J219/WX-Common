//
//  EHAutoWidthLabel.m
//  EHealth
//
//  Created by WangXun on 14/12/8.
//  Copyright (c) 2014年 focuschina. All rights reserved.
//

#import "WXAutoWidthLabel.h"

//检查系统版本
#define IOS_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define IOS_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@implementation WXAutoWidthLabel

- (void)layoutSubviews
{
    self.preferredMaxLayoutWidth = self.frame.size.width;
    [super layoutSubviews];
}

-(void)dealloc
{
    if (IOS_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8")
        && IOS_VERSION_LESS_THAN(@"8.1")) {
        [ self removeObserver: self forKeyPath: @"layer.bounds" ];
    }
}

-(void)observeValueForKeyPath:( NSString* )keyPath
                     ofObject:( id )object
                       change:( NSDictionary* )change
                      context:( void* )context
{
    if([ keyPath isEqualToString: @"layer.bounds" ])
    {
        //layoutSubviews
        self.preferredMaxLayoutWidth = self.frame.size.width;
        [super layoutSubviews];
    }
    else
    {
        [ super observeValueForKeyPath: keyPath
                              ofObject: object
                                change: change
                               context: context ];
    }
}

-(void)awakeFromNib
{
    if (IOS_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8")
        && IOS_VERSION_LESS_THAN(@"8.1")) {
        [ self addObserver: self
                forKeyPath: @"layer.bounds"
                   options: NSKeyValueObservingOptionNew
                   context: 0 ];
    }
}

@end
