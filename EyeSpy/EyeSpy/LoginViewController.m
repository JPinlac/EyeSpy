//
//  LoginViewController.m
//  EyeSpy
//
//  Created by DetroitLabs on 6/8/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"

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
    User *blindGuy = [[User alloc] initUser:@"blind guy":@"visionoverrated"];
    User *jonathan = [[User alloc] initUser:@"Jonathan":@"hunter22"];
    
//    _userDatabase = [[NSMutableArray alloc] initWithObjects:@"blind guy", @"visionoverrated", @"Jonathan", @"hunter22", nil];
    _userDatabase = [[NSMutableArray alloc] initWithObjects:blindGuy, jonathan, nil];
}

-(IBAction)login{
    //checks to see if username is in database, then checks if the password matches
    for(id object in _userDatabase){
        if([_usernameLabel.text isEqualToString:[object username]] && [_passwordLabel.text isEqualToString:[object password]]){
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
    User *newUser = [[User alloc] initUser:_usernameLabel.text:_passwordLabel.text];
    [_userDatabase addObject:newUser];
    NSLog(@"%@: %@",newUser.username, newUser.password);
    //alert that their user account has been created
//    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"NO!" message:@"The username and password you entered is incorrect" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Try again" style:UIAlertActionStyleCancel handler:nil];
//    [alertView addAction:alertAction];
//    [self presentViewController:alertView animated:YES completion:nil];
    [self performSegueWithIdentifier:@"startSegue" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
