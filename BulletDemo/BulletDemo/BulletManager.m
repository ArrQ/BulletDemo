//
//  BulletManager.m
//  BulletDemo
//
//  Created by ArrQ on 2017/9/16.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "BulletManager.h"
#import "BulletView.h"

@interface BulletManager ()

// 弹幕 数据来源
@property(nonatomic,strong) NSMutableArray *dataSource;

// 弹幕使用过程当中的 数组变量
@property(nonatomic,strong) NSMutableArray *bulletComment;

// 存储 弹幕 view 的 数组 变量
@property(nonatomic,strong) NSMutableArray *bulletViews;


@end

@implementation BulletManager

- (NSMutableArray *)dataSource{

    if (!_dataSource) {
        
        _dataSource = [NSMutableArray arrayWithArray:@[@"弹幕1~~~~~~~~~~~",
                                                       @"弹幕2~~~~",
                                                       @"弹幕3~~~~",
                                                       @"弹幕1~~~~"
                                    
                                                       
                                    ]];
        
    }


    return _dataSource;
}



- (NSMutableArray *)bulletComment{


    if (!_bulletComment) {
        
        _bulletComment = [NSMutableArray array];
        
    }
    
    
    return _bulletComment;


}



- (NSMutableArray *)bulletViews{


    if (!_bulletViews) {
        
        _bulletViews = [NSMutableArray array];
        
    }
    
    
    return _bulletViews;
    


}



- (void)strat{

    
    [self.bulletComment removeAllObjects];
    
    [self.bulletComment addObjectsFromArray:self.dataSource];
    
    [self initBulletComment];
    


}


- (void)initBulletComment{

    NSMutableArray *trajectorys = [NSMutableArray arrayWithArray:@[@(0),@(1),@(2)]];

    for (int i = 0; i < 3; i++) {
        
        
        if (self.bulletComment.count > 0) {
            
            //         随机 弹幕的 轨迹
            NSInteger index = arc4random()%trajectorys.count;
            
            
            int trajectory = [[trajectorys objectAtIndex:index] intValue];
            
            [trajectorys removeObjectAtIndex:index];
            
            
            //         取出弹幕
            NSString *comment = [self.bulletComment firstObject];
            
            [self.bulletComment removeObjectAtIndex:0];
            
            
            // 创建 弹幕view
            [self createBulletView:comment tradectory:trajectory];
            
            

            
            
        }
        
    }
    
    

}


- (void)createBulletView:(NSString *)comment tradectory:(int)trajectory{

    
    BulletView *view = [[BulletView alloc]initWithComment:comment];

    view.trajectory = trajectory;

    [self.bulletViews addObject:view];
    
    
    __weak typeof (view) weakView = view;
    
    __weak typeof (self) weakSelf =self;
    view.moveStatusBlock = ^{
       
//        弹幕销毁
        [weakView stopAnimation];
        
        [weakSelf.bulletViews removeObject:weakView];
        
        
    };
    

    if (self.generateViewBlock) {
        
        self.generateViewBlock(view);
    }
    
    


}




- (void)stop{





}



@end
