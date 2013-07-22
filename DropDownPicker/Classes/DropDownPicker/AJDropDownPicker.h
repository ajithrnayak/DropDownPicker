//
//  AJDropDownPicker.h
//  DropDownPicker
//
//  Created by Ajith R Nayak on 22/07/13.
//  Copyright (c) 2013 Ajith R Nayak. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AJDropDownPickerDelegte;

@interface AJDropDownPicker : UIControl <UITableViewDataSource, UITableViewDelegate>
{
    id <AJDropDownPickerDelegte> __weak _delegate;
    UIView * __weak _shownFromView;
    
    NSArray * _dataSourceArray;
}

@property (nonatomic, weak) id <AJDropDownPickerDelegte> delegate;
@property (nonatomic, weak) UIView * shownFromView;
@property (nonatomic, strong  ) NSArray * dataSourceArray;

- (id)initWithDelegate:(id)delegate dataSourceArray:(NSArray *)dataSourceArray;
- (void)showFromView:(UIView *)view;

@end

@protocol AJDropDownPickerDelegte <NSObject>

- (void)dropDownPicker:(AJDropDownPicker *)dropDownPicker didPickObject:(id)pickedObject;


@end
