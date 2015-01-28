//
//  VKCommunicator.m
//  VKPhotoViewer2
//
//  Created by Kristy on 21.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "AlbumsCommunicator.h"
#import "AlbumsCommunicatorDelegate.h"
#import "VKSdk.h"

@implementation AlbumsCommunicator

-(void)searchAlbumsInUser {
    
    NSString *token = [[VKSdk getAccessToken]accessToken];
    NSString *userId = [[VKSdk getAccessToken]userId];
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.vk.com/method/photos.getAlbums?user_id=%@&access_token=%@&need_covers=1",userId,token];
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.delegate fetchingAlbumsFailedWithError:error];
        } else {
            [self.delegate receivedAlbumsJSON:data];
            
        }
    }];
}

@end
