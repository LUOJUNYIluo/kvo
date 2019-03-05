//
//  EOCFamily.h
//  KVOClass
//
//  Created by EOC on 2017/5/1.
//  Copyright © 2017年 八点钟学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EOCPerson.h"

@interface EOCFamily : NSObject


@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)EOCPerson *person;
@property (nonatomic, strong)NSMutableArray *eocAry;

@end
