//
//  VKPhotosCommunicator.m
//  VKPhotoViewer2
//
//  Created by Kristy on 22.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "VKPhotosCommunicator.h"
#import "VKPhotosCommunicatorDelegate.h"
#import "VKSdk.h"

@implementation VKPhotosCommunicator

-(void)searchPhotosInAlbum:(NSString *)albumId {
    
    NSString *token = [[VKSdk getAccessToken]accessToken];
    NSString *userId = [[VKSdk getAccessToken]userId];
    
    NSString *urlStr = [NSString stringWithFormat:@"https://api.vk.com/method/photos.get?owner_id=%@&access_token=%@&album_id=%@",userId,token,albumId];
    NSURL *url = [[NSURL alloc]initWithString:urlStr];
    NSLog(@"receiving photos have started ");
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.delegate fetchingPhotosFailedWithError:error];
        } else {
            NSLog(@"receiving photos have finished ");
            [self.delegate receivedPhotosJSON:data];
            
        }
    }];
}

@end
