;P13
;1.1
(define a 3)
(define b (+ a 1))
(= a b)
(= 1 1)

;1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

;1.3
(define (sum-of-bigger x y z)
    (cond ((and (< x y) (< x z)) (+ y z))
          ((and (< y x) (< y z)) (+ x z))
          (else (+ x y))))
(sum-of-bigger 1 2 4)
(sum-of-bigger 2 0 3)
(sum-of-bigger 6 2 1)

;1.4
(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))
(a-plus-abs-b 9 9)
(a-plus-abs-b 9 -9)

;1.5
(define (p) (p))
(define (test x y)
    (if (= x y)
        0
        y))

(test o (p))
; 正则序会直接输出
; 应用序会无限循环
;由Ben Bitdiddle发明

;P6
;1.7
(define threshold 0.00001)

(define (average x y)
    (/ (+ x y) 2))

(define (improve guess x)
    (average guess (/ x guess)))

(define (good-enough? guess x)
    (< (/ (abs (- (improve guess x) 
                    guess)) 
            guess) 
        threshold))

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) 
                    x)))

(define (sqrt x)
    (sqrt-iter 1.0 x))

(sqrt 2)
(sqrt 9)

;1.8
(define threshold 0.00001)

(define (improve guess x)
    (/ (+ (/ x (* guess guess)) 
        (* 2 guess)) 
        3))

(define (good-enough? guess x)
    (< (/ (abs (- (improve guess x) 
                    guess)) 
            guess) 
        threshold))

(define (cube-iter guess x)
    (if (good-enough? guess x)
        guess
        (cube-iter (improve guess x)
                    x)))

(define (cube x)
    (cube-iter 1.0 x))

(cube 16)
(cube 27)

;P23
;1.9
(define (+ a b)
  (if (= a 0) 
      b 
      (inc (+ (dec a) b))))

(+ 4 5)
(inc (+ (dec 4) 5))
(inc (inc (+ (dec 3) 5)))
(inc (inc (inc (+ (dec 2) 5))))
(inc (inc (inc (inc (+ (dec 1) 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

(define (+ a b)
  (if (= a 0) 
      b 
      (+ (dec a) (inc b))))

(+ 4 5)
(+ (dec 4) (inc 5)); (+ 3 6)
(+ (dec 3) (inc 6)); (+ 2 7)
(+ (dec 2) (inc 7)); (+ 1 8)
(+ (dec 1) (inc 8)); (+ 0 9)
9


;1.10
; [Ackermann函数](https://zhuanlan.zhihu.com/p/93644792)
(define (A x y)
    (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

(A 1 10)
(A 2 4)
(A 3 3)
(A 4 3); out of memory
; f(x,y) = f(x-1, f(x, y-1))
; f(x,0) = 0 ==> f(x,2) = f(x-1,f(x,1)) = f(x-1,2) = f(x-2,2) = ... = f(0,2) = 4
;                f(x,3) = f(x-1,f(x,2)) = f(x-1,4) = f(x-2,f(x-3,3)) = f(x-2,f(x-4,f(x-3,2)))
; f(0,y) = 2y
; f(1,y) = f(0, f(1, y-1)) = 2f(1, y-1) = 2 ^ y
; f(2,y) = f(1, f(2, y-1)) = 2 ^ f(2, y-1) = 2 ^ f(1, f(2, y-2)) = 2 !! y

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))

(f 0)
(f 1)
(f 2)
(f 3)
(f 4)
(g 0)
(g 1)
(g 2)
(g 3)
(g 4)
(h 0)
(h 1)
(h 2)
(h 3)
(h 4)
(k 0)
(k 1)
(k 2)
(k 3)
(k 4)

;P27
;1.11
(define (f n)
    (cond ((< n 3) n)
          (else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))
        )))))
(f 1)
;Value: 1
(f 2)
;Value: 2
(f 3)
;Value: 4
(f 4)
;Value: 11
(f 5)
;Value: 25
(f 6)
;Value: 59
(f 7)
;Value: 142
(f 8)
;Value: 335

(define (g n)
    (define (g-iter count next1 next2 n)
        (if (= n 0) count
            (g-iter next1 next2 (+ (* 3 count) (* 2 next1) next2) (- n 1))))    
    
    (g-iter 0 1 2 n))
(g 1)
(g 2)
(g 3)
(g 4)
(g 5)
(g 6)
(g 7)
(g 8)

;1.12 帕斯卡三角
(define (p x y); x>=y
    (if (or (= x 1) (= y 1) (= x y)) 1
        (+ (p (- x 1) (- y 1)) (p (- x 1) y))))

(p 1 1)
(p 2 1)
(p 2 2)
(p 3 2)
(p 4 2)
(p 5 2)
(p 5 3)

;1.13
; [生成函数计算斐波那契数列通项](https://blog.csdn.net/china_xyc/article/details/90115657)
; [斐波那契与黄金分割数](https://blog.csdn.net/china_xyc/article/details/104279724)


;1.14
;P29
; 详见图片 1.14.png
; (define (count-change amount)
;   (cc amount 5))

; (define (cc amount kinds-of-coins)
;   (cond ((= amount 0) 1)
;         ((or (< amount 0) 
;              (= kinds-of-coins 0)) 
;          0)
;         (else 
;          (+ (cc amount (- kinds-of-coins 1))
;             (cc (- amount (first-denomination 
;                            kinds-of-coins))
;                 kinds-of-coins)))))

; (define (first-denomination kinds-of-coins)
;   (cond ((= kinds-of-coins 1) 1)
;         ((= kinds-of-coins 2) 5)
;         ((= kinds-of-coins 3) 10)
;         ((= kinds-of-coins 4) 25)
;         ((= kinds-of-coins 5) 50)))
         
;                                                     (cc 11 5)
;                                               (cc 11 4) + (cc (- 11 50) 5)=0
;                                         (cc 11 3) + (cc (- 11 25) 4)=0
;                         (cc 11 2)           +                                                                                  (cc (- 11 10) 3)
;        (cc 11 1)            +                   (cc (- 11 5) 2)                                                              (cc 1 2) + (cc (- 1 10) 3)=0
;(cc 11 0)=0 + (cc (- 11 1) 1)                  (cc 6 1) +                              (cc (- 6 5) 2)                    (cc 1 1) + (cc (- 1 5) 2)=0 
;         (cc 10 0)=0 + (cc (- 10 1) 1)  (cc 6 0)=0 + (cc (- 6 1) 1)                  (cc 1 1) + (cc (- 1 5) 2)=0  (cc 1 0)=0 + (cc (- 1 1) 1)=1
;                   (cc 9 0)=0 + (cc (- 9 1) 1)   (cc 5 0)=0 + (cc (- 5 1) 1)  (cc 1 0)=0 + (cc (- 1 1) 1)=1
;                            (cc 8 0)=0 + (cc (- 9 1) 1)   (cc 4 0)=0 + (cc (- 4 1) 1)
;                                     (cc 7 0)=0 + (cc (- 8 1) 1)   (cc 3 0)=0 + (cc (- 3 1) 1)
;                                              (cc 7 0)=0 + (cc (- 7 1) 1)   (cc 2 0)=0 + (cc (- 2 1) 1)
;                                                       (cc 6 0)=0 + (cc (- 6 1) 1)    (cc 1 0)=0 + (cc (- 1 1) 1)=1
;                                                                (cc 5 0)=0 + (cc (- 5 1) 1)
;                                                                         (cc 4 0)=0 + (cc (- 4 1) 1)
;                                                                                  (cc 3 0)=0 + (cc (- 3 1) 1)
;                                                                                           (cc 2 0)=0 + (cc (- 2 1) 1)
;                                                                                                    (cc 1 0)=0 + (cc (- 1 1) 1)=1

; 存储大小就是节点总数 2^0+2^1+...+2^n(即树高11)
; 计算大小就是叶子总数 2^n

;1.15
(define (cube x) (* x x x)); 时间 3 空间 0 执行 1

(define (p x) 
    (- (* 3 x) (* 4 (cube x)))); 时间 4 空间 0 执行 1

(define (sine angle)
    (if (not (> (abs angle) 0.1)); 时间 3 空间 0 执行 log3(x)+1
        angle; 时间 1 空间 0 执行 1
        (p (sine (/ angle 3.0))))); 执行 log3(x) 入栈出栈空间1

(trace-entry p)
(sine 12.15)
;a) 每次迭代都是1/3，直至x小于0.1。(1/3)^n * 12.15 < 0.1, n > 4, n = 5
;b)
;时间 3 * (log3(x) + 1) + 1 + log3(x) * (4 + 3) = 10 * log3(x) + 4 = O(lgx)
;空间 log3(x) * 1 = O(lgx)

;1.16
;P30
(define (fast-expt b n)
    (define (even? n)
        (= 0 (remainder n 2)))

    (define (square x) (* x x))

    (define (fast-expt-iter b n result)
        (cond ((= n 0) result)
              ((even? n) (fast-expt-iter (square b) (/ n 2) result))
              (else (fast-expt-iter b (- n 1) (* b result)))))
    
    (trace-entry fast-expt-iter)
    (fast-expt-iter b n 1))

(fast-expt 3 6)

;1.17
(define (fast-multi a b)
    (define (even? n)
        (= 0 (remainder n 2)))
    
    (define (double x) (* x 2))
    (define (halve x) (/ x 2))

    (cond ((= b 0) 0)
          ((even? b) (double (fast-multi a (halve b))))
          (else (+ a (fast-multi a (- b 1))))))

(fast-multi 2 4)
(fast-multi 7 11)

;1.18
(define (fast-multi a b)
    (define (even? n)
        (= 0 (remainder n 2)))
    
    (define (double x) (* x 2))
    (define (halve x) (/ x 2))

    (define (fast-multi-iter a b result)
        (cond ((= b 0) result)
              ((even? b) (fast-multi-iter (double a) (halve b) result))
              (else (fast-multi-iter a (- b 1) (+ result a)))))
    
    (fast-multi-iter a b 0))

(fast-multi 2 4)
(fast-multi 7 11)

;1.19
;a <- bq+a(q+p)  b <- bp+aq
;a <- q(bp+aq)+q(bq+aq+ap)+p(bq+aq+ap)=bpq+aqq+bqq+aqq+apq+bpq+apq+app = b(2pq+qq)+a(2qq+2pq+pp)
;b <- p(bp+aq)+q(bq+a(q+p))=bpp+apq+bqq+aqq+apq = b(pp+qq)+a(2pq+qq)
;p'=pp+qq  q'=2pq+qq
(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (square x) (* x x))

(define (fib-iter a b p q count)
  (cond ((= count 0) 
         b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))  ;compute p'
                   (+ (* 2 p q) (square q))  ;compute q'
                   (/ count 2)))
        (else 
         (fib-iter (+ (* b q) 
                      (* a q) 
                      (* a p))
                   (+ (* b p) 
                      (* a q))
                   p
                   q
                   (- count 1)))))

;1.20
;P33
(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))
(trace-entry gcd)
(gcd 206 40)

;正则序 (if (= b 0) a (gcd b (remainder a b)))
(gcd 206 40)
(if (= 40 0) 206 (gcd 40 (remainder 206 40)))
(if (= 40 0) 206 (if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
;...

;应用序
(gcd 206 40)
(gcd 40 6)
(gcd 6 4)
(gcd 4 2)
(gcd 2 0);5次

;1.21
;P35
(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)

;1.22
(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
    (= n (smallest-divisor n)))

(define (next-odd n)
    (if (odd? n)
        (+ 2 n)
        (+ 1 n)))

(define (print-prime n)
    (newline)
    (display n))

(define (report-prime elapsed-time)
    (newline)
    (display "*** ")
    (display elapsed-time))

(define (start-prime-test n count start-time)
    (cond ((= count 0) (report-prime (- (real-time-clock) start-time)))
          ((prime? n) (print-prime n) (start-prime-test (next-odd n) (- count 1) start-time))
          (else (start-prime-test (next-odd n) count start-time))))

(define (search-for-prime n count)
    (start-prime-test n count (real-time-clock)))

(search-for-prime 1000 3);1
(search-for-prime 10000 3);1
(search-for-prime 100000 3);3
(search-for-prime 1000000 3);7

;1.23
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (next test-divisor)
    (if (= test-divisor 2)
        3
        (+ test-divisor 2)))

(define (prime? n)
    (= n (smallest-divisor n)))

(define (next-odd n)
    (if (odd? n)
        (+ 2 n)
        (+ 1 n)))

(define (print-prime n)
    (newline)
    (display n))

(define (report-prime elapsed-time)
    (newline)
    (display "*** ")
    (display elapsed-time))

(define (start-prime-test n count start-time)
    (cond ((= count 0) (report-prime (- (real-time-clock) start-time)))
          ((prime? n) (print-prime n) (start-prime-test (next-odd n) (- count 1) start-time))
          (else (start-prime-test (next-odd n) count start-time))))

(define (search-for-prime n count)
    (start-prime-test n count (real-time-clock)))

(search-for-prime 1000 3);0
(search-for-prime 10000 3);1
(search-for-prime 100000 3);1
(search-for-prime 1000000 3);2

;1.24
(define (expmod base exp m)
    (define (even? n)
        (= 0 (remainder n 2)))

    (define (square x) (* x x))
    
    (cond ((= exp 0) 1)
          ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
          (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a))
    
    (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? n (- times 1)))
          (else false)))

(define (prime? n)
    (fast-prime? n 10))

(define (next-odd n)
    (if (odd? n)
        (+ 2 n)
        (+ 1 n)))

(define (print-prime n)
    (newline)
    (display n))

(define (report-prime elapsed-time)
    (newline)
    (display "*** ")
    (display elapsed-time))

(define (start-prime-test n count start-time)
    (cond ((= count 0) (report-prime (- (real-time-clock) start-time)))
          ((prime? n) (print-prime n) (start-prime-test (next-odd n) (- count 1) start-time))
          (else (start-prime-test (next-odd n) count start-time))))

(define (search-for-prime n count)
    (start-prime-test n count (real-time-clock)))

(search-for-prime 1000 3);2
(search-for-prime 10000 3);2 
(search-for-prime 100000 3);2
(search-for-prime 1000000 3);4

; 使用算法复杂度或者计算步数并不能完全预测程序的运行时间
; 即使我们能准确地计算出程序所需的步数，程序的运行速度还是会受到其他条件的影响
; 一般来说，复杂度更低的算法，实际的运行速度总比一个复杂度更高的算法要来得更快，有时候在输入比较小时会比较难看出差别，但是当输入变得越来越大的时候，低复杂度算法的优势就会体现出来。

;1.25
; 大数字的计算一般是没有小数字计算快的，虽然题目中的方式也可以计算出结果，但是耗费更多的时间在大数字的计算上。

;1.26
; 每次remainder都会计算两次expmod，每次数分叉时都会产生一样的子树。、

;1.27
(define (expmod base exp m)
    (define (even? n)
        (= 0 (remainder n 2)))

    (define (square x) (* x x))
    
    (cond ((= exp 0) 1)
          ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
          (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (try-it a n)
    (= (expmod a n n) a))

(try-it 2 11)

(define (next test-divisor)
    (if (= test-divisor 2)
        3
        (+ test-divisor 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((try-it test-divisor n) (find-divisor n (next test-divisor)))
        (else test-divisor)))

(define (check n)
  (= n (find-divisor n 2)))

(check 11)
(check 560)
(check 561)
(check 1105)
(check 1729)
(check 2465)
(check 2821)
(check 6601)

;1.28
; ???!!!
; https://zhuanlan.zhihu.com/p/349360074
(define (test? b p)
    (and (not (= b 1))
         (not (= b (- p 1)))
         (= 1 (remainder (square b) p))))

(define (expmod base exp m)
    (define (even? n)
        (= 0 (remainder n 2)))

    (define (square x) (* x x))
    
    (cond ((= exp 0) 1)
          ((test? base m) 0)
          ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
          (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (try-it a n)
    (= (expmod a (- n 1) n) 1))

(define (test-iter n times)
    (cond ((= times 0) #t)
          ((try-it (+ 1 (random (- n 1))) n) (test-iter n (- times 1)))
          (else #f)))

(define (Miller-Rabin-test n)
    (test-iter n (ceiling (/ n 2))))

(Miller-Rabin-test 11)
(Miller-Rabin-test 560)
(Miller-Rabin-test 561)
(Miller-Rabin-test 1105)
(Miller-Rabin-test 1729)
(Miller-Rabin-test 2465)
(Miller-Rabin-test 2821)
(Miller-Rabin-test 6601)


(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))

(define (pi-sum a b)
    (define (pi-term a)
        (/ 1.0 (* a (+ a 2))))

    (define (pi-next a)
        (+ a 4))

    (sum pi-term a pi-next b))

(* 8 (pi-sum 1 10000))