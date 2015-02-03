//
//  TodoItem.m
//  HW3
//
//  Created by czhang on 2/2/15.
//  Copyright (c) 2015 czhang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TodoItem.h"

@implementation TodoItem: NSObject

+(instancetype) todoItemWithTitle: (NSString*)title
{
    TodoItem* item = [[TodoItem alloc] init];
    item.title = title;
    return item;
}

@end