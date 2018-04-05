//
//  RoundButton.m
//  iOS-Assignment-3
//
//  Created by Nuch Phromsorn on 2018-04-05.
//  Copyright © 2018 Nuch Phromsorn. All rights reserved.
//

#import "RoundButton.h"

@implementation RoundButton

@dynamic borderColor,borderWidth,cornerRadius;


-(void)setBorderColor:(UIColor *)borderColor{
    [self.layer setBorderColor:borderColor.CGColor];
}

-(void)setBorderWidth:(CGFloat)borderWidth{
    [self.layer setBorderWidth:borderWidth];
}

-(void)setCornerRadius:(CGFloat)cornerRadius{
    [self.layer setCornerRadius:cornerRadius];
}

@end

