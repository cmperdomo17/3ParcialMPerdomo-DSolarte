(defvar *bancos* (make-array 0 :adjustable t)) ; Arreglo dinámico para bancos

(defun agregarBanco(banco) ; Función para agregar un banco al arreglo
  (vector-push-extend banco *bancos*))

(defun buscarBanco(nit) ; Función para buscar un banco por su nit
    (loop for banco in *bancos* do
        (if (equal (getf banco :nit) nit)
        (return banco))))

