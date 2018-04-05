//
//  RoundButton.h
//  iOS-Assignment-3
//
//  Created by Nuch Phromsorn on 2018-04-05.
//  Copyright © 2018 Nuch Phromsorn. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface RoundButton : UIButton

@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@end
