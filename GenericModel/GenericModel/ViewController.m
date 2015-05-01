//
//  ViewController.m
//  GenericModel
//
//  Created by zyma on 5/1/15.
//  Copyright (c) 2015 zyma678. All rights reserved.
//

#import "ViewController.h"
#import "GenericModel.h"
#import "StudentModel.h"
#import "GradeModel.h"
#import "FriendsModel.h"
#import "SubStudentModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testGenericModel];
}

- (void)testGenericModel{
    /** NSDictionary -> Model */
    [self simpleDicToModel];
    /** Model -> NSDictionary */
    [self simpleModelToDic];
    /** (Model Include NSSArray) -> NSDictionary */
    [self modelIncludearrayToDic];
    /** NSDictionary -> (Model Include NSSArray) */
    [self dicToModelIncludearray];
    /** (Model Include NSDictionary) -> NSDictionary */
    [self modelIncludeDicToDic];
    /** NSDictionary -> (Model Include NSDictionary) */
    [self  dicToModelIncludeDic];
    /** (model extended by other model) -> NSDictionary */
    [self modelExtendedByOtherModelToDic];
    /** NSDictionary -> (model extended by other model) */
    [self dicTomodelExtendedByOtherModel];
}

/** NSDictionary -> Model */
- (void)simpleDicToModel{
    NSDictionary *studentDic = @{
                                 @"name" : @"Name1",
                                 @"hobby": @"Basketball",
                                 @"age"  : @(25)};
    
    StudentModel *studentModel = [GenericModel getObjectByDictionary:studentDic clazz:[StudentModel class]];
    NSLog(@"studentModel:name:%@, hobby:%@, age:%ld",studentModel.name, studentModel.hobby, (long)studentModel.age);
}

/** Model -> NSDictionary */
- (void)simpleModelToDic{
    StudentModel *student2 = [[StudentModel alloc] init];
    student2.name = @"Name2";
    student2.hobby = @"Football";
    student2.age = 13;
    NSDictionary *studentDic2 = [GenericModel getDictionaryByObject:student2];
    NSLog(@"studentDic:%@",studentDic2.description);
}

/** (Model Include NSSArray) -> NSDictionary */
- (void)modelIncludearrayToDic{
    /**
     * (Model Include NSSArray) -> NSDictionary
     */
    StudentModel *student_1 = [[StudentModel alloc] init];
    student_1.name = @"student_1";
    student_1.hobby = @"BasketBall";
    student_1.age = 15;
    
    StudentModel *student_2 = [[StudentModel alloc] init];
    student_2.name = @"student_2";
    student_2.hobby = @"Football";
    student_2.age = 14;
    
    GradeModel *gradeMode = [[GradeModel alloc] init];
    [gradeMode.students addObject:student_1];
    [gradeMode.students addObject:student_2];
    
    NSDictionary *gradeDic = [GenericModel getDictionaryByObject:gradeMode];
    NSLog(@"gradeDic:%@",gradeDic.description);
}

/** NSDictionary -> (Model Include NSSArray) */
- (void)dicToModelIncludearray{
    /**
     * NSDictionary -> (Model Include NSSArray)
     */
    NSDictionary *gradeDic2 = @{
                                @"students" : @[
                                        @{
                                            @"name" : @"Name1",
                                            @"hobby": @"Football",
                                            @"age"  : @(13)},
                                        @{
                                            @"name" : @"Name2",
                                            @"hobby": @"Basketball",
                                            @"age"  : @(14)},
                                        @{
                                            @"name" : @"Name3",
                                            @"hobby": @"Basketball",
                                            @"age"  : @(15)}]
                                };
    GradeModel *gradeMode2 = [GenericModel getObjectByDictionary:gradeDic2 clazz:[GradeModel class]];
    for (StudentModel *mode in gradeMode2.students) {
        NSLog(@"studentModel:name:%@, hobby:%@, age:%ld",mode.name, mode.hobby, (long)mode.age);
    }
}

/** (Model Include NSDictionary) -> NSDictionary */
- (void)modelIncludeDicToDic{
    FriendsModel *friends = [[FriendsModel alloc] init];
    NSDictionary *tempFriendsDic = @{
                                     @"friend1" : @{
                                             @"name" : @"Name1",
                                             @"hobby": @"Football",
                                             @"age"  : @(13)},
                                     @"friend2" : @{
                                             @"name" : @"Name2",
                                             @"hobby": @"Basketball",
                                             @"age"  : @(14)},
                                     @"friend3" : @{
                                             @"name" : @"Name3",
                                             @"hobby": @"Basketball",
                                             @"age"  : @(15)}
                                     };
    friends.friendDic = (NSMutableDictionary<StudentModel> *)tempFriendsDic;
    NSDictionary *friendsDic = [GenericModel getDictionaryByObject:friends];
    NSLog(@"friendsDic:%@",friendsDic);
}

/** NSDictionary -> (Model Include NSDictionary) */
- (void)dicToModelIncludeDic{
    NSDictionary *friendsDicModel = @{
                                      @"friendDic" : @{
                                              @"friend1" : @{
                                                      @"name" : @"Name1",
                                                      @"hobby": @"Football",
                                                      @"age"  : @(13)},
                                              @"friend2" : @{
                                                      @"name" : @"Name2",
                                                      @"hobby": @"Basketball",
                                                      @"age"  : @(14)},
                                              @"friend3" : @{
                                                      @"name" : @"Name3",
                                                      @"hobby": @"Basketball",
                                                      @"age"  : @(15)}
                                              }
                                      };
    FriendsModel *friends = [GenericModel getObjectByDictionary:friendsDicModel clazz:[FriendsModel class]];
    NSLog(@"friends:%@",friends.friendDic.description);
}

/** (model extended by other model) -> NSDictionary */
- (void)modelExtendedByOtherModelToDic{
    SubStudentModel *subStudentModel = [[SubStudentModel alloc] init];
    subStudentModel.name = @"student_1";
    subStudentModel.hobby = @"BasketBall";
    subStudentModel.age = 15;
    subStudentModel.birthName = @"birthName1";
    NSDictionary *subStudentDic = [GenericModel getDictionaryByObject:subStudentModel];
    NSLog(@"subStudentDic:%@",subStudentDic);
}

/** NSDictionary -> (model extended by other model) */
- (void)dicTomodelExtendedByOtherModel{
    NSDictionary *subStudentDic = @{
                                 @"name" : @"Name1",
                                 @"hobby": @"Basketball",
                                 @"age"  : @(25),
                                 @"birthName" : @"birthName1"};
    
    SubStudentModel *subStudentModel = [GenericModel getObjectByDictionary:subStudentDic clazz:[SubStudentModel class]];
    NSLog(@"studentModel:name:%@, hobby:%@, age:%ld , birthName:%@",subStudentModel.name, subStudentModel.hobby, (long)subStudentModel.age, subStudentModel.birthName);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
