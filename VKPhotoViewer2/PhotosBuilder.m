//
//  PhotosBuilder.m
//  VKPhotoViewer2
//
//  Created by Kristy on 22.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "PhotosBuilder.h"
#import "Photo.h"

@implementation PhotosBuilder

+(NSArray *)photosFromJSON:(NSData *)objectNotation error:(NSError **)error {
    
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *photos = [[NSMutableArray alloc] init];
    
    NSArray *results = [parsedObject valueForKey:@"response"];
    
    for (NSDictionary *photoDic in results ) {
        Photo *photo = [[Photo alloc]init];
        
        NSString *urlPhoto = [photoDic valueForKey:@"src_big"];
        NSString *urlXXXPhoto = [photoDic valueForKey:@"src_xxxbig"];
        if (urlXXXPhoto == nil) {
            urlXXXPhoto = [photoDic valueForKey:@"src_big"];
        }
        NSLog(@"url simple: %@", urlPhoto);
        
        [photo setPhotoURL:urlPhoto];
        [photo setPhotoXXXURL:urlXXXPhoto];
        
    [photos addObject:photo];
    }
    return photos;
    
}

@end
