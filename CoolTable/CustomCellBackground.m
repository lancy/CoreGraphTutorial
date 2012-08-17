//
//  CustomCellBackground.m
//  CoolTable
//
//  Created by Lancy on 17/8/12.
//  Copyright (c) 2012 Lancy. All rights reserved.
//

#import "CustomCellBackground.h"
#import "Common.h"

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
    
    CGColorRef whiteColor = [UIColor colorWithRed:1.0 green:1.0
                                             blue:1.0 alpha:1.0].CGColor;
    CGColorRef lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0
                                                 blue:230.0/255.0 alpha:1.0].CGColor;
    CGRect paperRect = self.bounds;
    drawLinearGradient(context, paperRect, whiteColor, lightGrayColor);
    
    // Add down at the bottom
    CGRect strokeRect = CGRectInset(paperRect, 2.0, 2.0);
    drawRect(context, strokeRect, whiteColor, 1.0);
    
    // Add in color section
    CGColorRef separatorColor = [UIColor colorWithRed:208.0/255.0 green:208.0/255.0
                                                 blue:208.0/255.0 alpha:1.0].CGColor;
    
    // Add at bottom
    CGPoint startPoint = CGPointMake(paperRect.origin.x,
                                     paperRect.origin.y + paperRect.size.height - 1);
    CGPoint endPoint = CGPointMake(paperRect.origin.x + paperRect.size.width - 1,
                                   paperRect.origin.y + paperRect.size.height - 1);
    drawStroke(context, startPoint, endPoint, separatorColor, 1.0);
}


@end
