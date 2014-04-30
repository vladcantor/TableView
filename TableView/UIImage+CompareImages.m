//
//  UIImage+CompareImages.m
//  TableView
//
//  Created by Macos on 4/18/14.
//  Copyright (c) 2014 macos. All rights reserved.
//

#import "UIImage+CompareImages.h"

@implementation UIImage (CompareImages)

-(BOOL)image:(UIImage*)image1 isEqualTo:(UIImage*) image2{
    NSData* data1 = UIImagePNGRepresentation(image1);
    NSData* data2 = UIImagePNGRepresentation(image2);
    return[data1 isEqual:data2];
}

@end
