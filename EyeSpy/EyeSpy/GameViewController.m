//
//  GameViewController.m
//  EyeSpy
//
//  Created by DetroitLabs on 6/8/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageInPlayIV;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showGestureForTapRecognizer:)];
    [_imageInPlayIV addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)showGestureForTapRecognizer:(UITapGestureRecognizer *)recognizer {
    // Get the location of the gesture
    CGPoint location = [recognizer locationInView:self.view];
    NSLog(@"The location x is: %f", location.x);
    NSLog(@"The location y is: %f", location.y);
    
}


@end
