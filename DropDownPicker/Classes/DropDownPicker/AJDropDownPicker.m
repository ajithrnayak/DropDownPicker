//
//  AJDropDownPicker.m
//  DropDownPicker
//
//  Created by Ajith R Nayak on 22/07/13.
//  Copyright (c) 2013 Ajith R Nayak. All rights reserved.
//

#import "AJDropDownPicker.h"
#import <QuartzCore/QuartzCore.h>

#define kRowHeight 22
#define kMaxVisibleRows 5

#define kDefaultHeightRow 24
#define kDefaultWeightRow 20
#define kTransitionDuration 0.6
#define backColor [UIColor colorWithRed:180.0/255.0 green:29.0/255.0 blue:30.0/255.0 alpha:1]
@interface AJDropDownPickerCell : UITableViewCell

@end

@implementation AJDropDownPickerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView * background = [[UIView alloc] init];
        background.backgroundColor =backColor;
        self.selectedBackgroundView = background;
        self.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:15];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect titleFrame = CGRectInset(self.bounds, 5, 0);
    self.textLabel.frame = titleFrame;
}
@end

@interface AJDropDownPicker ()
{
    UITableView * pickerTableView;
}

@end


@implementation AJDropDownPicker


@synthesize shownFromView = _shownFromView;
@synthesize delegate = _delegate;
@synthesize dataSourceArray = _dataSourceArray;


- (id)initWithDelegate:(id)delegate dataSourceArray:(NSArray *)dataSourceArray
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        pickerTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        pickerTableView.rowHeight  = kRowHeight;
        pickerTableView.dataSource = self;
        pickerTableView.delegate   = self;
        pickerTableView.layer.borderColor = [UIColor redColor].CGColor;
        pickerTableView.layer.borderWidth = 1.0;
        
        pickerTableView.backgroundColor = [UIColor whiteColor];
        pickerTableView.separatorColor  = [UIColor redColor];
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:pickerTableView];
        [self addTarget:self action:@selector(didTappedOnBackground) forControlEvents:UIControlEventTouchUpInside];
        
        self.dataSourceArray = dataSourceArray;
        self.delegate = delegate;
    }
    return self;
}

#pragma mark- Show/Hide -

- (void)showFromView:(UIView *)view
{
    if (!view.superview) {
        return;
    }
    
    self.shownFromView = view;
    
    NSUInteger rowCount = [_dataSourceArray count];
    pickerTableView.scrollEnabled = (rowCount > kMaxVisibleRows);
    
    CGRect frame = view.superview.bounds;
    
    CGRect tableViewFrame = view.frame;
    tableViewFrame.origin.y = (tableViewFrame.origin.y + tableViewFrame.size.height) - 1;
    tableViewFrame.size.height = 0.0;
    pickerTableView.frame = tableViewFrame;
    self.frame = frame;
    
    [view.superview addSubview:self];
    //[self customisePresentaionForView:view];
    
    tableViewFrame.size.height = MIN((rowCount * kRowHeight), (kMaxVisibleRows * kRowHeight));
    NSTimeInterval duration = ((MIN(rowCount, kMaxVisibleRows))/(float)kMaxVisibleRows)*kTransitionDuration;
    
    [UIView animateWithDuration:duration animations:^{pickerTableView.frame = tableViewFrame;}];
    
}

- (void)hidePicker
{
    CGRect tableViewFrame = pickerTableView.frame;
    tableViewFrame.size.height = 0.0;
    
    NSTimeInterval duration = ((MIN([_dataSourceArray count], kMaxVisibleRows))/(float)kMaxVisibleRows)*kTransitionDuration;
    
    [UIView animateWithDuration:duration
                     animations:^{
                         pickerTableView.frame = tableViewFrame;
                     }
                     completion:^(BOOL isFinish){
                         if (isFinish) {
                             [self removeFromSuperview];
                         }
                     }];
    
}

- (void)didTappedOnBackground
{
    [self hidePicker];
}

#pragma mark- TableView DataSource and Delegate -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSourceArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[AJDropDownPickerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
	
    cell.textLabel.text = [_dataSourceArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_delegate respondsToSelector:@selector(dropDownPicker:didPickObject:)])
    {
        [_delegate dropDownPicker:self didPickObject:[_dataSourceArray objectAtIndex:indexPath.row]];
    }
    [self hidePicker];
}

@end
