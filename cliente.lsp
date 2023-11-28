(defvar *clientes* (make-array 0 :adjustable t)) ; Arreglo dinámico para clientes

(defun agregarCliente(cliente) ; Función para agregar un cliente al arreglo
  (vector-push-extend cliente *clientes*))