//
//  LoginViewController.m
//  EyeSpy
//
//  Created by DetroitLabs on 6/8/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *createAccountButton;
@property NSMutableArray *userDatabase;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [self  initUserDatabase];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initUserDatabase{
    _userDatabase = [[NSMutableArray alloc] initWithObjects:@"blind guy", @"visionoverrated", @"Jonathan", @"hunter22", nil];
}

-(IBAction)login{
    //checks to see if username is in database, then checks if the password matches
    NSUInteger userCount = [_userDatabase count];
    for(int x = 0; x < userCount; x++){
        if([_usernameLabel.text isEqualToString:_userDatabase[x]] && [_passwordLabel.text isEqualToString:_userDatabase[x+1]]){
            [self performSegueWithIdentifier:@"startSegue" sender:self];
        }
    }
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"NO!" message:@"The username and password you entered is incorrect" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Try again" style:UIAlertActionStyleCancel handler:nil];
    [alertView addAction:alertAction];
    [self presentViewController:alertView animated:YES completion:nil];
}
-(IBAction)createAccount{
    //add the username and label to temporary database
    [_userDatabase addObject:_usernameLabel.text];
    [_userDatabase addObject:_passwordLabel.text];
    NSLog(@"%@",_userDatabase.description);
    [self performSegueWithIdentifier:@"startSegue" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
