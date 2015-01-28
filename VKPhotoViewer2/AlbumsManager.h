//
//  VKManager.h
//  VKPhotoViewer2
//
//  Created by Kristy on 21.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlbumsCommunicatorDelegate.h"
#import "AlbumsManagerDelegate.h"
#import "AlbumsCommunicatorDelegate.h"

@class AlbumsCommunicator;

@interface AlbumsManager : NSObject<AlbumsCommunicatorDelegate>

@property (strong, nonatomic) AlbumsCommunicator *communicator;
@property (weak, nonatomic) id<AlbumsManagerDelegate> delegate;

-(void)fetchAlbumsInUser;

@end
