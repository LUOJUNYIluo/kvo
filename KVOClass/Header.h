//
//  Header.h
//  KVOClass
//
//  Created by EOC on 2017/5/27.
//  Copyright © 2017年 八点钟学院. All rights reserved.
//

#ifndef Header_h
#define Header_h


/*
 
 VIP信息助教可可QQ：2045026094
 ios学习交流QQ群：272306631
 课堂代码找助教可可  QQ：272306631
 
 */




/*
 
 利用运行时， 生成一个对象的子类，并生成子类对象，并替换原来对象的isa指针
 并且重写了set方法
 
 */

NSLog(@"before:%s", object_getClassName(_eocFamily));

NSLog(@"after:%s", object_getClassName(_eocFamily));


NSLog(@"before:%@", [ViewController findSubClass:[_eocFamily class]]);

NSLog(@"after:%@", [ViewController findSubClass:[_eocFamily class]]);



#endif /* Header_h */
