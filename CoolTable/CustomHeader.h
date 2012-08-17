//
//  CustomHeader.h
//  CoolTable
//
//  Created by Lancy on 18/8/12.
//  Copyright (c) 2012 Lancy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomHeader : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIColor *darkColor;
@property (nonatomic, strong) UIColor *lightColor;
@property CGRect coloredBoxRect;
@property CGRect paperRect;
@end
