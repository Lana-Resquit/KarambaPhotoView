//
//  OnePhotoViewController.m
//  VKPhotoViewer2
//
//  Created by Kristy on 14.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "OnePhotoViewController.h"

@interface OnePhotoViewController ()

@end

@implementation OnePhotoViewController

-(void)setPhotoItem:(id)newPhotoItem {
   if (_photoItem != newPhotoItem ) {
       _photoItem = newPhotoItem;
    }
}
-(void)configureView {
    if (self.photoItem) {
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

@end
