//
//  GradeModel.m
//  GenericModel
//
//  Created by zyma on 5/1/15.
//  Copyright (c) 2015 zyma678. All rights reserved.
//

#import "GradeModel.h"

@implementation GradeModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _students = (NSMutableArray<StudentModel> *)[[NSMutableArray alloc] init];
    }
    return self;
}

@end
