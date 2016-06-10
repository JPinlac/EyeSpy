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
    self.eyespy2HighScore = 80085;
    self.eyespy3HighScore = 80085;
    return self;
}

- (NSComparisonResult)compareEyespy2:(User *)otherObject {
    return self.eyespy2HighScore > otherObject.eyespy2HighScore;
}

- (NSComparisonResult)compareEyespy3:(User *)otherObject {
    return self.eyespy3HighScore > otherObject.eyespy3HighScore;
}
@end
