//
//  AJViewController.h
//  DropDownPicker
//
//  Created by Ajith R Nayak on 22/07/13.
//  Copyright (c) 2013 Ajith R Nayak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJDropDownPicker.h"

@interface AJViewController : UIViewController <AJDropDownPickerDelegte>

@property (strong, nonatomic) IBOutlet UIButton *dropDownBtn;
- (IBAction)didTapDropDownBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *urlLabel;
@end
