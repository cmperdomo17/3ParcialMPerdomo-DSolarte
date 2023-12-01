;Integrantes:
;-Daniel Fernando Solarte Ortega
;-Carlos Mario Perdomo Ramos

;Declaracion de la estructura de Banco
(defun crearStructBanco()
    (defstruct Banco
      nit
      nombre
      num_empleados
    )
    ;Vector de Bancos
	(setf vectorBancos (make-array 2))
)

;Declaracion de la estructura de Cliente
(defun crearStructCliente()
	(defstruct Cliente
		nitBanco
		id
		nombre
		genero
	)
	;Vector de Clientes
	(setf vectorClientes (make-array 3))
	(setq cli (make-Cliente)) ;Estructura de cliente ///ESTO NO SE DECLARA AQUI PQ HACE QUE LOS DATOS SE REPITAN
)

