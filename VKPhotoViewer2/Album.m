//
//  Album.m
//  VKPhotoViewer2
//
//  Created by Kristy on 12.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "Album.h"

@implementation Album

-(id)initWhithTitle:(NSString *)title andPhoto:(UIImage *)photo {
    self = [super init];
    if (self) {
        _title = title;
        _photo = photo;
        return self;
    }
    return nil;
}

@end
