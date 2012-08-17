//
//  CustomCellBackground.m
//  CoolTable
//
//  Created by Lancy on 17/8/12.
//  Copyright (c) 2012 Lancy. All rights reserved.
//

#import "CustomCellBackground.h"

@implementation CustomCellBackground

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
    CGColorRef redColor = [UIColor redColor].CGColor;
    
    CGContextSetFillColorWithColor(context, redColor);
    CGContextFillRect(context, self.bounds);
    
}


@end
