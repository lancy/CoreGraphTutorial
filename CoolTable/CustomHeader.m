//
//  CustomHeader.m
//  CoolTable
//
//  Created by Lancy on 18/8/12.
//  Copyright (c) 2012 Lancy. All rights reserved.
//

#import "CustomHeader.h"

@interface CustomHeader()


@end

@implementation CustomHeader

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
        self.titleLabel = [[UILabel alloc] init] ;
        _titleLabel.textAlignment = UITextAlignmentCenter;
        _titleLabel.opaque = NO;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:20.0];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        _titleLabel.shadowOffset = CGSizeMake(0, -1);
        [self addSubview:self.titleLabel];
        self.lightColor = [UIColor colorWithRed:105.0f/255.0f green:179.0f/255.0f
                                           blue:216.0f/255.0f alpha:1.0];
        self.darkColor = [UIColor colorWithRed:21.0/255.0 green:92.0/255.0
                                          blue:136.0/255.0 alpha:1.0];
    }
    return self;
}


- (void) layoutSubviews {
    
    CGFloat coloredBoxMargin = 6.0;
    CGFloat coloredBoxHeight = 40.0;
    _coloredBoxRect = CGRectMake(coloredBoxMargin,
                                 coloredBoxMargin,
                                 self.bounds.size.width-coloredBoxMargin*2,
                                 coloredBoxHeight);
    
    CGFloat paperMargin = 9.0;
    _paperRect = CGRectMake(paperMargin,
                            CGRectGetMaxY(_coloredBoxRect),
                            self.bounds.size.width-paperMargin*2,
                            self.bounds.size.height-CGRectGetMaxY(_coloredBoxRect));
    
    _titleLabel.frame = _coloredBoxRect;
    
}

// Replace drawRect with the following
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorRef whiteColor = [UIColor colorWithRed:1.0 green:1.0
                                             blue:1.0 alpha:1.0].CGColor;
    CGColorRef lightColor = _lightColor.CGColor;
    CGColorRef darkColor = _darkColor.CGColor;
    CGColorRef shadowColor = [UIColor colorWithRed:0.2 green:0.2
                                              blue:0.2 alpha:0.5].CGColor;
    
    CGContextSetFillColorWithColor(context, whiteColor);
    CGContextFillRect(context, _paperRect);
    
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 3.0, shadowColor);
    CGContextSetFillColorWithColor(context, lightColor);
    CGContextFillRect(context, _coloredBoxRect);
    CGContextRestoreGState(context);
    
}


@end
