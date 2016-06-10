//
//  GameViewController.m
//  EyeSpy
//
//  Created by DetroitLabs on 6/8/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//
#import "GameViewController.h"
#import "HighScoreViewController.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *foundLabel;
@property (weak, nonatomic) IBOutlet UILabel *toGoLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *objectToFindLabel;

@property Image *currentImage;
@end

// Instance of Image Class
Image *image1;
Image *image2;
int objectPointer;
// Timer Setup
NSTimer *timer;
int timeTick;

@implementation GameViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    timeTick = 0;
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(myTicker) userInfo:nil repeats:YES];
    
    [self initImage];
    _toGoLabel.text = [NSString stringWithFormat:@"Items to Go: %ld", [_currentImage.objectsToBeFound count]];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(checkUserTap:)];
    [_imageInPlay addGestureRecognizer:tap];
    _objectToFindLabel.text = [NSString stringWithFormat:@"I spy a %@.....", _currentImage.objectsToBeFound[0]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initImage{
    
    image1 = [[Image alloc] init];
    image1.locations = @[@[@120, @240, @140, @274], @[@155,@213,@175,@228]];
    image1.objectsToBeFound = @[@"Number 6", @"Frog"];
    image1.image = [UIImage imageNamed:@"eyespy2.jpg"];
    
    image2 = [[Image alloc] init];
    image2.locations = @[@[@251, @231, @276, @256], @[@235,@192,@271,@230]];
    image2.objectsToBeFound = @[@"8 Ball", @"Mask"];
    image2.image = [UIImage imageNamed:@"eyespy3.jpeg"];
    
    
    if([_selectedImage isEqualToString:@"image1"]){
        _imageInPlay.image = image1.image;
        _currentImage = image1;
        
    } else {
        _imageInPlay.image = image2.image;
        _currentImage = image2;
    }
}

- (void)checkUserTap:(UITapGestureRecognizer *)recognizer {
    
    CGPoint location = [recognizer locationInView:self.view];
    NSNumber *myXFloat = [NSNumber numberWithFloat:floor(location.x)];
    NSNumber *myYFloat = [NSNumber numberWithFloat:floor(location.y)];
    
    NSLog(@"%@", myXFloat);
    NSLog(@"%@", myYFloat);
    
    NSUInteger numberOfItems = [_currentImage.objectsToBeFound count];
    _objectToFindLabel.text = [NSString stringWithFormat:@"I spy a %@.....", _currentImage.objectsToBeFound[objectPointer]];
    if ( myYFloat > _currentImage.locations[objectPointer][1] && myYFloat < _currentImage.locations[objectPointer][3] && myXFloat > _currentImage.locations[objectPointer][0] && myXFloat < _currentImage.locations[objectPointer][2]) {
        NSLog(@"You found %@", _currentImage.objectsToBeFound[objectPointer]);
        _foundLabel.text = [NSString stringWithFormat:@"Found: %i", objectPointer + 1];
        if(objectPointer + 1 == numberOfItems){
            [timer invalidate];
            [self setUserhighScore: timeTick];
            UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Congrats!" message:[NSString stringWithFormat:@"You won\nYou finished in %d seconds", timeTick] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"High Scores" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action)
                                          {
                                              [self performSegueWithIdentifier:@"highScoreSegue" sender:self];
                                          }];
            [alertView addAction:alertAction];
            [self presentViewController:alertView animated:YES completion:nil];
        }
        objectPointer++;
    }else {
        NSLog(@"Not correct");
    }
}

- (void)setUserhighScore:(int)userNewTime{
    for (User *user in _userDatabase) {
        if (_currentUser.username == user.username) {
            if (user.eyespy2HighScore > (double)userNewTime && _currentImage == image1) {
                user.eyespy2HighScore = (double)userNewTime;
                NSLog(@"%f", user.eyespy2HighScore);
            }
            if (user.eyespy3HighScore > (double)userNewTime && _currentImage == image2) {
                user.eyespy3HighScore = (double)userNewTime;
                NSLog(@"%f", user.eyespy3HighScore);
            }
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    HighScoreViewController *vc =[segue destinationViewController];
    vc.userDatabase = _userDatabase;
}


- (void)myTicker {
    sleep(.5);
    timeTick++;
    NSString *timeString =[[NSString alloc] initWithFormat:@"%d", timeTick];
    _timerLabel.text = timeString;
   
}


@end