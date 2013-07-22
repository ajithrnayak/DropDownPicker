//
//  AJViewController.m
//  DropDownPicker
//
//  Created by Ajith R Nayak on 22/07/13.
//  Copyright (c) 2013 Ajith R Nayak. All rights reserved.
//

#import "AJViewController.h"
#import "AJData.h"


@interface AJViewController ()

@end

@implementation AJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapDropDownBtn:(id)sender {
    
    AJDropDownPicker *picker=[[AJDropDownPicker alloc]initWithDelegate:self dataSourceArray:[AJData optionsArray]];
    [picker showFromView:sender];
}

-(void)dropDownPicker:(AJDropDownPicker *)dropDownPicker didPickObject:(id)pickedObject
{
    NSString *outputStatus= [NSString stringWithFormat:@"Find me on %@ at-",pickedObject];
  
    if([pickedObject isEqualToString:@"Twitter"])
       self.urlLabel.text = [outputStatus stringByAppendingString:[NSString stringWithFormat:@"%@",[NSURL URLWithString:@"https://twitter.com/ajithrnayak"]]];
    else if ([pickedObject isEqualToString:@"Facebook"])
         self.urlLabel.text = [outputStatus stringByAppendingString:[NSString stringWithFormat:@"%@",[NSURL URLWithString:@"https://www.facebook.com/ajith.r.nayak"]]];
    else if ([pickedObject isEqualToString:@"Github"])
        self.urlLabel.text = [outputStatus stringByAppendingString:[NSString stringWithFormat:@"%@",[NSURL URLWithString:@"https://github.com/ajithrnayak"]]];
    else if ([pickedObject isEqualToString:@"Tumblr"])
        self.urlLabel.text = [outputStatus stringByAppendingString:[NSString stringWithFormat:@"%@",[NSURL URLWithString:@"http://ajithrnayak.tumblr.com"]]];
    else if ([pickedObject isEqualToString:@"LinkedIn"])
        self.urlLabel.text = [outputStatus stringByAppendingString:[NSString stringWithFormat:@"%@",[NSURL URLWithString:@"in.linkedin.com/pub/ajith-r-nayak/b/257/294/"]]];
    else if ([pickedObject isEqualToString:@"Email"])
        self.urlLabel.text = [outputStatus stringByAppendingString:[NSString stringWithFormat:@"%@",[NSURL URLWithString:@"ajithrnayak@icloud.com"]]];
    else if ([pickedObject isEqualToString:@"Wordpress"])
        self.urlLabel.text = [outputStatus stringByAppendingString:[NSString stringWithFormat:@"%@",[NSURL URLWithString:@"http://ajithrnayak.wordpress.com"]]];

}

@end
