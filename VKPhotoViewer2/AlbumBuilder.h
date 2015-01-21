//
//  AlbumParser.h
//  VKPhotoViewer2
//
//  Created by Kristy on 20.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumBuilder : NSObject

+(NSMutableArray *)albumsFromJSON:(NSData *)objectNotatoin error:(NSError **)error;

@end
