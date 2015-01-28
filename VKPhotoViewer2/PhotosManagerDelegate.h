//
//  VKPhotosManagerDelegate.h
//  VKPhotoViewer2
//
//  Created by Kristy on 22.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PhotosManagerDelegate

-(void)didReceivePhotos:(NSArray *)photos;
-(void)fetchingPhotosFailedWithError:(NSError *)error;

@end