//
//  ViewController.m
//  VKPhotoViewer2
//
//  Created by Kristy on 12.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:NO];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
}

@end
