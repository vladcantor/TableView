//
//  AddAccountViewController.m
//  TableView
//
//  Created by Macos on 4/16/14.
//  Copyright (c) 2014 macos. All rights reserved.
//

#import "AddAccountViewController.h"

@interface AddAccountViewController ()

@end

@implementation AddAccountViewController{
    UIImagePickerController *uiImgPick ;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
            }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    uiImgPick = [[UIImagePickerController alloc]init];
    self.addNewAccountBtn.userInteractionEnabled = NO;
    self.addNewAccountBtn.hidden = YES;
   
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)getPhoto:(id)sender{
    uiImgPick.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    uiImgPick.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    uiImgPick.allowsEditing = NO;
    uiImgPick.delegate = self;
    [self presentViewController:uiImgPick animated:YES completion:nil];
}
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    self.uiImagePicking.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    self.addNewAccountBtn.userInteractionEnabled = YES;
    self.addNewAccountBtn.hidden = NO;
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)addBtn:(id)sender{
    NSString* name = self.nameTextField.text;
    if((name != nil && ![name  isEqual: @""]) && (self.uiImagePicking.image != nil)){
        Account* acc = [[Account alloc] initNameAndImage:name :self.uiImagePicking.image ];
        [self.delegate newAccountEdit:acc];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Add Account Error" message:@"Neither Image and name fields should be empty!!!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.nameTextField endEditing:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
