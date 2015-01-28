//
//  VKPhotosManager.h
//  VKPhotoViewer2
//
//  Created by Kristy on 22.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotosCommunicatorDelegate.h"
#import "PhotosManagerDelegate.h"
#import "PhotosCommunicatorDelegate.h"

@class PhotosCommunicator;

@interface PhotosManager : NSObject<PhotosCommunicatorDelegate>

@property (strong, nonatomic) PhotosCommunicator *communicator;
@property (weak, nonatomic) id<PhotosManagerDelegate> delegate;

-(void)fetchPhotosInAlbum:(NSString *)albumId;

@end
