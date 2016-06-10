//
//  HighScoreViewController.m
//  EyeSpy
//
//  Created by DetroitLabs on 6/8/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "HighScoreViewController.h"
#import "User.h"

@interface HighScoreViewController ()
@property (weak, nonatomic) IBOutlet UITableView *table1;
@property (weak, nonatomic) IBOutlet UITableView *table2;

@end

@implementation HighScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",[[eyespy2Sorted  objectAtIndex:indexPath.row] eyespy2HighScore]];
        // Configure the cell...
        //    cell.textLabel.text = NSStringFromClass([[_classes objectAtIndex:indexPath.row] class]);
    //    cell.textLabel.text = [[_classes objectAtIndex:indexPath.row] sayName];
        return cell;
    } else {
        NSArray *eyespy3Sorted = [_userDatabase sortedArrayUsingSelector:@selector(compareEyespy3:)];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        cell.textLabel.text = [[eyespy3Sorted objectAtIndex:indexPath.row] username];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",[[eyespy3Sorted objectAtIndex:indexPath.row] eyespy3HighScore]];
        // Configure the cell...
        //    cell.textLabel.text = NSStringFromClass([[_classes objectAtIndex:indexPath.row] class]);
        //    cell.textLabel.text = [[_classes objectAtIndex:indexPath.row] sayName];
        return cell;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
