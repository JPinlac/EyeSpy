//
//  GameViewController.m
//  EyeSpy
//
//  Created by DetroitLabs on 6/8/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()


@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(checkUserTap:)];
//    [_imageInPlayIV addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)checkUserTap:(UITapGestureRecognizer *)recognizer {
//    CGPoint location = [recognizer locationInView:self.view];
//    NSNumber *myXFloat = [NSNumber numberWithFloat:location.x];
//    NSNumber *myYFloat = [NSNumber numberWithFloat:location.y];
//
//    
//    if (myXFloat > [objsToBeFound valueForKey:@"topX"] && myXFloat < [objsToBeFound valueForKey:@"bottomX"]) {
//        NSLog(@"Yaaak Yaaak Yahhhh");
//    }
//    else {
//        NSLog(@"Nope");
//    }
//}


@end
