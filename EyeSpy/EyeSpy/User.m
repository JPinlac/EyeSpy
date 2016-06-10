//
//  User.m
//  EyeSpy
//
//  Created by DetroitLabs on 6/9/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "User.h"

@implementation User
-(id)initUser:username :password{
    self.username = username;
    self.password = password;
    self.eyespy2HighScore = 59*10;
    self.eyespy3HighScore = 59*10;
    return self;
}
-(id)initUser:username :password :(double)eyespy2HighScore :(double)eyespy3HighScore{
    self.username = username;
    self.password = password;
    self.eyespy2HighScore = eyespy2HighScore;
    self.eyespy3HighScore = eyespy3HighScore;
    return self;
}
- (NSComparisonResult)compareEyespy2:(User *)otherObject {
    return self.eyespy2HighScore > otherObject.eyespy2HighScore;
}

- (NSComparisonResult)compareEyespy3:(User *)otherObject {
    return self.eyespy3HighScore > otherObject.eyespy3HighScore;
}


+ (User *)currentUser {
    static User *curentUser = nil;
    static dispatch_once_t onePredicate;
    
    dispatch_once(&onePredicate, ^ {
        curentUser = [[User alloc]init];
    });
    
    return curentUser;
}

@end
