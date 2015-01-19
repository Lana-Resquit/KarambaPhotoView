//
//  VKContentManager.m
//  VKPhotoViewer2
//
//  Created by Kristy on 19.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "VKContentManager.h"

@implementation VKContentManager

+(NSArray *)albumsFromJSON:(NSData *)objectNotation error:(NSError **)error {
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *albums = [[NSMutableArray alloc] init];
    
    NSArray *results = [parsedObject valueForKey:@"results"];
    NSLog(@"Count %ld", results.count);
    
    for (NSDictionary *groupDic in results) {
        Album *album = [[Album alloc] init];
        
        for (NSString *key in groupDic) {
            if ([album respondsToSelector:NSSelectorFromString(key)]) {
                [album setValue:[groupDic valueForKey:key] forKey:key];
            }
        }
        
        [albums addObject:album];
    }
    
    return albums;
}

//VKRequest * getAlbums = [VKRequest requestWithMethod:@"photos.getAlbums" andParameters:@{VK_API_OWNER_ID : newToken.userId} andHttpMethod:@"GET"];
//[getAlbums executeWithResultBlock:^(VKResponse * response) {
//    NSLog(@"Json result: %@", response.json);
//} errorBlock:^(NSError * error) {
//    if (error.code != VK_API_ERROR) {
//        [error.vkError.request repeat];
//    }
//    else {
//        NSLog(@"VK error: %@", error);
//    }
//}];

@end
