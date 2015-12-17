//
//  ViewController.m
//  fylingStars
//
//  Created by student on 17/12/2015.
//  Copyright © 2015 dungdang. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property(nonatomic,strong) AVAudioPlayer *backgroundMusic;
@end

@implementation ViewController
{
    UIImageView* red,*violet,*brown,*green;
    CGPoint center;
    CGFloat deltaX,deltaY;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    deltaX=100;
    deltaY=100;
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    CGSize size = self.view.bounds.size;
    center= CGPointMake(size.width*0.5,(size.height -60)*0.5 );
    [self drawStars];
    [self Animate];
    [self onMusic];
}

- (void)drawStars{
    red = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"red.png"]];
    violet = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"violet.png"]];
    brown = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"brown.png"]];
    green = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"green.png"]];
    [self vitri];
    [self.view addSubview:red];
    [self.view addSubview:violet];
    [self.view addSubview:brown];
    [self.view addSubview:green];
    
}
- (void)Animate{
        [UIView animateWithDuration:1
                         animations:^{
                             brown.center = CGPointMake(center.x-deltaX, center.y-deltaY);
                             red.center = CGPointMake(center.x+deltaX, center.y+deltaY);
                             green.center = CGPointMake(center.x+deltaX, center.y -deltaY);
                             violet.center = CGPointMake(center.x-deltaX, center.y+deltaY);
                         }
                         completion:^(BOOL finished){
                             [UIView animateWithDuration:1
                                              animations:^{
                                                  brown.center = CGPointMake(center.x-deltaX, center.y-deltaY+100);
                                                  red.center = CGPointMake(center.x+deltaX, center.y+deltaY-100);
                                                  green.center = CGPointMake(center.x+deltaX-100, center.y -deltaY);
                                                  violet.center = CGPointMake(center.x-deltaX+100, center.y+deltaY);                                              }
                                              completion:^(BOOL finished){
                                                  [UIView animateWithDuration:1
                                                                   animations:^{
                                                                       red.center = CGPointMake(center.x-deltaX, center.y-deltaY+100);
                                                                       brown.center = CGPointMake(center.x+deltaX, center.y+deltaY-100);
                                                                       violet.center = CGPointMake(center.x+deltaX-100, center.y -deltaY);
                                                                       green.center = CGPointMake(center.x-deltaX+100, center.y+deltaY);
                                                                   }
                                                                   completion:^(BOOL finished){
                                                                       [UIView animateWithDuration:1
                                                                                        animations:^{
                                                                                            [self vitri];
                                                                                        }
                                                                                        completion:^(BOOL finished){[self Animate];}];
                                                                   
                                                                   }];
                                                  
                                              }];
                       
                         }];
}

-(void)vitri{
    red.center = center;
    violet.center = center;
    brown.center = center;
    green.center = center;
}
-(void)onMusic{
    NSString *soundFilPath = [[NSBundle mainBundle] pathForResource:@"Counting Stars" ofType:@"mp3"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilPath];
    self.backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    self.backgroundMusic.numberOfLoops = -1;
    self.backgroundMusic.currentTime = 0;
    [self.backgroundMusic play];
    
                            
}
@end
