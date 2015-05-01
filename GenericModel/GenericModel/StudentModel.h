//
//  StudentModel.h
//  GenericModel
//
//  Created by zyma on 5/1/15.
//  Copyright (c) 2015 zyma678. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GenericModel.h"

@protocol StudentModel @end
@interface StudentModel : GenericModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *hobby;
@property (nonatomic, assign) NSInteger age;

@end
