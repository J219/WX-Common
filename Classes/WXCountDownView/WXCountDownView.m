//
//  EHCountDownView.m
//  EHealth
//
//  Created by WangXun on 14/12/13.
//  Copyright (c) 2014年 focuschina. All rights reserved.
//

#import "WXCountDownView.h"

#define kColorButtonTitle [UIColor blueColor]

@interface WXCountDownView()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation WXCountDownView

#pragma mark - Basic
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit
{
    
    _readyTitle = @"获取验证码";
    _countDownTitle = @"获取验证码";
    
    _button = [[UIButton alloc] initWithFrame:self.bounds];
    _button.translatesAutoresizingMaskIntoConstraints = YES;
    [_button.titleLabel setFont:[UIFont systemFontOfSize:16]];
    
    [_button setTitleColor:kColorButtonTitle forState:(UIControlStateNormal)];
    _button.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_button setTitle:_readyTitle forState:(UIControlStateNormal)];
    [_button setTitle:_countDownTitle forState:(UIControlStateDisabled)];
//    [_button setBackgroundImage:[UIImage imageNamed:@"btn_blue_bounds.png"] forState:(UIControlStateNormal)];
    [_button addTarget:self action:@selector(clickButton:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:_button];
    
}

- (void)dealloc
{
    [_timer invalidate];
}

#pragma mark - Method
- (void)startCountDownWithMax:(NSTimeInterval)maxTime
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    
    _restTime = maxTime;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
    _button.enabled = NO;

}

- (void)timerFireMethod:(NSTimer *)timer
{
    _restTime -= 1;
    if (_restTime <= 0.0f) {
        _button.enabled = YES;
        [_timer invalidate];
        _timer = nil;
    }
    else {
        [_button setTitle:[NSString stringWithFormat:@"%@%ds",_countDownTitle, (int)_restTime] forState:(UIControlStateDisabled)];
        _button.enabled = NO;
    }
    
}

- (void)clickButton:(id)sender
{
    if (self.countDownClickBlock) {
        self.countDownClickBlock();
    }
}


@end
