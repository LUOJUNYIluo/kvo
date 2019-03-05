//
//  EOCFamily.m
//  KVOClass
//
//  Created by EOC on 2017/5/1.
//  Copyright © 2017年 八点钟学院. All rights reserved.
//

#import "EOCFamily.h"

@implementation EOCFamily


- (instancetype)init{
    
    self = [super init];
    if (self) {
        _person = [EOCPerson new];
        _eocAry = [NSMutableArray new];
    }
    return self;
}


//+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
//
//    if ([key isEqualToString:@"name"]) {
//        return NO;
//    }
//    return YES;
//}


- (void)setName:(NSString *)name{
    
    [self willChangeValueForKey:name];
    _name = @"name";
    [self didChangeValueForKey:name];
}

//- (void)willChangeValueForKey:(NSString *)key{
//    
//    NSLog(@"%s", __func__);
//    [super willChangeValueForKey:key];
//    
//}

//- (void)didChangeValueForKey:(NSString *)key{
//    
//    NSLog(@"%s", __func__);
//    [super didChangeValueForKey:key];
//}



+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key
{
    
    NSSet *keySet = [super keyPathsForValuesAffectingValueForKey:key];
    
    if ([key isEqual:@"person"]) {
        
        NSSet *set = [NSSet setWithObject:@"_person.age"];
        keySet = [keySet setByAddingObjectsFromSet:set];
        
    }
    return  keySet;
}

@end
