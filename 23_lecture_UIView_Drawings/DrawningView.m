//
//  DrawningView.m
//  23_lecture_UIView_Drawings
//
//  Created by Slava on 28.04.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "DrawningView.h"

@implementation DrawningView

- (void)drawRect:(CGRect)rect {
   /*
    NSLog(@"drawRect = %@", NSStringFromCGRect(rect));
    
    
    CGRect square1 = CGRectMake(100, 100, 100, 100);
    CGRect square2 = CGRectMake(200, 200, 100, 100);
    CGRect square3 = CGRectMake(300, 300, 100, 100);
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();           // посмотреть
    
//    CGContextSetFillColor (FillColor) - заполняет цвет
//    CGContextSetStrokeColor (StrokeColor) - чертит границы
//    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    // заполнение цветом
//    CGContextFillRect(context, rect);
    
    CGContextAddRect(context, square1);
    CGContextAddRect(context, square2);
    CGContextAddRect(context, square3);
    
//    CGContextFillPath(context);
    CGContextStrokePath(context);
    
    // рисуем круг
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextAddEllipseInRect(context, square1);
    CGContextAddEllipseInRect(context, square2);
    CGContextAddEllipseInRect(context, square3);
    CGContextFillPath(context);

    // рисуем линии
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);             // цвет линии
    CGContextSetLineWidth(context, 2);                                                  // толщмна линии
    CGContextSetLineCap(context, kCGLineCapRound);                                      // сглаживание концов
    CGContextMoveToPoint(context, CGRectGetMinX(square1), CGRectGetMaxY(square1));      // первая точка
    CGContextAddLineToPoint(context, CGRectGetMinX(square3), CGRectGetMaxY(square3));   // вторая точка
    
    CGContextMoveToPoint(context, CGRectGetMaxX(square3), CGRectGetMinY(square3));
    CGContextAddLineToPoint(context, CGRectGetMaxX(square1), CGRectGetMinY(square1));
    CGContextStrokePath(context);
    
    // рисуем дугу
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);             // цвет линии
    CGContextMoveToPoint(context, CGRectGetMinX(square1), CGRectGetMaxY(square1));       // первая точка
    CGContextAddArc(context, CGRectGetMaxX(square1), CGRectGetMaxY(square1), CGRectGetWidth(square1), M_PI, 0, YES); // рисуем
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, CGRectGetMaxX(square3), CGRectGetMinY(square3));
    CGContextAddArc(context, CGRectGetMinX(square3), CGRectGetMinY(square3), CGRectGetWidth(square3), 0, M_PI, YES);
    CGContextStrokePath(context);

    // пишем текст
    NSString *text = @"Test";
    UIFont *font = [UIFont systemFontOfSize:14.f];
    NSShadow *shadow = [NSShadow new];
    shadow.shadowOffset = CGSizeMake(1, 1);
    shadow.shadowColor = [UIColor greenColor];
    shadow.shadowBlurRadius = 0.5;
    
    
    NSDictionary *attributies = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName,
                                                                             font,              NSFontAttributeName,
                                                                             shadow,            NSShadowAttributeName, nil];
    
    CGSize textSize = [text sizeWithAttributes:attributies];

    // выравниваем текст по центру
    CGRect textRect = CGRectMake(CGRectGetMidX(square2) - textSize.width / 2,
                                 CGRectGetMidY(square2) - textSize.height / 2, textSize.width, textSize.height);
    textRect = CGRectIntegral(textRect);    // округляет координаты
    [text drawInRect:textRect withAttributes:attributies];
    
    */
    NSLog(@"drawRect = %@", NSStringFromCGRect(rect));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // рисуем шахматную доску
    CGFloat offset = 50.f;
    CGFloat borderWidth = 2.f;
    
    CGFloat maxBoardSize = MIN(CGRectGetWidth(rect) - offset * 2 - borderWidth * 2,         // максимальный размер доски
                               CGRectGetHeight(rect) - offset * 2 - borderWidth * 2);
    // ширинка клетки
    int cellSize = (int) maxBoardSize / 8;
    int boardSize = cellSize * 8;
    
    CGRect boardRect = CGRectMake((CGRectGetWidth(rect) - boardSize) / 2,
                                  (CGRectGetHeight(rect) - boardSize) / 2,
                                  boardSize, boardSize);
    
    boardRect = CGRectIntegral(boardRect);
    
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            if (i % 2 != j % 2) {
                CGRect cellRect = CGRectMake(CGRectGetMinX(boardRect) + i * cellSize,
                                             CGRectGetMinY(boardRect) + j * cellSize,
                                             cellSize, cellSize);
                CGContextAddRect(context, cellRect);
            }
        }
    }
    
    
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    
    CGContextFillPath(context);
    
    
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextAddRect(context, boardRect);
    CGContextStrokePath(context);

    
}

@end
