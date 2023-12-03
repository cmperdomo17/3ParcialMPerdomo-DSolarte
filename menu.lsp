;Integrantes:
;-Daniel Fernando Solarte Ortega
;-Carlos Mario Perdomo Ramos

(load "vecsYstructs.lsp")
(load "registrarBanco.lsp")
(load "registrarCliente.lsp")
(load "buscarBanco.lsp")
(load "consultarCliente.lsp")
(load "consultarFemenino.lsp")

(crearStructBanco) ; Crea la estructura para los bancos y el vector de bancos
(crearStructCliente) ; Crea la estructura para los clientes

(loop
    (print " ===========================================")
    (print " |                M E N U                  |")
    (print " ===========================================")
    (format t" ~%") 
    (print "   1.   Registrar Banco ")
    (print "   2.   Registrar Cliente ")
    (print "   3.   Buscar Banco por: nit ")
    (print "   4.   Buscar un Cliente.")
    (print "   5.   Contar Mujeres Clientes en un Banco.")
    (print "   6.   Salir.")

    (format t" ~%")
    (print "   Digite la opcion:")
    (setq Opcion (read))
    (setq band 1);Bandera para las validaciones de los datos 1=true,0=false	

    (case Opcion
        (1  (registrarBancos))
        (2  (progn
                (loop
                    (print "Ingrese el nit del banco al cual desea registrar clientes: ")
                    (setq nit (read))
                    (if (typep nit 'integer) 
                        (setq band 1) ;Si el tipo de dato es entero entonces el loop termina
                        (progn (setq band 0) (format  t"Error! Ingrese un tipo de dato valido para el Nit...~%"))
                    )
                    (when (= band 1) (return ))
                )
                (registrarClientes nit)
            )
        )
		(3  (progn
                (loop
                    (print "Ingrese el nit del banco a buscar: ")
                    (setq nit (read))
                    (if (typep nit 'integer) 
                        (setq band 1) ;Si el tipo de dato es entero entonces el loop termina
                        (progn (setq band 0) (format  t"Error! Ingrese un tipo de dato valido para el Nit...~%"))
                    )
                    (when (= band 1) (return ))
                )
			    (buscarBanco nit)
            )
        )
        (4  (progn
                (loop
                    (print "Ingrese el nit del banco a buscar: ")
                    (setq nit (read))
                    (if (typep nit 'integer) 
                        (progn ;Si el tipo de dato del nit es entero entonces se pide el id del cliente
                            (print "Ingrese el id del cliente a buscar: ")
                            (setq id (read))
                            (if (typep id 'integer)
                                (setq band 1);Si el tipo de dato del id es entero entonces el loop termina
                                (progn (setq band 0) (format  t"Error! Ingrese un tipo de dato valido para el Id...~%"))
                            )
                        )
                        (progn (setq band 0) (format  t"Error! Ingrese un tipo de dato valido para el Nit...~%"))
                    )
                    (when (= band 1) (return ))
                )
                (buscarCliente nit id)
            )
        )
        (5  (progn
                (loop
                    (print "Ingrese el nit del banco a buscar: ")
                    (setq nit (read))
                    (if (typep nit 'integer) 
                        (setq band 1) ;Si el tipo de dato es entero entonces el loop termina
                        (progn (setq band 0) (format  t"Error! Ingrese un tipo de dato valido para el Nit...~%"))
                    )
                    (when (= band 1) (return ))
                )
                
                (buscarMujeres nit)
            )
        )
    )
    (when (eq Opcion 6) (print "fin programa") (return))
)