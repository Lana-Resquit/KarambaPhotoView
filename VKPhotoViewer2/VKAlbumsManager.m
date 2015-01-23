//
//  VKManager.m
//  VKPhotoViewer2
//
//  Created by Kristy on 21.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "VKAlbumsManager.h"
#import "AlbumsBuilder.h"
#import "VKAlbumsCommunicator.h"

@implementation VKAlbumsManager

-(void)fetchAlbumsInUser {
    [self.communicator searchAlbumsInUser];
}

#pragma mark - VKAlbumsCommunicatorDelegate

-(void)receivedAlbumsJSON:(NSData *)objectNotation {
    NSError *error = nil;
    NSArray *albums = [AlbumsBuilder albumsFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingAlbumsFailedWithError:error];
        
    } else {
        [self.delegate didReceiveAlbums:albums];
    }
}

- (void)fetchingAlbumsFailedWithError:(NSError *)error
{
    [self.delegate fetchingAlbumsFailedWithError:error];
}

@end
