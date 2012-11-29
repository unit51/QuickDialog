//
//  QPhotoElement.h
//  QuickDialog
//
//  Created by Florian Strauß on 06.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
typedef void(^QPhotoElementSuccess)(void);

extern NSString* const QPhotoElementImageChangedNotification;

#import "QRootElement.h"

@interface QPhotoElement : QRootElement <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *image;

@end
