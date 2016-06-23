//
//  FISSong.m
//  JukeboxViews
//
//  Created by Eldon Chan on 6/22/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISSong.h"

@implementation FISSong

-(instancetype)init{
    
    return self = [self initWithTitle:@"" artist:@"" album:@"" fileName:@""];
}

-(instancetype)initWithTitle:(NSString *)title
                      artist:(NSString *)artist
                       album:(NSString *)album
                    fileName:(NSString *)fileName{
    
    self = [super init];
    
    if (self) {
        
        _title = title;
        _artist = artist;
        _album = album;
        _fileName = fileName;
    }
    
    return self;
}

-(NSString *)description{
    
    NSMutableString *descript = [[NSMutableString alloc]init];
    [descript appendFormat:@"\nTitle: %@", self.title];
    [descript appendFormat:@"\nArtist:%@", self.artist];
    [descript appendFormat:@"\nAlbum: %@", self.album];
    
    return descript;
}

@end
