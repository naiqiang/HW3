//
//  ViewController.m
//  HW3
//
//  Created by czhang on 2/1/15.
//  Copyright (c) 2015 czhang. All rights reserved.
//

#import "ViewController.h"
#import "TodoItem.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    self.textFieldEntry.delegate = self;
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    
    self.todoList = [TodoList groceryList];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)onClickButtonAdd:(id)sender {
    NSLog(@"click add");
    
    NSString* text = [self.textFieldEntry stringValue];
    TodoItem* item = [TodoItem todoItemWithTitle:text];

    BOOL added = [self.todoList addItem:item];
    if( added )
    {
        [self.tabView reloadData];
    }
}

- (IBAction)onClickRemove:(id)sender {
    NSLog(@"click remove");
    
    NSString* text = [self.textFieldEntry stringValue];
    TodoItem* item = [TodoItem todoItemWithTitle:text];

    BOOL removed = [self.todoList removeItem:item];
    if( removed )
    {
        [self.tabView reloadData];
    }
}

- (IBAction)allowDupCheck:(id)sender {
    NSButton* button = (NSButton*)sender;
    
    if (button.state == NSOnState)
    {
        NSLog(@"ON");
        self.todoList.allowDuplicates = YES;
    }
    else
    {
        NSLog(@"OFF");
        self.todoList.allowDuplicates = NO;
    }
}

-(void)controlTextDidChange:(NSNotification *)obj
{
    NSString* text = [self.textFieldEntry stringValue];
    NSLog(@"text did change: %@", text);
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView* cell =[tableView makeViewWithIdentifier:@"Cell" owner:nil];
    
    id obj = [[self.todoList allItems] objectAtIndex:row];
    TodoItem* item = (TodoItem*)obj;
    cell.textField.stringValue = [NSString stringWithFormat:@"%@", item.title ];
    
    return cell;
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return self.todoList.itemCount;
    
}

@end
