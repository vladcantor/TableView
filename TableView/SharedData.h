//
//  SharedData.h
//  TableView
//
//  Created by Macos on 4/25/14.
//  Copyright (c) 2014 macos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SynthesizeSingleton.h"

@interface SharedData : NSObject
{
    
}
@property (nonatomic) int index;
@property (nonatomic) NSIndexPath* cellIndex;

+(SharedData*)sharedInstance;
@end
