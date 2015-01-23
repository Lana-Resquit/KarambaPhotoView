//
//  VKPhotosCommunicator.h
//  VKPhotoViewer2
//
//  Created by Kristy on 22.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VKPhotosCommunicatorDelegate;

@interface VKPhotosCommunicator : NSObject

@property (weak, nonatomic) id<VKPhotosCommunicatorDelegate> delegate;

-(void)searchPhotosInAlbum:(NSString *)albumId;

@end
