//
//  CustomHeader.m
//  CoolTable
//
//  Created by Lancy on 18/8/12.
//  Copyright (c) 2012 Lancy. All rights reserved.
//

#import "CustomHeader.h"

@implementation CustomHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorRef redColor = [UIColor colorWithRed:1.0 green:0.0
                                           blue:0.0 alpha:1.0].CGColor;
    
    CGContextSetFillColorWithColor(context, redColor);
    CGContextFillRect(context, self.bounds);
}


@end
