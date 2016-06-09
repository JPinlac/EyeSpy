//
//  GameViewController.m
//  EyeSpy
//
//  Created by DetroitLabs on 6/8/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//
#import "GameViewController.h"

@interface GameViewController ()

@property Image *currentImage;
@end

Image *image1;
Image *image2;

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self initImage];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(checkUserTap:)];
    [_imageInPlay addGestureRecognizer:tap];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)checkUserTap:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:self.view];
    NSNumber *myXFloat = [NSNumber numberWithFloat:floor(location.x)];
    NSNumber *myYFloat = [NSNumber numberWithFloat:floor(location.y)];
    
    
    NSLog(@"%@", myXFloat);
    NSLog(@"%@", myYFloat);
    
    //myXFloat > displayedImage.location[0][0] && myXFloat < displayedImage.location[0][2]
    // find the number 6
    if ( myYFloat > _currentImage.locations[0][1] && myYFloat < _currentImage.locations[0][3] && myXFloat > _currentImage.locations[0][0] && myXFloat < _currentImage.locations[0][2]) {
        NSLog(@"You Found 6");
    }
    else {
        NSLog(@"Not correct");
    }
    
    
}


- (void)initImage{
    
    image1 = [[Image alloc] init];
    image1.locations = @[@[@120, @240, @140, @274], @[@0,@0,@0,@0]];
    image1.objectsToBeFound = @[@"Number 6", @"Frog"];
    image1.image = [UIImage imageNamed:@"eyespy2.jpg"];
    
    image2 = [[Image alloc] init];
    image2.locations = @[@[@0, @0, @0, @0], @[@0,@0,@0,@0]];
    image2.objectsToBeFound = @[@"8 Ball", @"Mask"];
    image2.image = [UIImage imageNamed:@"eyespy3.jpeg"];
    
    
    if([_selectedImage isEqualToString:@"image1"]){
        // UIImageVIew
        _imageInPlay.image = image1.image;
        //
        _currentImage = image1;
        
    } else {
        _imageInPlay.image = image2.image;
        _currentImage = image2;
    }
}


@end