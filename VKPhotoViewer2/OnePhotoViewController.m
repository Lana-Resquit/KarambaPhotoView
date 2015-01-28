//
//  OnePhotoViewController.m
//  VKPhotoViewer2
//
//  Created by Kristy on 14.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "OnePhotoViewController.h"
#import "AFNetworking.h"

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
       
        NSURL *url = [NSURL URLWithString:self.photoItem.photoXXXURL];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:urlRequest];
        requestOperation.responseSerializer = [AFImageResponseSerializer serializer];
        [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            self.imageView.image = responseObject;
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Image error: %@", error);
        }];
        [requestOperation start];

    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

@end
