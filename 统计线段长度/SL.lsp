(princ "\n统计线段长度, 命令: SL")
(defun C:sl (/ pt CURVE TLEN SS N SUMLEN F)
(setq F (getvar "DIMLFAC"))
(vl-load-com)  (setq SUMLEN 0)
(setq SS (ssget '((0 . "CIRCLE,ELLIPSE,LINE,*POLYLINE,SPLINE,ARC"))))
(setq N 0)
(repeat (sslength SS)
(setq CURVE (vlax-ename->vla-object (ssname SS N)))
(setq TLEN (vlax-curve-getdistatparam CURVE (vlax-curve-getendparam CURVE)))
(setq SUMLEN (+ SUMLEN TLEN))
(setq N (1+ N))
)
(setq SUMLEN (* SUMLEN F))
(princ (strcat "\n共选择 " (itoa (sslength SS)) " 个对象，长度为 " (rtos SUMLEN 2 3) "  .")) (princ)
)