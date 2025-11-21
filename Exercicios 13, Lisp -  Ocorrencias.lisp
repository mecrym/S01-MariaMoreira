(defstruct ocorrencia nome ritual nivel-medo agentes-enviados)

(defparameter *ocorrencias*
  (list
    (make-ocorrencia :nome "Casa Abandonada" :ritual "Invocacao" :nivel-medo 80 :agentes-enviados 5)
    (make-ocorrencia :nome "Porao da Escola" :ritual "Purificacao" :nivel-medo 50 :agentes-enviados 2)
    (make-ocorrencia :nome "Templo Esquecido" :ritual "Nenhuma" :nivel-medo 90 :agentes-enviados 4)
    (make-ocorrencia :nome "Loja de Livros" :ritual "Adivinhacao" :nivel-medo 50 :agentes-enviados 5)))

(defun soma-medo-recursiva (lista)
  (if (null lista)
      0
      (+ (ocorrencia-nivel-medo (first lista))
         (soma-medo-recursiva (rest lista)))))

(defun analise-final (lista)
  (let* ((soma (soma-medo-recursiva lista))
         (total (length lista))
         (media (if (zerop total) 0 (/ soma total))))
    (mapcar (lambda (o) (ocorrencia-nome o))
            (remove-if-not (lambda (o)
                             (and (> (ocorrencia-agentes-enviados o) 3)
                                  (> (ocorrencia-nivel-medo o) media)))
                           lista))))

(defun testar-ocorrencias ()
  (format t "--------- RESULTADOS ---------~%")
  
  (let ((soma (soma-medo-recursiva *ocorrencias*))
        (total (length *ocorrencias*)))
    (format t "Soma do Medo: ~d | Total de Missoes: ~d | Media: ~d~%" 
            soma total (float (/ soma total))))
            
  (let ((criticas (analise-final *ocorrencias*)))
    (format t "Missoes Criticas Identificadas:~%")
    (dolist (nome criticas)
      (format t " [ALERTA]: ~a~%" nome)))
  (format t "------------------------------~%"))

(testar-ocorrencias)