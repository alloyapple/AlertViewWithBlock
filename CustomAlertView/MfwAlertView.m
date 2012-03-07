//
//  MfwAlertView.m
//  CustomAlertView
//
//  Created by color on 12-3-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MfwAlertView.h"

@implementation MfwAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message  cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    click = nil;
    
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    
    
    va_list args;
    va_start(args, otherButtonTitles);
    for (NSString *arg = otherButtonTitles; arg != nil; arg = va_arg(args, NSString*))
    {
        [self addButtonWithTitle:arg];
    }
    va_end(args);
    
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
   // [UIView commitAnimations]
    
    if (click != nil)
    {
        click(alertView, buttonIndex);
    }
    
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    if (cancelClick != nil)
    {
        cancelClick(alertView);
    }

}

-(void)setClickBlock:(clicked)clicked
{
    click = [clicked copy];
    
}

-(void)setCancelBlock:(clickAction)clicked
{
    cancelClick = [clicked copy];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
