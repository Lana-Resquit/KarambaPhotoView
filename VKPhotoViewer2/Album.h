//
//  Album.h
//  VKPhotoViewer2
//
//  Created by Kristy on 12.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Album : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *urlPhoto;
@property (nonatomic, strong) NSString *albumId;

@end
