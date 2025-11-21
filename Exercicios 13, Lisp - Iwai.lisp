(defstruct item nome tipo preco forca-magica)

(defparameter *catalogo-loja*
  (list
    (make-item :nome "Sword of Light" :tipo "Arma" :preco 200 :forca-magica 90)
    (make-item :nome "Dagger of Iron" :tipo "Arma" :preco 50 :forca-magica 40)
    (make-item :nome "Mana Potion" :tipo "Pocao" :preco 10 :forca-magica 0)
    (make-item :nome "Amulet of Luck" :tipo "Artefato" :preco 150 :forca-magica 70)))

(defun adiciona-imposto (preco)
  (* preco 1.15))

(defun bonus-maldicao (forca)
  (if (> forca 80)
      (* forca 1.5)
      forca))

(defun processa-venda (catalogo)
  (let ((armas (remove-if-not (lambda (i) (string-equal (item-tipo i) "Arma")) catalogo)))
    (mapcar (lambda (i)
              (list (item-nome i) 
                    (bonus-maldicao (item-forca-magica i))))
            (mapcar (lambda (i)
                      (make-item :nome (item-nome i)
                                 :tipo (item-tipo i)
                                 :preco (adiciona-imposto (item-preco i))
                                 :forca-magica (item-forca-magica i)))
                    armas))))

(defun testar-loja ()
  (format t "--------- RESULTADOS ---------~%")
  
  (let ((resultado (processa-venda *catalogo-loja*)))
    (format t "Itens Processados (Armas com bonus de maldicao):~%")
    (dolist (r resultado)
      (format t " - Item: ~a | Nova Forca Magica: ~d~%" (first r) (second r))))
      
  (format t "------------------------------~%"))

(testar-loja)