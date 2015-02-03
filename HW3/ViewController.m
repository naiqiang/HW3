//
//  ViewController.m
//  HW3
//
//  Created by czhang on 2/1/15.
//  Copyright (c) 2015 czhang. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    self.textFieldEntry.delegate = self;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)onClickButtonAdd:(id)sender {
    NSLog(@"click add");
}

- (IBAction)onClickRemove:(id)sender {
    NSLog(@"click remove");
}

- (IBAction)onClickCheckDuplication:(id)sender {
    NSLog(@"click check dup");
}

-(void)controlTextDidChange:(NSNotification *)obj
{
    NSLog(@"text did change");
    
}
@end
