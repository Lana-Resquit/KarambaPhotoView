//
//  OnePhotoViewController.h
//  VKPhotoViewer2
//
//  Created by Kristy on 14.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface OnePhotoViewController : UIViewController

@property (strong, nonatomic) Photo *photoItem;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
