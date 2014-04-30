//
//  MyViewController.h
//  TableView
//
//  Created by Macos on 4/16/14.
//  Copyright (c) 2014 macos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"
#import "AddAccountViewController.h"
#import "UIImage+CompareImages.h"

@protocol MyAction
-(BOOL)saveDatasFromMyViewController;
@end


@interface MyViewController : UIViewController <UIPickerViewAccessibilityDelegate,
UINavigationControllerDelegate >


@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editAccountButton;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIButton *choosePhotoButton;
@property(nonatomic) Account* currentAccount;
@property (weak, nonatomic) id<MyAction> delegate;
@property (weak, nonatomic) IBOutlet UIButton *saveAccountEditingButton;

-(IBAction)editAccount:(id)sender;
-(IBAction)choosePhoto:(id)sender;
-(IBAction)saveChanges:(id)sender;


@end
