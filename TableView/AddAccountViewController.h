//
//  AddAccountViewController.h
//  TableView
//
//  Created by Macos on 4/16/14.
//  Copyright (c) 2014 macos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"



@protocol AddAccount

-(void)newAccountEdit:(Account*) acc;

@end


@interface AddAccountViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIButton *choosePhotoBtn;
@property (weak, nonatomic) IBOutlet UIImageView *uiImagePicking;
@property (weak, nonatomic) IBOutlet UIButton *addNewAccountBtn;
@property(nonatomic, assign) id< AddAccount> delegate;
-(IBAction)getPhoto:(id)sender;
-(IBAction)addBtn:(id)sender;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end
