//
//  VKPhotosManager.m
//  VKPhotoViewer2
//
//  Created by Kristy on 22.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "PhotosManager.h"
#import "PhotosBuilder.h"
#import "PhotosCommunicator.h"

@implementation PhotosManager

-(void)fetchPhotosInAlbum:(NSString *)albumId {
    [self.communicator searchPhotosInAlbum:albumId];
}

#pragma mark - PhotosCommunicatorDelegate

-(void)receivedPhotosJSON:(NSData *)objectNotation {
    NSError *error = nil;
    NSArray *photos = [PhotosBuilder photosFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingPhotosFailedWithError:error];
        
    } else {
        [self.delegate didReceivePhotos:photos];
    }
}

-(void)fetchingPhotosFailedWithError:(NSError *)error {
    [self.delegate fetchingPhotosFailedWithError:error];
}

@end


