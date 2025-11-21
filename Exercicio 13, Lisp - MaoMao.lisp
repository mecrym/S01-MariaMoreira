(defun calcula-dosagem (peso-kg idade-anos)
  (cond
    ((or (< idade-anos 5) (< peso-kg 20)) 10)
    ((and (>= idade-anos 5) (<= idade-anos 12) (>= peso-kg 20)) 25)
    (t 50)))

(defun ajusta-preco (preco-base nome-da-erva)
  (cond
    ((string-equal nome-da-erva "Ginseng") (* preco-base 3.0))
    ((string-equal nome-da-erva "Lotus")   (* preco-base 1.5))
    (t preco-base)))

(defun testar-calculo (peso idade preco nome)
  (let ((dosagem (calcula-dosagem peso idade))
        (preco-ajustado (ajusta-preco preco nome)))
    (format t "Paciente: ~d anos, ~dkg | Erva: ~a~%" idade peso nome)
    (format t "Dosagem: ~d ml | Preco Unitario: ~d~%" dosagem preco-ajustado)
    (format t "PRECO FINAL (Dosagem * Preco): ~d~%~%" (* dosagem preco-ajustado))))

(testar-calculo 60 14 10 "Lotus")
(testar-calculo 15 4 10 "Ginseng")
(testar-calculo 25 10 5 "Erva Comum")