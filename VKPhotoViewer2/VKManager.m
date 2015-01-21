//
//  VKManager.m
//  VKPhotoViewer2
//
//  Created by Kristy on 21.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "VKManager.h"
#import "AlbumBuilder.h"
#import "VKCommunicator.h"

@implementation VKManager

-(void)fetchAlbumsInUser {
    [self.communicator searchAlbumsInUser];
}

#pragma mark - VKCommunicatorDelegate

-(void)receivedAlbumsJSON:(NSData *)objectNotation {
    NSError *error = nil;
    NSArray *albums = [AlbumBuilder albumsFromJSON:objectNotation error:&error];
    
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
