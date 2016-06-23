//
//  FISJukeboxViewController.h
//  JukeboxViews
//
//  Created by Eldon Chan on 6/22/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "FISPlaylist.h"

@interface FISJukeboxViewController : UIViewController
@property (strong, nonatomic) FISPlaylist *playlist;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end
