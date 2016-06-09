//
//  StartViewController.m
//  EyeSpy
//
//  Created by DetroitLabs on 6/8/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "StartViewController.h"
#import "GameViewController.h"

@interface StartViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *game1;
@property (weak, nonatomic) IBOutlet UIImageView *game2;
@property NSString *selectedImage;
@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tapImage1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(image1Tapped:)];
    UITapGestureRecognizer *tapImage2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(image2Tapped:)];
    
    [_game1 addGestureRecognizer:tapImage1];
    [_game2 addGestureRecognizer:tapImage2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Tap function setup for selecting game
-(void)image1Tapped:(UIGestureRecognizer *)tap{
    _selectedImage = @"image1";
    [self performSegueWithIdentifier:@"gameSegue" sender:self];
}


-(void)image2Tapped:(UIGestureRecognizer *)tap{
    _selectedImage = @"image2";
    [self performSegueWithIdentifier:@"gameSegue" sender:self];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    GameViewController *vc = [segue destinationViewController];
    vc.selectedImage = _selectedImage;
}


@end
