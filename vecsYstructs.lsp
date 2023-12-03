;Integrantes:
;-Daniel Fernando Solarte Ortega
;-Carlos Mario Perdomo Ramos

;Declaracion de la estructura de Banco
(defun crearStructBanco()
  (defstruct Banco
    nit
    nombre
    num_empleados
    clientesBanco
  )
  ;Vector de Bancos
	(setf vectorBancos (make-array 2))
)

;Declaracion de la estructura de Cliente
(defun crearStructCliente()
	(defstruct Cliente
		id
		nombreCliente
		genero
	)
)

