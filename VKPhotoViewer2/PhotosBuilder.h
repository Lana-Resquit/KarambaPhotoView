//
//  PhotosBuilder.h
//  VKPhotoViewer2
//
//  Created by Kristy on 22.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotosBuilder : NSObject

+(NSArray *)photosFromJSON:(NSData *)objectNotation error:(NSError **)error;

@end
