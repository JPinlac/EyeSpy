//
//  StartViewController.m
//  EyeSpy
//
//  Created by DetroitLabs on 6/8/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *game1;

@property (weak, nonatomic) IBOutlet UIImageView *game2;
@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UITapGestureRecognizer *tapImage1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(image1Tapped:)];
//    UITapGestureRecognizer *tapImage2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(image2Tapped:)];
//    
//    [_game1 addGestureRecognizer:tapImage1];
//    [_game1 addGestureRecognizer:tapImage2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Tap function setup for selecting game
//-(void)image1Tapped:(UIGestureRecognizer *)tap{
// 
//    _selectedQuestion = @"Turtle";
//    [self performSegueWithIdentifier:@"questionSeg" sender:self];
//}
//
//
//-(void)image2Tapped:(UIGestureRecognizer *)tap{
//    
//    _selectedQuestion = @"Turtle";
//    [self performSegueWithIdentifier:@"questionSeg" sender:self];
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end