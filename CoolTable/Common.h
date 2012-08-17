//
//  Common.h
//  CoolTable
//
//  Created by Lancy on 17/8/12.
//  Copyright (c) 2012 Lancy. All rights reserved.
//

#import <Foundation/Foundation.h>

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef  endColor);
void drawRect(CGContextRef context, CGRect rect, CGColorRef color, CGFloat width);
void drawStroke(CGContextRef context, CGPoint startPoint, CGPoint endPoint, CGColorRef color, CGFloat width);
