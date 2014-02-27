//
//  PlayingCard.h
//  BlackJack
//
//  Created by Student on 2/20/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : int{
    PlayingCardSuitClub,
    PlayingCardSuitSpade,
    PlayingCardSuitDiamond,
    PlayingCardSuitHeart,
    
}PlayingCardSuit;

@interface PlayingCard : NSObject

@property (nonatomic) PlayingCardSuit suit;
@property (nonatomic) int value;
@property (nonatomic) BOOL isFaceUp;

-(BOOL) isAnAce;
-(BOOL) isAFaceOrTenCard;
-(UIImage *)getCardImage;
+(NSMutableArray *) createDeck;

@end
