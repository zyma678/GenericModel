//
//  FriendsModel.m
//  GenericModel
//
//  Created by zyma on 5/1/15.
//  Copyright (c) 2015 zyma678. All rights reserved.
//

#import "FriendsModel.h"

@implementation FriendsModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _friendDic = [[NSMutableDictionary alloc] init];
    }
    return self;
}

@end
