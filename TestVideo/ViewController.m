//
//  ViewController.m
//  TestVideo
//
//  Created by zhongan on 2018/7/12.
//  Copyright © 2018年 sss. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setLocalMediaPlayer];
}

- (void)setRemoteMediaPlayer {
    _moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:@"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"]];
//    _moviePlayer.contentURL = [NSURL URLWithString:@"https://player.youku.com/embed/XMTcwNjAxMTczMg=="];
    [self.view addSubview:_moviePlayer.view];
    _moviePlayer.view.frame = CGRectMake(100, 100, 200, 200);
    _moviePlayer.shouldAutoplay = YES;
    [_moviePlayer prepareToPlay];
//    [_moviePlayer play];
//     [self.player prepareToPlay];
}

- (void)setLocalMediaPlayer {
    NSString *moviePath = [[NSBundle mainBundle]pathForResource:@"big_buck_bunny" ofType:@"mp4"];
    _moviePlayer = [[MPMoviePlayerController alloc]initWithContentURL:[NSURL fileURLWithPath:moviePath]];
    [self.view addSubview:_moviePlayer.view];
    
    _moviePlayer.view.frame=CGRectMake(0, 0, self.view.frame.size.width, CGRectGetWidth(self.view.frame)*(9.0/16.0));
    _moviePlayer.movieSourceType = MPMovieSourceTypeFile;// 播放本地视频时需要这句
    //    self.player.controlStyle = MPMovieControlStyleNone;// 不需要进度条
    _moviePlayer.shouldAutoplay = YES;// 是否自动播放（默认为YES）
    //    self.player.scalingMode=MPMovieScalingModeAspectFill;
    [_moviePlayer prepareToPlay];//缓存
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
