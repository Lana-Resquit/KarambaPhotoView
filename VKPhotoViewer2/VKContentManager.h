//
//  VKContentManager.h
//  VKPhotoViewer2
//
//  Created by Kristy on 19.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"
@interface VKContentManager : NSObject

+(NSArray *)albumsFromJSON:(NSData *)objectNotation error:(NSError **)error;

@end
