//
//  ViewController.m
//  iNoying
//
//  Created by Student on 2/6/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "ViewController.h"
@import AVFoundation;

@interface ViewController ()

@end

@implementation ViewController{
    AVAudioPlayer *_player;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    
    UIImage *bgimage = [UIImage imageNamed: @"bart_back"];
    UIImageView *bgview = [[UIImageView alloc] initWithImage:bgimage];
    
    bgview.alpha = .33;
    bgview.center = CGPointMake(width/2, height-bgview.frame.size.height/2);
    
    [self.view addSubview:bgview];
    
    CGRect frame = CGRectMake(0,0,width,100);
    UILabel *labelView = [[UILabel alloc] initWithFrame:frame];
    labelView.center = CGPointMake(width/2, 75);
    labelView.text = @"iNoying";
    labelView.font = [UIFont fontWithName:@"Chalkduster" size:60];
    labelView.textColor = [UIColor redColor];
    
    [self.view addSubview:labelView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0,0,150,150);
    button.center = CGPointMake(80,180);
    UIImage *bartImage = [UIImage imageNamed:@"bart_button"];
    [button setImage: bartImage forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    [button addTarget: self action: @selector(playSound)
     forControlEvents:UIControlEventTouchUpInside];
}

-(void) playSound{
    _player = [[AVAudioPlayer alloc] init];
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource: @"eatshort1" ofType: @"mp3"];
    if(soundFilePath == NULL){
        NSLog(@"file not found");
        return;
    }
    
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath];
    NSError *error;
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: &error];
 
    
    if(error){
        NSLog(@"error loading sound file! error = %@",error);
    }
        _player.volume = 1.0;
        [_player play];
        
        
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
