//
//  HUD-ObjectiveC.m
//  StarWarsApi
//
//  Created by Erick on 31/08/17.
//  Copyright © 2017 Erick Alberto Morales Ledesma. All rights reserved.
//

#import "HUD-ObjectiveC.h"
#import "MBProgressHUD.h"

@implementation HUD_ObjectiveC

+(void)showProgressHUDView:(UIView*)view
{
    [MBProgressHUD showHUDAddedTo:view animated:YES];
}

+(void)hidenProgressHUDView:(UIView*)view
{
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
