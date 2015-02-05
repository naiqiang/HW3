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
    [self.tabView reloadData];
    [self.textFieldEntry setStringValue:@""];
    [self updateUI:@""];
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
        [self.textFieldEntry setStringValue:@""];
        [self updateUI:@""];
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
        [self.textFieldEntry setStringValue:@""];
        [self updateUI:@""];
    }
}

- (IBAction)allowDupCheck:(id)sender {
    NSButton* button = (NSButton*)sender;
    
    if (button.state == NSOnState)
    {
        self.todoList.allowDuplicates = YES;
    }
    else
    {
        self.todoList.allowDuplicates = NO;
    }
    
    // update buttons
    NSString* text = [self.textFieldEntry stringValue];
    [self updateUI:text];
}

-(void)controlTextDidChange:(NSNotification *)obj
{
    NSString* text = [self.textFieldEntry stringValue];
    NSLog(@"text did change: %@", text);
    
    [self updateUI:text];
}

-(void)updateUI:(NSString*)text
{
    if ( [text isEqualToString:@""] )
    {
        [self.buttonAdd setEnabled:NO];
        [self.buttonRemove setEnabled:NO];
        return;
    }
    
    if ( [self.todoList hasTodoItem:[TodoItem todoItemWithTitle:text]])
    {
        [self.buttonRemove setEnabled:YES];
        if ( [self.todoList allowDuplicates]==YES)
        {
            [self.buttonAdd setEnabled:YES];
        }
        else
        {
            [self.buttonAdd setEnabled:NO];
        }
    }
    else
    {
        [self.buttonAdd setEnabled:YES];
        [self.buttonRemove setEnabled:NO];
    }
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
