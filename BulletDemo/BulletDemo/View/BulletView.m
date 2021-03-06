//
//  BulletView.m
//  BulletDemo
//
//  Created by ArrQ on 2017/9/16.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

#import "BulletView.h"
#define Padding 10
@interface BulletView ()

@property(nonatomic,strong) UILabel *lbComment;


@end

@implementation BulletView





- (instancetype)initWithComment:(NSString *)comment{


    if (self = [super init]) {
     
        
        self.backgroundColor = [UIColor redColor];
        CGFloat width = [comment sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}].width;
        self.bounds = CGRectMake(0, 0, width + 2 * Padding, 30);
        self.lbComment.text = comment;
        
        self.lbComment.frame = CGRectMake(Padding, 0, width, 30);
        
    }

    return self;

}



- (void)startAnimation{

    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat duration = 4.0f;
    
    CGFloat wholeWidth = screenWidth + CGRectGetWidth(self.bounds);
    
    
    __block CGRect frame = self.frame;
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        frame.origin.x -= wholeWidth;
        
        self.frame = frame;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
        if (self.moveStatusBlock) {
            
            self.moveStatusBlock();
            
        }
        
        
    }];
    
    


}


- (void)stopAnimation{

    [self.layer  removeAllAnimations];
    [self removeFromSuperview];




}


- (UILabel *)lbComment{

    if (!_lbComment) {
    
        
        _lbComment = [[UILabel alloc]initWithFrame:CGRectZero];
        
        _lbComment.font = [UIFont systemFontOfSize:14];
        
        _lbComment.textColor = [UIColor whiteColor];
        
        _lbComment.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_lbComment];
        
    }

    
    return _lbComment;

}





@end
