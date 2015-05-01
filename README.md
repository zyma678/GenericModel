# GenericModel
Objective-C Model、JSON、NSDictionary互相转换简单高效的轻量级框架,支持model嵌套model。

## Features
* GenericModel 支持`Objective-C` `Model`、`NSDictionary`、`JSON`之间互相转换，框架非常简单高效，内部字段反射设置有缓存，用`Objective-C`中的`Protocol`限定`NSArray`，`NSDictionary`等`容器`类的类型，防止容器类型变量类型使用错误，类似`Java`中容器类型的`泛型`。
* 支持的类型转换
  * `NSDictionary <--> Model`
  * `JSON <--> Model`
 
## Example

### JSON -> Model
### JSON类型转换简单Model
```objc
//StudentModel.h
@protocol StudentModel @end
@interface StudentModel : GenericModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *hobby;
@property (nonatomic, assign) NSInteger age;

@end
```
```objc
//Example Code 
NSString *jsonString = @"{\"name\":\"Name1\", \"hobby\":\"Basketball\", \"age\":14}";
StudentModel *studentModel = [GenericModel getObjectByJSON:jsonString clazz:[StudentModel class]];
NSLog(@"studentModel:name:%@, hobby:%@, age:%ld",studentModel.name, studentModel.hobby, (long)studentModel.age);
```
```objc
//Output
2015-05-01 18:43:07.998 GenericModel[16634:359368] studentModel:name:Name1, hobby:Basketball, age:14
````
### Model --> JSON
### 简单Model转JSON类型
```objc
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
    
NSString *resultJSON = [GenericModel getJSONByObject:gradeMode];
NSLog(@"resultJSON:%@",resultJSON);
````
```objc
//Output
resultJSON:{"students":[{"name":"student_1","hobby":"BasketBall","age":15},{"name":"student_2","hobby":"Football","age":14}]}
````

### NSDictionary -> Model
### 字典类型转换简单Model
```objc
//Example Code 
NSDictionary *studentDic = @{
                             @"name" : @"Name1",
                             @"hobby": @"Basketball",
                             @"age"  : @(25)};
 
StudentModel *studentModel = [GenericModel
                              getObjectByDictionary:studentDic
                              clazz:[StudentModel class]];
                              
NSLog(@"studentModel:name:%@, hobby:%@, age:%ld",studentModel.name, studentModel.hobby, (long)studentModel.age);
```
```objc
//Output
studentDic:{
    age = 13;
    hobby = Football;
    name = Name2;
}
```
### Model -> NSDictionary
### 简单Model转换成字典
```objc
//Example Code 
StudentModel *student = [[StudentModel alloc] init];
student.name = @"Name2";
student.hobby = @"Football";
student.age = 13;
NSDictionary *studentDic = [GenericModel getDictionaryByObject:student];
 
NSLog(@"studentDic:%@",studentDic.description);
```
```objc
//Output
gradeDic:{
    students =     (
                {
            age = 15;
            hobby = BasketBall;
            name = "student_1";
        },
                {
            age = 14;
            hobby = Football;
            name = "student_2";
        }
    );
}
```
### (Model Include NSSArray) -> NSDictionary
### 带有数组的Model转换成字典
```objc
//Example Code 
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
```
```objc
//Output
gradeDic:{
    students =     (
                {
            age = 15;
            hobby = BasketBall;
            name = "student_1";
        },
                {
            age = 14;
            hobby = Football;
            name = "student_2";
        }
    );
}
```
### NSDictionary --> (Model Include NSSArray)
### 字典转换成带有数组的Model
```objc
//Example Code 
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
```
```objc
//Output
2015-05-01 17:29:37.673 GenericModel[14890:282213] studentModel:name:Name1, hobby:Football, age:13
2015-05-01 17:29:37.673 GenericModel[14890:282213] studentModel:name:Name2, hobby:Basketball, age:14
2015-05-01 17:29:37.673 GenericModel[14890:282213] studentModel:name:Name3, hobby:Basketball, age:15
```
### (Model Include NSDictionary) --> NSDictionary
### 带有字典的复杂model转化成字典
```objc
//Example Code 
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
```
```objc
//Output
friendsDic:{
    friendDic =     {
        friend1 =         {
            age = 13;
            hobby = Football;
            name = Name1;
        };
        friend2 =         {
            age = 14;
            hobby = Basketball;
            name = Name2;
        };
        friend3 =         {
            age = 15;
            hobby = Basketball;
            name = Name3;
        };
    };
}

```
### ((model extended by other model) -> NSDictionary
### 继承与其他model的model转化成字典
```objc
#import "StudentModel.h"

@interface SubStudentModel : StudentModel

@property (nonatomic, copy) NSString *birthName;

@end

```
```objc
//Example Code 
SubStudentModel *subStudentModel = [[SubStudentModel alloc] init];
subStudentModel.name = @"student_1";
subStudentModel.hobby = @"BasketBall";
subStudentModel.age = 15;
subStudentModel.birthName = @"birthName1";
NSDictionary *subStudentDic = [GenericModel getDictionaryByObject:subStudentModel];
NSLog(@"subStudentDic:%@",subStudentDic);
```
```objc
//Output
subStudentDic:{
    age = 15;
    birthName = birthName1;
    hobby = BasketBall;
    name = "student_1";
}
```

### NSDictionary --> (model extended by other model)
### 字典转化成继承与其他model的model
```objc
//Example Code 
NSDictionary *subStudentDic = @{
                             @"name" : @"Name1",
                             @"hobby": @"Basketball",
                             @"age"  : @(25),
                             @"birthName" : @"birthName1"};
    
SubStudentModel *subStudentModel = [GenericModel getObjectByDictionary:subStudentDic
                                                                 clazz:[SubStudentModel class]];
NSLog(@"studentModel:name:%@, hobby:%@, age:%ld , birthName:%@",
      subStudentModel.name,
      subStudentModel.hobby,
      (long)subStudentModel.age,
      subStudentModel.birthName);
```
```objc
//Output
2015-05-01 17:29:37.672 GenericModel[14890:282213] studentModel:name:Name1, hobby:Basketball, age:25
```
