//
//  GameModel.m
//  BlackJack
//
//  Created by Student on 2/24/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel{
    NSMutableArray *_cards;
    NSMutableArray *_playerCards;
    NSMutableArray *_dealerCards;
    BOOL _didDealerWin;
}

// you already wrote nextCard last time
-(PlayingCard *)nextCard{
    PlayingCard *card = _cards[0];
    [_cards removeObjectAtIndex:0];
    return card;
}

-(BOOL)areCardsBust:(NSMutableArray *)cards{
#warning areCardsBust: missing implementation
    return NO;
}

-(int)calculateBestScore:(NSMutableArray *)cards{
#warning calculateBestScore: missing implementation
    return 0;
}

-(void)calculateWinner{
#warning calculateWinner: missing implementation
}

-(void) notifyGameDidEnd{
#warning notifyGameDidEnd missing implementation
}

#pragma mark - Helper Methods
-(NSMutableArray *) shuffle:(NSMutableArray *)array{
    int i, randomPosition;
    int numElements = [array count];
    id tempElement;
    
    for(i = 0; i <numElements; i++){
        randomPosition = arc4random_uniform(numElements);
        tempElement = array[i];
        array[i] = array[randomPosition];
        array[randomPosition] = tempElement;
    }
    
    return array;
}

-(PlayingCard *)drawDealerCard{
    PlayingCard *card = [self nextCard];
    [_dealerCards addObject:card];
    return card;
}

-(PlayingCard *)drawPlayerCard{
    PlayingCard *card = [self nextCard];
    [_playerCards addObject:card];
    return card;
}

-(PlayingCard *)lastDealerCard{
    if (_dealerCards.count > 0) return [_dealerCards lastObject];
    return nil;
}

-(PlayingCard *)lastPlayerCard{
    if (_playerCards.count > 0) return [_playerCards lastObject];
    return nil;
}

-(PlayingCard *)playerCardAtIndex:(int)index{
    if (index < _playerCards.count) return _playerCards[index];
    return nil;
}

-(PlayingCard *)dealerCardAtIndex:(int)index{
    if (index < _dealerCards.count) return _dealerCards[index];
    return nil;
}

-(void)dealNewHand{
    _cards = [PlayingCard createDeck];
    [self shuffle: _cards];
    _playerCards = [NSMutableArray array];
    _dealerCards = [NSMutableArray array];
    self.gameStage = kGameStagePlayer;
    
}

-(void)updateGameStage{
    // game logic goes here
    // next time!
}
@end
