//
//  ViewController.m
//  23_lecture_UIView_Drawings
//
//  Created by Slava on 28.04.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "ViewController.h"
#import "DrawningView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Orientation

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
    [self.drawingView setNeedsDisplay];
    
}

@end
