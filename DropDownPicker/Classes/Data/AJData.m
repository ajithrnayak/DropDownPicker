//
//  AJData.m
//  DropDownPicker
//
//  Created by Ajith R Nayak on 22/07/13.
//  Copyright (c) 2013 Ajith R Nayak. All rights reserved.
//

#import "AJData.h"

@implementation AJData

+(NSArray*)optionsArray
{
    static dispatch_once_t pred;
    static NSArray * dataSourceArray = nil;
    
    dispatch_once(&pred, ^{
        dataSourceArray = @[@"Twitter",@"Facebook",@"Tumblr",@"Github",@"LinkedIn",@"Wordpress",@"Email",];
    });
    return dataSourceArray;
}

@end
