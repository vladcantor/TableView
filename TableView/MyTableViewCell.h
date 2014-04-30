//
//  MyTableViewCell.h
//  TableView
//
//  Created by Macos on 4/17/14.
//  Copyright (c) 2014 macos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddAccountViewController.h"
#import "Account.h"


@protocol AfterGesture

-(void)userMadeLeftSwipe:(int) currentIndex :(BOOL) hasPan;
-(void)userWantsToSendMessages:(int)currentIndex;

@end


@interface MyTableViewCell : UITableViewCell <UIGestureRecognizerDelegate, UIActionSheetDelegate>




@property (weak, nonatomic) IBOutlet UILabel *cellLabelForName;
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) id<AfterGesture> gestureDelegate;
@property ( nonatomic) int cuurentIndexInTableView;
@property (nonatomic) NSIndexPath* currentIndexPath;

-(void)performSwipeLeftGesture;

@end
