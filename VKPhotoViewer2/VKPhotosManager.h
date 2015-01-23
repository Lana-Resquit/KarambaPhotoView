//
//  VKPhotosManager.h
//  VKPhotoViewer2
//
//  Created by Kristy on 22.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKPhotosCommunicatorDelegate.h"
#import "VKPhotosManagerDelegate.h"
#import "VKPhotosCommunicatorDelegate.h"

@class VKPhotosCommunicator;

@interface VKPhotosManager : NSObject<VKPhotosCommunicatorDelegate>

@property (strong, nonatomic) VKPhotosCommunicator *communicator;
@property (weak, nonatomic) id<VKPhotosManagerDelegate> delegate;

-(void)fetchPhotosInAlbum:(NSString *)albumId;

@end
