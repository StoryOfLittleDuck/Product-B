//
//  UIView+Frame.m
//  Product-B
//
//  Created by 林建 on 16/7/11.
//  Copyright © 2016年 林建. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
//Y
-(void)setTop:(CGFloat)top{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
    
}


-(CGFloat)top{
    return self.frame.origin.y;
}


//X
-(void)setLeft:(CGFloat)left{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

-(CGFloat)left{
    return self.frame.origin.x;
}

//Width
-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat)width{
    return self.frame.size.width;
}

//Height
-(void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(CGFloat)height{
    return self.frame.size.height;
}

//Right
-(CGFloat)right{
    return self.frame.origin.x + self.frame.size.width;
}

//Bottom
-(CGFloat)bottom{
    return self.frame.origin.y + self.frame.size.height;
}

//CenterX
-(void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(CGFloat)centerX{
    return self.center.x;
}

//CenterY
-(void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

-(CGFloat)centerY{
    return self.center.y;
}
@end
