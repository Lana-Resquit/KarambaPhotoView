//
//  DetailAlbumCollectionViewCell.m
//  VKPhotoViewer2
//
//  Created by Kristy on 13.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "DetailAlbumCollectionViewCell.h"

@implementation DetailAlbumCollectionViewCell



-(void) prepareForReuse {
    NSLog(@"prepare for reuse");
    self.imageView.image = nil;
    [self.loadingOperation cancel];
}

@end
