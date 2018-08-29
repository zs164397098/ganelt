//
//  GaneltUserFormation.m
//  henoo
//
//  Created by 北京善康科技有限公司 on 2017/11/14.
//  Copyright © 2017年 北京善康科技有限公司. All rights reserved.
//

#import "GaneltUserFormation.h"

@implementation GaneltUserFormation
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.ACCOUNT forKey:@"ACCOUNT"];
    [aCoder encodeObject:self.PHONE forKey:@"PHONE"];
    [aCoder encodeObject:self.IDCARD forKey:@"IDCARD"];
    [aCoder encodeObject:self.AUTHENTICATION forKey:@"AUTHENTICATION"];
    [aCoder encodeObject:self.GRADE forKey:@"GRADE"];
    [aCoder encodeObject:self.STARRATING forKey:@"STARRATING"];
    [aCoder encodeObject:self.SEX forKey:@"SEX"];
    [aCoder encodeObject:self.AVATAR forKey:@"AVATAR"];
    [aCoder encodeObject:self.NAME forKey:@"NAME"];

}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.ACCOUNT =  [aDecoder decodeObjectForKey:@"ACCOUNT"];
        self.PHONE =  [aDecoder decodeObjectForKey:@"PHONE"];
        self.IDCARD =  [aDecoder decodeObjectForKey:@"IDCARD"];
        self.AUTHENTICATION =  [aDecoder decodeObjectForKey:@"AUTHENTICATION"];
        self.GRADE =  [aDecoder decodeObjectForKey:@"GRADE"];
        self.AVATAR =  [aDecoder decodeObjectForKey:@"AVATAR"];
        self.SEX =  [aDecoder decodeObjectForKey:@"SEX"];
        self.NAME =  [aDecoder decodeObjectForKey:@"NAME"];

    }
    return self;
}
- (BOOL)save
{
    NSString *path = [@"GaneltUserFormation" documentPath];
    return [NSKeyedArchiver archiveRootObject:self toFile:path];
}

+ (instancetype)getAccountInfo
{
    NSString *path = [@"GaneltUserFormation" documentPath];
    GaneltUserFormation *account = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return account;
}
@end
