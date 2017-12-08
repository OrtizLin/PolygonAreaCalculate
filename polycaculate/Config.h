//
//  Config.h
//  polycaculate
//
//  Created by Otis Lin on 2017/12/8.
//  Copyright © 2017年 Otis Lin. All rights reserved.
//

#ifndef Config_h
#define Config_h

#ifdef Dev
#define kHost @"THIS IS DEV"
#elif Master
#define kHost @"THIS IS Master"
#else
#define kHost @"THIS IS else"
#endif

#endif /* Config_h */
