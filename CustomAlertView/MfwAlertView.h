//
//  MfwAlertView.h
//  CustomAlertView
//
//  Created by color on 12-3-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^clicked)(UIAlertView* alertView, NSInteger index);
typedef void (^clickAction)(UIAlertView* alertView);

@interface MfwAlertView : UIAlertView<UIAlertViewDelegate>
{
    clicked click;
    clickAction cancelClick;
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

-(void)setClickBlock:(clicked)clicked;
-(void)setCancelBlock:(clickAction)clicked;

@end
