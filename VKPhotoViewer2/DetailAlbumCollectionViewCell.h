//
//  DetailAlbumCollectionViewCell.h
//  VKPhotoViewer2
//
//  Created by Kristy on 13.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface DetailAlbumCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) AFHTTPRequestOperation *loadingOperation;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorCollection;

@end
