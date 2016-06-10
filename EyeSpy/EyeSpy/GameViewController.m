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
    for(int x = 0; x < numberOfItems; x++){
        //BUG If frog clicked first game ends
        _objectToFindLabel.text = [NSString stringWithFormat:@"I spy a %@.....", _currentImage.objectsToBeFound[x]];
        if ( myYFloat > _currentImage.locations[x][1] && myYFloat < _currentImage.locations[x][3] && myXFloat > _currentImage.locations[x][0] && myXFloat < _currentImage.locations[x][2]) {
            NSLog(@"You found %@", _currentImage.objectsToBeFound[x]);
            _foundLabel.text = [NSString stringWithFormat:@"Found: %i", x + 1];
            if(x + 1 == numberOfItems){
                [timer invalidate];
                [self setUserhighScore: timeTick];
                [self performSegueWithIdentifier:@"highScoreSegue" sender:self];
            }
         // Bug Here Need always getting Not Correct
        }else {
            NSLog(@"Not correct");
        }
    }
}

- (void)setUserhighScore:(int)userNewTime{
    for (User *user in _userDatabase) {
        if (_currentUser.username == user.username) {
            if (user.eyespy2HighScore < (double)userNewTime) {
                user.eyespy2HighScore = (double)userNewTime;
                NSLog(@"%f", user.eyespy2HighScore);
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