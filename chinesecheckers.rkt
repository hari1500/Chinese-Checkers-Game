;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ccboardmini) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;drawing board
(define l (above (triangle 60 'outline 'black) (rotate 180 (triangle 60 'outline 'black))))
(define (div-x-pieces img x count color)
  (cond [(= count x) img]
        [else (div-x-pieces (overlay/offset img 0 (let*([h (image-height img)])
                                                    (- (/ h 2) (* (/ h x) count)))
                                            (line (- 200 (* (/ 200 x) count)) 0 color))
                            x (+ count 1) color)]))

(define (apply-thrice img count color)
  (cond [(= 0 count) img]
        [else (apply-thrice (div-x-pieces (rotate 120 img) 4 0 color) (- count 1) color)]))

(define (r c) (above (t c) (rotate 180 (t c))))
(define (t c) (apply-thrice (triangle 200 100 c) 3 c))
(define board (overlay/xy (overlay (above (r "red") (r "green")) 
                       (rotate 60 (above (r "purple") (r "orange")))
                       (rotate 120 (above (r "blue") (r "brown")))) 400 0 (overlay (text "skip-move" 40 'blue) (rectangle 200 100 'outline 'blue))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;defining pawn c is color
(define (pawn c) (circle 10 "solid" c))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;(overlay/xy (overlay/xy (overlay/xy board 295 -10 (pawn "red")) 270 (/ (image-height board) 16) (pawn "red")) 320
;(/ (image-height board) 16) (pawn "red"))
(define H (/ (image-height board) 16))
(define-struct PLAYER (color list-of-posns))
;;PLAYER contains his pawns posn and color
;;defining two players
(define mohan (make-PLAYER "green" (list (make-posn 300 (image-height board))
                                         (make-posn 275 (- (image-height board) (/ (image-height board) 16)))
                                         (make-posn 325 (- (image-height board) (/ (image-height board) 16)))
                                         (make-posn 250 (- (image-height board) (/ (image-height board) 8)))
                                         (make-posn 300 (- (image-height board) (/ (image-height board) 8)))
                                         (make-posn 350 (- (image-height board) (/ (image-height board) 8)))
                                         (make-posn 225 (- (image-height board) (* 3 (/ (image-height board) 16))))
                                         (make-posn 275 (- (image-height board) (* 3 (/ (image-height board) 16))))
                                         (make-posn 325 (- (image-height board) (* 3 (/ (image-height board) 16))))
                                         (make-posn 375 (- (image-height board) (* 3 (/ (image-height board) 16)))))))
 (define hari (make-PLAYER "red" (list (make-posn 300 0)
                                 (make-posn 275 (/ (image-height board) 16))
                                 (make-posn 325 (/ (image-height board) 16))
                                 (make-posn 250 (/ (image-height board) 8))
                                 (make-posn 300 (/ (image-height board) 8))
                                 (make-posn 350 (/ (image-height board) 8))
                                 (make-posn 225 (* 3 (/ (image-height board) 16)))
                                 (make-posn 275 (* 3 (/ (image-height board) 16)))
                                 (make-posn 325 (* 3 (/ (image-height board) 16)))
                                 (make-posn 375 (* 3 (/ (image-height board) 16))))))
(define all-posns (list (make-posn 300 0)
                        (make-posn 275 (/ (image-height board) 16))
                        (make-posn 325 (/ (image-height board) 16))
                        (make-posn 250 (/ (image-height board) 8))
                        (make-posn 300 (/ (image-height board) 8))
                        (make-posn 350 (/ (image-height board) 8))
                        (make-posn 225 (* 3 (/ (image-height board) 16)))
                        (make-posn 275 (* 3 (/ (image-height board) 16)))
                        (make-posn 325 (* 3 (/ (image-height board) 16)))
                        (make-posn 375 (* 3 (/ (image-height board) 16)))
                        (make-posn 0 (/ (image-height board) 4))
                        (make-posn 50 (/ (image-height board) 4))
                        (make-posn 100 (/ (image-height board) 4))
                        (make-posn 150 (/ (image-height board) 4))
                        (make-posn 200 (/ (image-height board) 4))
                        (make-posn 250 (/ (image-height board) 4))
                        (make-posn 300 (/ (image-height board) 4))
                        (make-posn 350 (/ (image-height board) 4))
                        (make-posn 400 (/ (image-height board) 4))
                        (make-posn 450 (/ (image-height board) 4))
                        (make-posn 500 (/ (image-height board) 4))
                        (make-posn 550 (/ (image-height board) 4))
                        (make-posn 600 (/ (image-height board) 4))
                        (make-posn 25 (* 5 (/ (image-height board) 16)))
                        (make-posn 75 (* 5 (/ (image-height board) 16)))
                        (make-posn 125 (* 5 (/ (image-height board) 16)))
                        (make-posn 175 (* 5 (/ (image-height board) 16)))
                        (make-posn 225 (* 5 (/ (image-height board) 16)))
                        (make-posn 275 (* 5 (/ (image-height board) 16)))
                        (make-posn 325 (* 5 (/ (image-height board) 16)))
                        (make-posn 375 (* 5 (/ (image-height board) 16)))
                        (make-posn 425 (* 5 (/ (image-height board) 16)))
                        (make-posn 475 (* 5 (/ (image-height board) 16)))
                        (make-posn 525 (* 5 (/ (image-height board) 16)))
                        (make-posn 575 (* 5 (/ (image-height board) 16)))
                        (make-posn 50 (* 6 (/ (image-height board) 16)))
                        (make-posn 100 (* 6 (/ (image-height board) 16)))
                        (make-posn 150 (* 6 (/ (image-height board) 16)))
                        (make-posn 200 (* 6 (/ (image-height board) 16)))
                        (make-posn 250 (* 6 (/ (image-height board) 16)))
                        (make-posn 300 (* 6 (/ (image-height board) 16)))
                        (make-posn 350 (* 6 (/ (image-height board) 16)))
                        (make-posn 400 (* 6 (/ (image-height board) 16)))
                        (make-posn 450 (* 6 (/ (image-height board) 16)))
                        (make-posn 500 (* 6 (/ (image-height board) 16)))
                        (make-posn 550 (* 6 (/ (image-height board) 16)))
                        (make-posn 75 (* 7 (/ (image-height board) 16)))
                        (make-posn 125 (* 7 (/ (image-height board) 16)))
                        (make-posn 175 (* 7 (/ (image-height board) 16)))
                        (make-posn 225 (* 7 (/ (image-height board) 16)))
                        (make-posn 275 (* 7 (/ (image-height board) 16)))
                        (make-posn 325 (* 7 (/ (image-height board) 16)))
                        (make-posn 375 (* 7 (/ (image-height board) 16)))
                        (make-posn 425 (* 7 (/ (image-height board) 16)))
                        (make-posn 475 (* 7 (/ (image-height board) 16)))
                        (make-posn 525 (* 7 (/ (image-height board) 16)))
                        (make-posn 100 (/ (image-height board) 2))
                        (make-posn 150 (/ (image-height board) 2))
                        (make-posn 200 (/ (image-height board) 2))
                        (make-posn 250 (/ (image-height board) 2))
                        (make-posn 300 (/ (image-height board) 2))
                        (make-posn 350 (/ (image-height board) 2))
                        (make-posn 400 (/ (image-height board) 2))
                        (make-posn 450 (/ (image-height board) 2))
                        (make-posn 500 (/ (image-height board) 2))
                        (make-posn 75 (- (image-height board) (* 7 (/ (image-height board) 16))))
                        (make-posn 125 (- (image-height board) (* 7 (/ (image-height board) 16))))
                        (make-posn 175 (- (image-height board) (* 7 (/ (image-height board) 16))))
                        (make-posn 225 (- (image-height board) (* 7 (/ (image-height board) 16))))
                        (make-posn 275 (- (image-height board) (* 7 (/ (image-height board) 16))))
                        (make-posn 325 (- (image-height board) (* 7 (/ (image-height board) 16))))
                        (make-posn 375 (- (image-height board) (* 7 (/ (image-height board) 16))))
                        (make-posn 425 (- (image-height board) (* 7 (/ (image-height board) 16))))
                        (make-posn 475 (- (image-height board) (* 7 (/ (image-height board) 16))))
                        (make-posn 525 (- (image-height board) (* 7 (/ (image-height board) 16))))
                        (make-posn 50 (- (image-height board) (* 6 (/ (image-height board) 16))))
                        (make-posn 100 (- (image-height board) (* 6 (/ (image-height board) 16))))
                        (make-posn 150 (- (image-height board) (* 6 (/ (image-height board) 16))))
                        (make-posn 200 (- (image-height board) (* 6 (/ (image-height board) 16))))
                        (make-posn 250 (- (image-height board) (* 6 (/ (image-height board) 16))))
                        (make-posn 300 (- (image-height board) (* 6 (/ (image-height board) 16))))
                        (make-posn 350 (- (image-height board) (* 6 (/ (image-height board) 16))))
                        (make-posn 400 (- (image-height board) (* 6 (/ (image-height board) 16))))
                        (make-posn 450 (- (image-height board) (* 6 (/ (image-height board) 16))))
                        (make-posn 500 (- (image-height board) (* 6 (/ (image-height board) 16))))
                        (make-posn 550 (- (image-height board) (* 6 (/ (image-height board) 16))))
                        (make-posn 25 (- (image-height board) (* 5 (/ (image-height board) 16))))
                        (make-posn 75 (- (image-height board) (* 5 (/ (image-height board) 16))))
                        (make-posn 125 (- (image-height board) (* 5 (/ (image-height board) 16))))
                        (make-posn 175 (- (image-height board) (* 5 (/ (image-height board) 16))))
                        (make-posn 225 (- (image-height board) (* 5 (/ (image-height board) 16))))
                        (make-posn 275 (- (image-height board) (* 5 (/ (image-height board) 16))))
                        (make-posn 325 (- (image-height board) (* 5 (/ (image-height board) 16))))
                        (make-posn 375 (- (image-height board) (* 5 (/ (image-height board) 16))))
                        (make-posn 425 (- (image-height board) (* 5 (/ (image-height board) 16))))
                        (make-posn 475 (- (image-height board) (* 5 (/ (image-height board) 16))))
                        (make-posn 525 (- (image-height board) (* 5 (/ (image-height board) 16))))
                        (make-posn 575 (- (image-height board) (* 5 (/ (image-height board) 16))))
                        (make-posn 0 (* 3 (/ (image-height board) 4)))
                        (make-posn 50 (* 3 (/ (image-height board) 4)))
                        (make-posn 100 (* 3 (/ (image-height board) 4)))
                        (make-posn 150 (* 3 (/ (image-height board) 4)))
                        (make-posn 200 (* 3 (/ (image-height board) 4)))
                        (make-posn 250 (* 3 (/ (image-height board) 4)))
                        (make-posn 300 (* 3 (/ (image-height board) 4)))
                        (make-posn 350 (* 3 (/ (image-height board) 4)))
                        (make-posn 400 (* 3 (/ (image-height board) 4)))
                        (make-posn 450 (* 3 (/ (image-height board) 4)))
                        (make-posn 500 (* 3 (/ (image-height board) 4)))
                        (make-posn 550 (* 3 (/ (image-height board) 4)))
                        (make-posn 600 (* 3 (/ (image-height board) 4)))
                        (make-posn 300 (image-height board))
                        (make-posn 275 (- (image-height board) (/ (image-height board) 16)))
                        (make-posn 325 (- (image-height board) (/ (image-height board) 16)))
                        (make-posn 250 (- (image-height board) (/ (image-height board) 8)))
                        (make-posn 300 (- (image-height board) (/ (image-height board) 8)))
                        (make-posn 350 (- (image-height board) (/ (image-height board) 8)))
                        (make-posn 225 (- (image-height board) (* 3 (/ (image-height board) 16))))
                        (make-posn 275 (- (image-height board) (* 3 (/ (image-height board) 16))))
                        (make-posn 325 (- (image-height board) (* 3 (/ (image-height board) 16))))
                        (make-posn 375 (- (image-height board) (* 3 (/ (image-height board) 16))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;move
(define (check x l) (if (eq? (member x (PLAYER-list-of-posns l)) #f) #f #t))
(define j #t)
(define f #t)
(define p 1)

;;chance updates the list only if the move is possible
(define (chance list init-pos fin-pos)
  (if  (check init-pos player-name)
       (cond[(and j (roll? init-pos fin-pos list))
             (begin (skip-move list) (update-list list init-pos fin-pos))]
            [(and (equal? f #t) (jump? init-pos fin-pos list))
             (begin (set! j #f) (set! f fin-pos) (update-list list init-pos fin-pos))]
            [(and (jump? init-pos fin-pos list) (equal? f init-pos))
             (begin (set! f fin-pos)  (update-list list init-pos fin-pos))]
            [else list])
       list))
;;skip
(define (skip x y)
  (if (and (> x 400) (< y 100)) #t #f))
(define (skip-move list)
  (begin (alter-player-name list) (set! j #t) (set! f #t)))

(define (roll? init-pos fin-pos list)
  (let* [(X (abs (- (posn-x init-pos) (posn-x fin-pos))))
         (Y (abs (- (posn-y init-pos) (posn-y fin-pos))))]
    (cond [(or (check fin-pos (car list))
               (check fin-pos (cadr list))) #f]
          [(or (and (= 25 X) (= H Y)) (and (= X 50) (= Y 0))) #t]
          [else #f])))

(define (jump? init-pos fin-pos list)
  (let* [(mid-pos (make-posn (/ (+ (posn-x init-pos) (posn-x fin-pos)) 2)
                             (/ (+ (posn-y init-pos) (posn-y fin-pos)) 2)))
         (X (abs (- (posn-x init-pos) (posn-x fin-pos))))
         (Y (abs (- (posn-y init-pos) (posn-y fin-pos))))]
    (cond [(or (check fin-pos (car list))
               (check fin-pos (cadr list))) #f]
          [(and (or (and (= (* 2 H) Y) (= 50 X)) (and (= Y 0) (= 100 X)))
                (or (check mid-pos (car list))
                    (check mid-pos (cadr list)))) #t]
          [else #f])))
(define (move? init-pos fin-pos list)
  (or (roll? init-pos fin-pos list) (jump? init-pos fin-pos list)))
;;DRAWING
;;drawing the world

(define highlight '())
(define (draw-world lst-of-plyr)
  (place-players lst-of-plyr (highlighter highlight board)))



(define (highlighter l scene)
  (cond [(null? l) scene]
       ; [else (begin (underlay/xy scene (posn-x (car l)) (posn-y (car l)) (circle 10 'outline 'black)) (highlighter (cdr l) scene))])) 
       ; [else (foldr (lambda (x) (underlay/xy scene (posn-x x) (posn-y x) (circle 10 'outline 'black))) scene l)]))
        [else (place-player (make-PLAYER "white" l) board)]))
        
;;place-players places all the pawns
;;generally lst is lst-of-plyr
;;scene is board
(define (place-players lst scene)
  (cond [(null? lst) scene]
        [else (place-players (rest lst) (place-player (first lst) scene))]))
;(foldr place-player scene lst))
;;place-player places single plyr in to the scene
(define (place-player plyr scene)
  (foldr (lambda (x y) (place-pawn x (PLAYER-color plyr) y)) scene (PLAYER-list-of-posns plyr)))

;;placing-pawn given posn and color of pawn and a scene
;;Still has to implement other four corners
(define (place-pawn pawn-posn plyr-clr scene)
  (cond [(equal? pawn-posn (make-posn 300 0)) (overlay/xy scene (- (posn-x pawn-posn) 5) (posn-y pawn-posn) (pawn plyr-clr))]
        [(equal? pawn-posn (make-posn 300 (image-height scene)))
         (underlay/xy scene (- (posn-x pawn-posn) 5) (- (posn-y pawn-posn) 20) (pawn plyr-clr))]
        [else (underlay/xy scene (- (posn-x pawn-posn) 5) (- (posn-y pawn-posn) 10) (pawn plyr-clr))]))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;global variable to define which player is playing
(define player-name hari)
;;alters-player-name
(define (alter-player-name list)
   (set! p (- 3 p)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;MOUSE EVENTS  
;;handling the mouse events
;;world number number string -> list of players 
(define already-pressed #f)
(define past-posn (make-posn 0 0))
;;error
(define (convert-to-posn x y p)
  (cond [(null? p) #f] 
        [(let* [(px (posn-x (car p)))
                (py (posn-y (car p)))]
           (> 100 (+ (* (- x px) (- x px)) (* (- y py) (- y py))))) (car p)]
        [else (convert-to-posn x y (cdr p))]))
            
(define (meh list-of-plyrs x y event)
  ;;BUTTON DOWN
  (let* [(z (convert-to-posn x y all-posns))
         (q (not already-pressed))
         (p1 (car list-of-plyrs))
         (p2 (cadr list-of-plyrs))]
    (cond [(string=? event "button-down")
           (if (skip x y) (begin (skip-move list-of-plyrs) list-of-plyrs)
              ; (begin (alter-player-name) (set! f #t) (set! j #t) list-of-plyrs)
           (if (and already-pressed (not (equal? z #f)))
               (begin (set! highlight '()) (set! already-pressed q) (if (= p 1) (set! player-name p1) (set! player-name p2))
                                                   (chance list-of-plyrs past-posn z))
               (begin (if ( and j (check z (if (= 1 p) p1 p2))) (set! highlight (move z list-of-plyrs)) (set! highlight '()))
                 (set! already-pressed q) (set! past-posn z) list-of-plyrs)))]
          [else list-of-plyrs])))

(define (meh1 list-of-plyrs x y event)
  ;;BUTTON DOWN
  (let* [(z (convert-to-posn x y all-posns))
         (q (not already-pressed))
         (p1 (car list-of-plyrs))
         (p2 (cadr list-of-plyrs))]
    (cond [(string=? event "button-down")
           (if (skip x y) (begin (set! p 1) (bestmove list-of-plyrs))
              ; (begin (alter-player-name) (set! f #t) (set! j #t) list-of-plyrs)
           (begin (set! p 2) (if (and already-pressed (not (equal? z #f)))
               (begin (set! highlight '()) (set! already-pressed q) (if (= p 1) (set! player-name p1) (set! player-name p2))
                                                   (chance list-of-plyrs past-posn z))

               (begin (if (and j (check z (if (= 1 p) p1 p2))) (set! highlight (move z list-of-plyrs)) (set! highlight '()))
                      (set! already-pressed q) (set! past-posn z) list-of-plyrs))))]
          [else list-of-plyrs])))

;;STILL HAS TO CONSIDER ILLEGAL CASES
;;update-list updates the list of positions
(define (update-list players initial-posn final-posn)
  (map (lambda (x) (update-player x initial-posn final-posn players)) players)) 
(define (update-player player initial-posn final-posn players)
   (if (not (equal? (member initial-posn (PLAYER-list-of-posns player)) #f))
     (make-PLAYER (PLAYER-color player) (append (list final-posn) 
                                                 (remove initial-posn (PLAYER-list-of-posns player))))
     
      player))
;;STILL HAS TO CONSIDER ERROR 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;BIG-
(define (start)
  (let* ([n (start-h)])
    (cond [(= n 1) (big-bang (list hari mohan)
                     [on-mouse meh1]
                     [to-draw draw-world]
                     [stop-when win end-scene])]
          [(= n 2) (big-bang (list hari mohan)
                     [on-mouse meh]
                     [to-draw draw-world]
                     [stop-when win end-scene])])))

(define (start-h)
  (begin (display "Type 1 for single player")
         (newline)
         (display "Type 2 for multi player")
         (newline)
         (read)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (appender l)
  (cond [(null? l) '()]
        [else (append (car l) (appender (cdr l)))]))

(define (roll p l)
  (let* [(x0 (posn-x p))
         (y0 (posn-y p))
         (p1 (make-posn (+ x0 50) y0))
         (p2 (make-posn (- x0 50) y0))
         (p3 (make-posn (+ x0 25) (+ y0 H)))
         (p4 (make-posn (+ x0 25) (- y0 H)))
         (p5 (make-posn (- x0 25) (+ y0 H)))
         (p6 (make-posn (- x0 25) (- y0 H)))
         (allp (list p1 p2 p3 p4 p5 p6))]
  (appender (map (lambda (x) (if (and (not (equal? #f (member x all-posns))) (not (check x (car l)))
                                      (not (check x (cadr l)))) (list x) '())) allp))))

(define (sjump p l)
  (let* [(x0 (posn-x p))
         (y0 (posn-y p))
         (p1 (make-posn (+ x0 100) y0))
         (p2 (make-posn (- x0 100) y0))
         (p3 (make-posn (+ x0 50) (+ y0 (* 2 H))))
         (p4 (make-posn (+ x0 50) (- y0 (* 2 H))))
         (p5 (make-posn (- x0 50) (+ y0 (* 2 H))))
         (p6 (make-posn (- x0 50) (- y0 (* 2 H))))
         (allp (list p1 p2 p3 p4 p5 p6))]    
  (appender (map (lambda (x) (if (and (not (equal? #f (member x all-posns))) (jump? p x l)
                                      (equal? #f (member x allj))) (list x) '())) allp))))

;(define (single-move p l)
;  (append (roll p l) (move p l)))


(define allj '())
(define z '())
(define (ajump p l)
  (let* [(q allj)]
  (begin (set! z (appender (map (lambda (x) (sjump x l)) p)))
         (if (null? z) (begin (set! allj '()) (set! z '()) q) (begin (set! allj (append z allj)) (ajump z l))))))
              
(define (move p l)
  (append (roll p l) (ajump (list p) l)))

(define (possible player l) 
  (let* [(p (PLAYER-list-of-posns player))]
  (appender (map (lambda (x) (map (lambda (y) (append (list y) (remove x p))) (move x l))) p))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define pl (list hari mohan))

(define player1 (car pl))
(define player2 (cadr pl))
(define play1 (make-vector 100 0))
(define play2 (make-vector 100 0))
(define bes (make-vector 100 0))
(define val 0)
(define alph (make-vector 100 -1000))
(define bet (make-vector 100 1000))
(define cur 0)
(define mover '())

;;minimax function
(define (minimax depth alpha beta N)
  (cond [(= depth N) (score pl)]
        [(= p 1) (let* [(best -10000)
                        (P (possible player1 pl))
                        (len (length P))]
                   (foo1 len best depth  alpha beta N P))]
        [else (let* [(best 10000)
                     (P (possible player2 pl))
                     (len (length P))]
                (foo2 len best depth alpha beta N P))]))

(define b 0)
(define (foo1 i best depth alpha beta N P)
     (begin (set! val 0) (vector-set! bes depth best)
            (vector-set! alph (+ depth 1) alpha) (vector-set! bet (+ depth 1) beta)
            (cond[(= 0 i) (vector-ref bes depth)]
                 ;[(and (> counter 40) (win-search (PLAYER-list-of-posns mohan) P)) (begin (display "hi") (set! mover (PLAYER-list-of-posns mohan)))] 
                 [(= counter 40) (begin (set! max-depth 1) (set! counter (+ counter 1)) (foo1 i best depth alpha beta N P))] 
                 [else (begin (set! p 2)
                              (vector-set! play1 depth player1)
                              (set! player1 (make-PLAYER (PLAYER-color player1) (list-ref P (- i 1))))  
                              (set! pl (list player1 player2)) (set! val (minimax (+ 1 depth) (vector-ref alph depth) (vector-ref bet depth) N))
                              (set! player1 (vector-ref play1 depth))
                              (set! p 1)
                            
                              (if (= 0 depth) (if (> val (vector-ref bes depth)) (set! mover (list-ref P (- i 1))) P) P)
                              (vector-set! bes depth (max (vector-ref bes depth) val))
                              (vector-set! alph depth (max (vector-ref alph depth) (vector-ref bes depth)))
                              (if (<= (vector-ref bet depth) (vector-ref alph depth)) (vector-ref bes depth) 
                                  (foo1 (- i 1) (vector-ref bes depth) depth (vector-ref alph depth) (vector-ref bet depth) N P)))])))

(define (foo2 i best depth alpha beta N P)
  (begin (set! val 0) (vector-set! bes depth best) 
         (vector-set! bet (+ depth 1) beta) (vector-set! alph (+ 1 depth) alpha)
         (cond [(= 0 i) (vector-ref bes depth)]
               [else (begin (set! p 1)
                            (vector-set! play2 depth player2)
                            (set! player2 (make-PLAYER (PLAYER-color player2) (list-ref P (- i 1))))
                            (set! pl (list player1 player2)) (set! val (minimax (+ 1 depth) (vector-ref alph depth) (vector-ref bet depth) N))
                            (set! player2 (vector-ref play2 depth)) (set! p 2); (display val)
                            (vector-set! bes depth (min (vector-ref bes depth) val))
                            (vector-set! bet depth (min (vector-ref bet depth) (vector-ref bes depth)))
                            (if (<= (vector-ref bet depth) (vector-ref alph depth))  (vector-ref bes depth)
                                (foo2 (- i 1) (vector-ref bes depth) depth (vector-ref alph depth) (vector-ref bet depth) N P)))])))

;;bestmove takes the current list of players and gives the best move for player 1
(define (bestmove ash)
  (let* [(X (begin (minimax 0 -1000 1000 max-depth) (list (make-PLAYER (PLAYER-color (car ash)) mover) (cadr ash))))]
    (begin (set! p 2) (set! counter (+ 1 counter)) (set! j #t) (set! f #t) (set! pl X) (set! player1 (car pl)) (set! player2 (cadr pl)) X)))
    
;;max depth
(define max-depth 3)
;;making score
;;takes (list of posns) of both players -> score 
(define (score lst)
  (cond[(equate (PLAYER-list-of-posns (car lst)) (PLAYER-list-of-posns mohan)) 10000]
       [else (+ (VD lst) (* WF (HD lst)))]))
;;WF is weight-factor
(define WF 0.5)
;;VD is Vertical-displacement
(define (VD lst)
  (- (foldr + 0 (map score1 (PLAYER-list-of-posns (car lst))))
     (foldr + 0 (map score2 (PLAYER-list-of-posns (cadr lst))))))
;;HD is Horizontal-displacement
(define (HD lst)
  (- (foldr + 0 (map score3 (PLAYER-list-of-posns (car lst))))
     (foldr + 0 (map score3 (PLAYER-list-of-posns (cadr lst))))))
;;score1&3 is for current player
;;score2&3 is for opponent player
;;posn->score
(define (score1 pos)
  (let* ([rn (row pos)])
    (cond [(<= rn 4) (+ 2 rn)]
          [(> rn 12) (+ rn 5)]
          [(and (> rn 4) (<= rn 8)) (+ rn 1)] 
          [(and (> rn 8) (<= rn 12)) (+ rn 2)])))
(define (score2 pos)
  (let* ([rn (- 16 (row pos))])
    (cond [(<= rn 4) (+ rn 5)]
          [(> rn 12) (+ 2 rn)]
          [(and (> rn 4) (<= rn 8)) (+ rn 2)]
          [(and (> rn 8) (<= rn 12)) (+ rn 1)])))
(define (score3 pos)
  (let* ([cn (col pos)])
    (cond [(<= cn 8) cn]
          [(> cn 16) (- 24 cn)]
          [(and (> cn 8) (<= cn 12)) (+ cn 2)] 
          [(and (> cn 12) (<= cn 16)) (- 26 cn)])))
;;;;;;;;equate
(define (equate p q)
  (cond[(null? p) #t]
       [(equal? #f (member (car p) q)) #f]
       (else (equate (cdr p) q))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;posn-> row_number
;;rows varies from 0 to 16
(define (row pos)
  (round (/ (* (posn-y pos) 16) (image-height board))))
;;posn-> col_number
;;columns varies from 0 to 24
;;in a row the difference in col numbers between two adjacent columns is 2
(define (col pos)
  (round (/ (posn-x pos) 25)))

(define (win-search l p)
  (cond[(null? p) #f]
       [(equate l (car p)) #t]
       [else (win-search l (cdr p))]))

(define counter 0)

(define winner 0)
(define (win l)
  (cond [(equate (PLAYER-list-of-posns (car l)) (PLAYER-list-of-posns mohan)) (begin (set! winner 1) #t)]
        [(equate (PLAYER-list-of-posns (cadr l)) (PLAYER-list-of-posns hari)) (begin (set! winner 2) #t)]
        [else #f]))

(define (end-scene l)
  (if (= winner 1) (text "PLAYER1 IS WINNER" 100 'green)
      (text "PLAYER2 IS WINNER" 100 'green)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(start)