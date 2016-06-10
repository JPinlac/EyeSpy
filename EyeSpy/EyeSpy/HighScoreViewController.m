//
//  HighScoreViewController.m
//  EyeSpy
//
//  Created by DetroitLabs on 6/8/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "HighScoreViewController.h"
#import "User.h"
#import "StartViewController.h"

@interface HighScoreViewController ()
@property (weak, nonatomic) IBOutlet UITableView *table1;
@property (weak, nonatomic) IBOutlet UITableView *table2;
@property (weak, nonatomic) IBOutlet UIButton *tryAgainButton;

@end

User *thePlayerHighScore;

@implementation HighScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tryAgainButton.layer.cornerRadius = 3;
    _tryAgainButton.layer.borderWidth = 1;
    _tryAgainButton.layer.borderColor = [UIColor blackColor].CGColor;
    thePlayerHighScore = [[User currentUser]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_userDatabase count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(tableView == _table1){
        NSArray *eyespy2Sorted = [_userDatabase sortedArrayUsingSelector:@selector(compareEyespy2:)];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.textLabel.text = [[eyespy2Sorted  objectAtIndex:indexPath.row] username];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@s",[self formatInterval:[[eyespy2Sorted  objectAtIndex:indexPath.row] eyespy2HighScore]]];
        return cell;
    } else {
        NSArray *eyespy3Sorted = [_userDatabase sortedArrayUsingSelector:@selector(compareEyespy3:)];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        cell.textLabel.text = [[eyespy3Sorted objectAtIndex:indexPath.row] username];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@s",[self formatInterval:[[eyespy3Sorted objectAtIndex:indexPath.row] eyespy3HighScore]]];
        return cell;
    }
}

- (NSString *) formatInterval: (NSTimeInterval) interval{
    unsigned long milliseconds = interval;
    unsigned long seconds = milliseconds / 10;
    milliseconds %= 1000;
    unsigned long minutes = seconds / 60;
    seconds %= 60;
    unsigned long hours = minutes / 60;
    minutes %= 60;
    
    NSMutableString * result = [NSMutableString new];
    
    if(hours)
//        [result appendFormat: @"%ld:", hours];
    
    [result appendFormat: @"%ld:", minutes];
    [result appendFormat: @"%ld:", seconds];
    [result appendFormat: @"%ld",milliseconds];
    
    return result;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    StartViewController *vc =[segue destinationViewController];
    vc.userDatabase = _userDatabase;
}


@end
