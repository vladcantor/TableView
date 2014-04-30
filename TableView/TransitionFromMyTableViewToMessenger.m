//
//  TransitionFromMyTableViewToMessenger.m
//  TableView
//
//  Created by Macos on 4/24/14.
//  Copyright (c) 2014 macos. All rights reserved.
//

#import "TransitionFromMyTableViewToMessenger.h"
#import "SharedData.h"

@implementation TransitionFromMyTableViewToMessenger

// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.4;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    MyTableViewController* fromtv = (MyTableViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    MessangerViewController* tovc = (MessangerViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *container = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    // Get a snapshot of the thing cell we're transitioning from
    NSIndexPath *ind = [SharedData sharedInstance].cellIndex;
    
    MyTableViewCell *cell = (MyTableViewCell*)[fromtv.tableView cellForRowAtIndexPath:ind];
    UIView *snapShot = [cell.cellImageView snapshotViewAfterScreenUpdates:NO];
    snapShot.frame = [container convertRect:cell.cellImageView.frame fromView:cell.cellImageView.superview];
    
       cell.imageView.hidden = YES;
//    UIGraphicsBeginImageContextWithOptions(tovc.view.frame.size, YES, 0);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    [tovc.view drawRect:tovc.view.frame];
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    UIImageView *imgv = [[UIImageView alloc] initWithImage:img];
//    
//    UIView *snapShot = [imgv snapshotViewAfterScreenUpdates:NO];
//    snapShot.frame = [container convertRect:cell.cellImageView.frame fromView:cell.cellImageView.superview];
//    //snapShot.frame = [container convertRect:tovc.view.frame fromView:cell.cellImageView];
//    tovc.view.hidden = YES;

    
                        // Setup the initial view states
                        tovc.view.frame = [transitionContext finalFrameForViewController:tovc];
                        tovc.view.alpha = 0;
                        tovc.accountPhoto.hidden = YES;
                        
                        [container addSubview:tovc.view];
                        [container addSubview:snapShot];
   
    [UIView animateWithDuration:duration  animations:^{
        // Fade in the second view controller's view
        tovc.view.alpha = 1.0;
        
        
        
        // Move the cell snapshot so it's over the second view controller's image view
        CGRect frame2 = [container convertRect:tovc.view.frame fromView:tovc.view];
        snapShot.frame = frame2;
    } completion:^(BOOL finished) {
        // Clean up
        
        tovc.accountPhoto.hidden = NO;
        cell.hidden = NO;
        //[snapShot removeFromSuperview];
        
        // Declare that we've finished
        //[transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        NSInteger opt = UIViewAnimationOptionBeginFromCurrentState;
        [UIView animateWithDuration:duration delay:0 options:opt animations:^{
            // Fade in the second view controller's view
            tovc.view.alpha = 1.0;
            
            
            
            // Move the cell snapshot so it's over the second view controller's image view
            CGRect frame2 = [container convertRect:tovc.accountPhoto.frame fromView:tovc.view];
            snapShot.frame = frame2;
        } completion:^(BOOL finished) {
            // Clean up
            
            tovc.accountPhoto.hidden = NO;
            cell.hidden = NO;
            [snapShot removeFromSuperview];
            
            // Declare that we've finished
            [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        }];

    }];
  

   
   
}


@end
