//
//  GenericModel.h
//  GenericModel
//
//  Created by zyma on 5/1/15.
//  Copyright (c) 2015 zyma678. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GenericModel : NSObject

/**
 * NSDictionary -> Model
 */
+ (id)getObjectByDictionary:(NSDictionary *)dic clazz:(Class)clazz;

/**
 * Model -> NSDictionary
 */
+ (NSDictionary *)getDictionaryByObject:(id)object;

@end
