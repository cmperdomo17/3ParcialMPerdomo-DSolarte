(defun structBanco()
 (defstruct Banco
  nit
  nombre
  num_empleados
  )
(setq ban (make-Banco))
)

(defun structCliente()
 (defstruct Cliente
  id
  nombre
  genero
  )
(setq cli (make-Cliente))
)
