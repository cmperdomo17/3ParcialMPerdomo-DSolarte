(load "registrar.lsp")
(load "imprimir.lsp")
(load "banco.lsp")
(load "cliente.lsp")

(structBanco)
(structCliente)

(loop
    (print " ===========================================")
    (print " |                M E N U                  |")
    (print " ===========================================")
    (format t" ~%") 
    (print "   1.   Registrar Banco ")
    (print "   2.   Registrar Cliente ")
    (print "   3.   Buscar Banco por: nit ")
    (print "   4.   Buscar un Cliente.")
    (print "   5. 	Consultar numero de Clientes que son de género FEMENINO de un Banco específico.")
    (print "   6.   Salir.")
    (format t" ~%")
    (print "   Digite la opcion:")
    (setq Opcion (read))	
    (case Opcion
        (1 (progn
            (registrarBanco)))
        (2 (progn
            (registrarCliente)))
		(3 (progn
			(print "Ingrese el nit del banco a buscar: ")
			(buscarBanco (read))))
    )
)