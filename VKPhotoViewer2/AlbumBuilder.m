//
//  AlbumParser.m
//  VKPhotoViewer2
//
//  Created by Kristy on 20.01.15.
//  Copyright (c) 2015 Kristyna. All rights reserved.
//

#import "AlbumBuilder.h"
#import "Album.h"

@implementation AlbumBuilder

+(NSArray *)albumsFromJSON:(NSData *)objectNotation error:(NSError **)error {
    
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
            *error = localError;
            return nil;
    }
    
    NSMutableArray *albums = [[NSMutableArray alloc] init];
    
    NSArray *results = [parsedObject valueForKey:@"response"];
    
    for (NSDictionary *albumDic in results ) {
        Album *album = [[Album alloc]init];
        
        [album setTitle:[albumDic valueForKey:@"title"]];
        NSString *urlPhoto = [albumDic valueForKey:@"thumb_src"];
        [album setUrlPhoto:urlPhoto];
//https://github.com/dchohfi/KeyValueObjectMapping/issues/57
        
        [albums addObject:album];
    }
    return albums;
}
@end




