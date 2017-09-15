//
//  BulletView.h
//  BulletDemo
//
//  Created by ArrQ on 2017/9/16.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BulletView : UIView

@property(nonatomic,assign) int trajectory;// 弹道

@property(nonatomic,copy) void(^moveStatusBlock)();//弹幕状态回调

- (instancetype)initWithComment:(NSString *)comment;



- (void)startAnimation;


- (void)stopAnimation;


@end
