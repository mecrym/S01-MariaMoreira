(defstruct criatura nome ambiente periculosidade vida-media)

(defparameter *catalogo-fauna*
  (list
    (make-criatura :nome "Peixe de Bateria" :ambiente "Safe Shallows" :periculosidade "Baixa" :vida-media 5)
    (make-criatura :nome "Reaper Leviathan" :ambiente "Abyss" :periculosidade "Alta" :vida-media 100)
    (make-criatura :nome "CrabSnake" :ambiente "Deep" :periculosidade "Media" :vida-media 50)
    (make-criatura :nome "Sea Dragon" :ambiente "Deep" :periculosidade "Alta" :vida-media 200)
    (make-criatura :nome "Stalker" :ambiente "Kelp Forest" :periculosidade "Media" :vida-media 30)))

(defun filtra-por-perigo (catalogo)
  (remove-if-not (lambda (c)
                   (not (string-equal (criatura-periculosidade c) "Baixa")))
                 catalogo))

(defun relatorio-profundidade (catalogo)
  (mapcar (lambda (c)
            (format nil "[~a]: Vive em [~a]" (criatura-nome c) (criatura-ambiente c)))
          (remove-if-not (lambda (c) 
                           (string-equal (criatura-ambiente c) "Deep"))
                         catalogo)))

(defun testar-fauna ()
  (format t "--------- RESULTADOS ---------~%")
  
  (let ((perigosas (filtra-por-perigo *catalogo-fauna*)))
    (format t "1. Criaturas Perigosas (Nao Baixa):~%")
    (dolist (c perigosas)
      (format t " - ~a (Perigo: ~a)~%" (criatura-nome c) (criatura-periculosidade c))))
  
  (let ((relatorio (relatorio-profundidade *catalogo-fauna*)))
    (format t "~%2. Relatorio do Ambiente Deep:~%")
    (dolist (linha relatorio)
      (format t " ~a~%" linha)))
  (format t "------------------------------~%"))

(testar-fauna)