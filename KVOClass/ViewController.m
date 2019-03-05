//
//  ViewController.m
//  KVOClass
//
//  Created by class on 13/01/2017.
//  Copyright © 2017 八点钟学院. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    EOCFamily *_eocFamily;
}

@end

/**
 
 NSOperation
 NSOperationQueue
 RAC
 
  KVO 观察者模式
  观察者，被观察的对象属性  移除观察者
 
 */
@implementation ViewController


/*
 NSKeyValueObservingOptionNew 返回新值
 NSKeyValueObservingOptionOld  返回旧值
 NSKeyValueObservingOptionInitial 再注册的时候发送一次通知，在改变的也会发送通知
 NSKeyValueObservingOptionPrior 改变之前，发送一次通知，改变之后再发送一次通知
 
 NSKeyValueChangeKey
 
 利用运行时， 生成一个对象的子类，并生成子类对象，并替换原来对象的isa指针
 并且重写了set方法
 
 //  NSLog(@"before:%s", object_getClassName(_eocFamily));
 //   NSLog(@"before:%@", [ViewController findSubClass:[_eocFamily class]]);
 
 // NSLog(@"after:%s", object_getClassName(_eocFamily));
 //  NSLog(@"after:%@", [ViewController findSubClass:[_eocFamily class]]);
 
 //    // 在一定条件触发通知
 //    NSString *name = @"eoc";
 //    _eocFamily.name = name;
 //    NSLog(@"one:%p", _eocFamily.name);
 
 // _eocFamily.eocAry = [NSMutableArray new];

 
 KVC 就是KVO 入口


NSMutableArray *tmpAry =  [_eocFamily mutableArrayValueForKeyPath:@"eocAry"];
NSLog(@"tmpAry:%s", object_getClassName(tmpAry));
NSLog(@"eocAry:%s", object_getClassName(_eocFamily.eocAry));

[[_eocFamily mutableArrayValueForKeyPath:@"eocAry"] addObject:@"one"];


 */


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _eocFamily = [EOCFamily new];
    
    _eocFamily.name = @"EOC_Old";
    
 
    [_eocFamily addObserver:self forKeyPath:@"person" options:NSKeyValueObservingOptionNew context:nil];
    
    
    _eocFamily.person.age = @"11";
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    NSString *tempName = @"eoc";
//    _eocFamily.name = tempName;
//    NSLog(@"two:%p", _eocFamily.name);
    
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
   
    NSLog(@"%@", change);
}


+ (NSArray*)findSubClass:(Class)defaultClass
{
    int count = objc_getClassList(NULL, 0);
    if (count <= 0) {
        return [NSArray array];
    }
    NSMutableArray *output = [NSMutableArray arrayWithObject:defaultClass];
    Class *classes = (Class*)malloc(sizeof(Class)*count);
    objc_getClassList(classes, count);
    for (int i = 0; i < count; i++) {
        if (defaultClass == class_getSuperclass(classes[i])) {
            [output addObject:classes[i]];
        }
    }
    free(classes);
    return output;
}

@end
