//
//  FriendsModel.h
//  GenericModel
//
//  Created by zyma on 5/1/15.
//  Copyright (c) 2015 zyma678. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StudentModel.h"

@interface FriendsModel : GenericModel

@property (nonatomic, strong) NSMutableDictionary<StudentModel> *friendDic;

@end
