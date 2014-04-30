//
//  MyTableViewController.h
//  TableView
//
//  Created by Macos on 4/14/14.
//  Copyright (c) 2014 macos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddAccountViewController.h"
#import "MyViewController.h"
#import "MyTableViewCell.h"
#import "CodeWrittenViewController.h"
#import "MessangerViewController.h"
#import "CustomSegueTransitionLeftToRight.h"




@interface MyTableViewController : UITableViewController <AddAccount, MyAction, UIGestureRecognizerDelegate, UIActionSheetDelegate, UITableViewDataSource, UITableViewDelegate, AfterGesture, UINavigationControllerDelegate, UIImagePickerControllerDelegate, SaveData>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *reloadButton;
@property (weak, nonatomic)id<AddAccount> addAccountDelegate;
@property (weak, nonatomic)id<MyAction> actionDelegate;
@property (weak, nonatomic) id<SaveData> saveDelegate;
@property NSMutableArray* firstDatas;
@property NSMutableArray* datas;
@property (strong, nonatomic) UIStoryboardSegue* dropSegue;

-(IBAction)addAccount:(id)sender;
-(IBAction)reloadFirstData:(id)sender;

@end
