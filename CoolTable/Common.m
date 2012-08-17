//
//  Common.m
//  CoolTable
//
//  Created by Lancy on 17/8/12.
//  Copyright (c) 2012 Lancy. All rights reserved.
//

#import "Common.h"

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor,
                        CGColorRef  endColor) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = [NSArray arrayWithObjects:(__bridge id)startColor, (__bridge id)endColor, nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

void drawRect(CGContextRef context, CGRect rect, CGColorRef color, CGFloat width)
{
    CGContextSetStrokeColorWithColor(context, color);
    CGContextSetLineWidth(context, width);
    CGContextStrokeRect(context, rect);
}

void drawStroke(CGContextRef context, CGPoint startPoint, CGPoint endPoint,
                   CGColorRef color, CGFloat width) {
    
    CGContextSaveGState(context);
    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextSetStrokeColorWithColor(context, color);
    CGContextSetLineWidth(context, width);
    CGContextMoveToPoint(context, startPoint.x + 0.5, startPoint.y + 0.5);
    CGContextAddLineToPoint(context, endPoint.x + 0.5, endPoint.y + 0.5);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
    
}