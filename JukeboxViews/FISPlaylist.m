//
//  FISPlaylist.m
//  JukeboxViews
//
//  Created by Eldon Chan on 6/22/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPlaylist.h"

@implementation FISPlaylist

-(instancetype)init{
    
    self = [super init];
    
    if (self){
        _songs = [self generateSongObjects];
        _text = [self generateTextObjects];
    }
    
    return self;
}

-(void)sortSongsByTitle{
    
    NSSortDescriptor *sortTitle = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    [self.songs sortUsingDescriptors:@[sortTitle]];
    self.text = [self generateTextObjects];
    
}

-(void)sortSongsByArtist{
    
    NSSortDescriptor *sortArtist = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
    [self.songs sortUsingDescriptors:@[sortArtist]];
    self.text = [self generateTextObjects];
}

-(void)sortSongsByAlbum{
    
    NSSortDescriptor *sortAlbum = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
    [self.songs sortUsingDescriptors:@[sortAlbum]];
    self.text = [self generateTextObjects];
    
}

-(FISSong *)songForTrackNumber:(NSUInteger)trackNumber{
    
    if (trackNumber == 0 || self.songs.count < trackNumber){
        return nil;
    }
    
    return [self.songs objectAtIndex:trackNumber-1];
}

- (NSMutableArray *)generateSongObjects{
    
    NSMutableArray *songs = [[NSMutableArray alloc] init];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Hold on Be Strong"
                                             artist:@"Matoma vs Big Poppa"
                                              album:@"The Internet 1"
                                           fileName:@"hold_on_be_strong"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Higher Love"
                                             artist:@"Matoma ft. James Vincent McMorrow"
                                              album:@"The Internet 2"
                                           fileName:@"higher_love"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Mo Money Mo Problems"
                                             artist:@"Matoma ft. The Notorious B.I.G."
                                              album:@"The Internet 3"
                                           fileName:@"mo_money_mo_problems"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Old Thing Back"
                                             artist:@"The Notorious B.I.G."
                                              album:@"The Internet 4"
                                           fileName:@"old_thing_back"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Gangsta Bleeding Love"
                                             artist:@"Matoma"
                                              album:@"The Internet 5"
                                           fileName:@"gangsta_bleeding_love"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Bailando"
                                             artist:@"Enrique Iglesias ft. Sean Paul"
                                              album:@"The Internet 6"
                                           fileName:@"bailando"] ];
    
    return songs;
}

-(NSString *)generateTextObjects{
    
    NSMutableString *texts =  [[NSMutableString alloc]init];
    
    NSUInteger index = 0;

    for (FISSong *song in self.songs){
        
        index++;
        [texts appendFormat:@"%lu. (Title) %@ (Artist) %@ (Album) %@\n", index, song.title, song.artist, song.album];
    }
    
    return texts;
    
}


@end
