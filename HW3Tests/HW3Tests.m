//
//  HW3Tests.m
//  HW3Tests
//
//  Created by czhang on 2/1/15.
//  Copyright (c) 2015 czhang. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "TodoList.h"

@interface HW3Tests : XCTestCase

-(void)showList:(TodoList*)todoList;

@end

@implementation HW3Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)showList:(TodoList*)todoList
{
    for(id it in [todoList allItems])
    {
        TodoItem* item = (TodoItem*)it;
        NSLog([item title]);
    }
}

-(void)testAddItems
{
    TodoList* list = [TodoList todoList];
    [list addItem: [TodoItem todoItemWithTitle:@"item1"]];
    [list addItem: [TodoItem todoItemWithTitle:@"item2"]];
    [list addItem: [TodoItem todoItemWithTitle:@"item3"]];

    XCTAssert([list itemCount]==3);
}

-(void)testAddDups
{
    TodoList* list = [TodoList todoList];
    [list addItem: [TodoItem todoItemWithTitle:@"item1"]];
    [list addItem: [TodoItem todoItemWithTitle:@"item2"]];
    [list addItem: [TodoItem todoItemWithTitle:@"item3"]];

    BOOL added = [list addItem: [TodoItem todoItemWithTitle:@"item3"]];
    XCTAssert(added == YES);
    XCTAssert([list itemCount]==4);
    
    list.allowDuplicates = NO;
    added = [list addItem: [TodoItem todoItemWithTitle:@"item3"]];
    XCTAssert(added == NO);
    XCTAssert([list itemCount]==4);

    //[self showList: list];
}

-(void)testRemoveItems
{
    TodoList* list = [TodoList todoList];
    [list addItem: [TodoItem todoItemWithTitle:@"item1"]];
    [list addItem: [TodoItem todoItemWithTitle:@"item2"]];
    [list addItem: [TodoItem todoItemWithTitle:@"item3"]];

    BOOL removed = [list removeItem:[TodoItem todoItemWithTitle:@"item4"]];
    XCTAssert(removed == NO);
    XCTAssert([list itemCount]==3);
    
    removed = [list removeItem:[TodoItem todoItemWithTitle:@"item2"]];
    XCTAssert(removed == YES);
    XCTAssert([list itemCount]==2);
    
    //[self showList: list];
}
@end
