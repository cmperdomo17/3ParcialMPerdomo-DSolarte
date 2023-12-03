;Integrantes:
;-Daniel Fernando Solarte Ortega
;-Carlos Mario Perdomo Ramos

(load "vecsYstructs.lsp")
(load "registrarBanco.lsp")
;(load "imprimir.lsp")
(load "buscarBanco.lsp")
(load "registrarCliente.lsp")

(crearStructBanco)
(crearStructCliente)

(loop
    (print " ===========================================")
    (print " |                M E N U                  |")
    (print " ===========================================")
    (format t" ~%") 
    (print "   1.   Registrar Banco ")
    (print "   2.   Registrar Cliente ")
    (print "   3.   Buscar Banco por: nit ")
    (print "   4.   Buscar un Cliente.")
    (print "   5. 	Consultar numero de Clientes que son de genero FEMENINO de un Banco especifico.")
    (print "   6.   Salir.")
    (format t" ~%")
    (print "   Digite la opcion:")
    (setq Opcion (read))	
    (case Opcion
        (1  (registrarBancos))
        (2  (progn
                (print "Ingrese el nit del banco al cual desea registrar clientes: ")
                (registrarClientes (read))
            )
        )
		(3  (progn
		      (print "Ingrese el nit del banco a buscar: ")
			  (buscarBanco (read))
            )
        )
    )
    (when (eq Opcion 6) (print "fin programa") (return))
)