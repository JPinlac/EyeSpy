//
//  GameViewController.m
//  EyeSpy
//
//  Created by DetroitLabs on 6/8/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//
#import "GameViewController.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageInPlay;

@end

Image *displayedImage;

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setImageCordsArray];
    
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
    if ( myYFloat > displayedImage.location[0][1] && myYFloat < displayedImage.location[0][3]) {
        NSLog(@"Yaaak Yaaak Yahhhh");
    }
    else {
        NSLog(@"Done Messed UP");
    }
}

- (void)setImageCordsArray {
    // Set UIImage to the pictures for the game
    UIImage *picture1 = [UIImage imageNamed:@"eyespy2.jpg"];
    UIImage *picture2 = [UIImage imageNamed:@"eyespy3.jpeg"];
    
    // Seting the image in imageView to eqaul eyespy2 image
    _imageInPlay.image = picture1;
    
    //This is the Image Object with the Arrays holding cords and names of the object to be found
    displayedImage = [[Image alloc]init];
    
    // Set the arrays with the cords of the objects in the Selected image
    if ( _imageInPlay.image == picture1){
        displayedImage.location = @[@[@120, @240, @140, @274]];
        displayedImage.objectToBeFound = @[@"number 6"];
        NSLog(@"Name:%@\nX: %@\nY: %@", displayedImage.objectToBeFound[0], displayedImage.location[0][0], displayedImage.location[0][1]);
    } else {
        NSLog(@"*****************");
    }
}


@end