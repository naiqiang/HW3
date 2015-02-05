//
//  ViewController.h
//  HW3
//
//  Created by czhang on 2/1/15.
//  Copyright (c) 2015 czhang. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TodoList.h"

@interface ViewController : NSViewController <NSTextFieldDelegate, NSTableViewDataSource, NSTableViewDelegate>


@property (weak) IBOutlet NSTextField *textFieldEntry;
@property (weak) IBOutlet NSButton *buttonAdd;
@property (weak) IBOutlet NSButton *buttonRemove;
@property (weak) IBOutlet NSButton *allowDupButton;

@property (weak) IBOutlet NSTableView *tabView;

@property TodoList* todoList;

-(void)updateUI:(NSString*)text;

@end

