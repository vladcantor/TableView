//
//  Account.m
//  TableView
//
//  Created by Macos on 4/14/14.
//  Copyright (c) 2014 macos. All rights reserved.
//

#import "Account.h"
#import <Foundation/Foundation.h>
@interface Account()


@end
@implementation Account{

//    NSString * _name ;
    
}
-(id)init{
    self = [super init];
    if(nil!= self){
        _name  = @"Default";
        NSData* myData = [[NSFileManager defaultManager] contentsAtPath:@"/Users/macos/Downloads/defaultImage.jpg" ] ;
        self.accountImage = [UIImage imageWithData:myData];
        self.slideshowImages = [[NSMutableArray alloc] init];
    
    }
    return self;
}

-(id)initNameAndImage:(NSString*) na :(UIImage*) img{
    self = [super init];
    if(nil != self)
    {
        _name = na;
        ;
        self.accountImage = img;
        self.slideshowImages = [[NSMutableArray alloc] init];
    }
    return self;

}

-(id)initName:(NSString*) na :(NSString*) fileN{
    self = [super init];
    if(nil != self)
    {
        _name = na;
        NSData* myData = [[NSFileManager defaultManager] contentsAtPath:fileN ] ;
        self.accountImage = [UIImage imageWithData:myData];
        self.slideshowImages = [[NSMutableArray alloc] init];
    }
        return self;
}
-(void)encodeWithCoder:(NSCoder*) coder{
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.accountImage forKey:@"image"];
    [coder encodeObject:[NSKeyedArchiver archivedDataWithRootObject:self.slideshowImages] forKey:@"slideShow"];
    
}
-(id)initWithCoder:(NSCoder*)decoder{
    self.name = [decoder decodeObjectForKey:@"name"];
    self.accountImage = [decoder decodeObjectForKey:@"image"];
    self.slideshowImages =[NSKeyedUnarchiver unarchiveObjectWithData:[decoder decodeObjectForKey:@"slideShow"]] ;
    return self;
}


@end
