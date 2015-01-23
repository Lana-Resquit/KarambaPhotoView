//
//  VKManager.h
//  VKPhotoViewer2
//
//  Created by Kristy on 21.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKAlbumsCommunicatorDelegate.h"
#import "VKAlbumsManagerDelegate.h"
#import "VKAlbumsCommunicatorDelegate.h"

@class VKAlbumsCommunicator;

@interface VKAlbumsManager : NSObject<VKAlbumsCommunicatorDelegate>

@property (strong, nonatomic) VKAlbumsCommunicator *communicator;
@property (weak, nonatomic) id<VKAlbumsManagerDelegate> delegate;

-(void)fetchAlbumsInUser;

@end
