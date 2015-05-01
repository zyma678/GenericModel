# GenericModel
Objective-C Model和JSON互相转换的简单高效框架

## Features
* GenericModel 支持Objectivc-c Model、NSDictionary、JSON之间互相转换，框架非常简单高效，内部字段反射设置有缓存，用Objective-C中的Protocol限定NSArray，NSDictionary等容器类的类型，防止容器类型变量类型使用错误，类似Java中容器类型的泛型。
* 支持的类型转换
  * `NSDictionary <--> Objective-C Model`
  * `JSON <--> Objective-C Model`
