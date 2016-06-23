//
//  FISJukeboxViewController.m
//  JukeboxViews
//
//  Created by Eldon Chan on 6/22/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISJukeboxViewController.h"

@interface FISJukeboxViewController ()
@property (weak, nonatomic) IBOutlet UITextView *songDetailTextView;
@property (weak, nonatomic) IBOutlet UITextField *songTextField;
@property (nonatomic) NSInteger trackSelection;
@property (strong,nonatomic) NSString *currentTrack;


@end

@implementation FISJukeboxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.playlist = [[FISPlaylist alloc]init];
    self.songDetailTextView.text = self.playlist.text;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playButtonTapped:(id)sender {
    
    self.trackSelection = [self.songTextField.text integerValue];
    self.currentTrack = self.playlist.songs[self.trackSelection-1];
    
    FISSong *songToPlay = [self.playlist songForTrackNumber:self.trackSelection];
    NSLog(@"Playing Now: %@", self.currentTrack );
    

    [self setUpAVAudioPlayerWithFileName: songToPlay.fileName];
    [self.audioPlayer play];


}

- (IBAction)stopButtonTapped:(id)sender {
    
    [self.audioPlayer stop];
}
- (IBAction)titleButtonTapped:(id)sender {
    
    [self.playlist sortSongsByTitle];
    self.songDetailTextView.text = self.playlist.text;
}
- (IBAction)artistButtonTapped:(id)sender {
    
    [self.playlist sortSongsByArtist];
    self.songDetailTextView.text = self.playlist.text;
}

- (IBAction)albumButtonTapped:(id)sender {
    
    [self.playlist sortSongsByAlbum];
    self.songDetailTextView.text = self.playlist.text;
}

- (void)setUpAVAudioPlayerWithFileName:(NSString *)fileName
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:@"mp3"];
    NSError *error = nil;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!self.audioPlayer)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        [self.audioPlayer prepareToPlay];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
