//
//  Account.h
//  TableView
//
//  Created by Macos on 4/14/14.
//  Copyright (c) 2014 macos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject
@property NSString* name;
@property UIImage* accountImage;
@property (nonatomic) NSMutableArray* slideshowImages;


-(id)initName:(NSString*) na :(NSString*) fileN;
-(id)initNameAndImage:(NSString*) na :(UIImage*) img;

-(void)encodeWithCoder:(NSCoder*) coder;
-(id)initWithCoder:(NSCoder*)decoder;
//+(NSString*)name;

@end
