//
//  BulletManager.h
//  BulletDemo
//
//  Created by ArrQ on 2017/9/16.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BulletView;
@interface BulletManager : NSObject

@property(nonatomic,copy) void(^generateViewBlock)(BulletView *view);

- (void)strat;

- (void)stop;




@end
