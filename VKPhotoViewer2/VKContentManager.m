//
//  VKContentManager.m
//  VKPhotoViewer2
//
//  Created by Kristy on 19.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "VKContentManager.h"
#import "VKSdk.h"
#import "AlbumDataController.h"
#import "AlbumBuilder.h"

@interface VKContentManager ()

@property (nonatomic, strong) AlbumDataController * albumDataController;

@end
@implementation VKContentManager

-(void)searchAlbumsInUser {
    
    NSString *token = [[VKSdk getAccessToken]accessToken];
    NSString *userId = [[VKSdk getAccessToken]userId];
    NSString *urlString = [NSString stringWithFormat:@"https://api.vk.com/method/photos.getAlbums?user_id=%@&access_token=%@&need_covers=1",userId,token];
    NSURL *url = [[NSURL alloc]initWithString:urlString];

    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
    
        if (error) {
            NSLog(@"Error %@; %@", error, [error localizedDescription]);
        } else {
            [self.albumDataController setAlbumList:[AlbumBuilder albumsFromJSON:data error:nil]];
    
    }
}];
}

@end
