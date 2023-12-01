;Integrantes:
;-Daniel Fernando Solarte Ortega
;-Carlos Mario Perdomo Ramos

;Funcion para llenar los datos de los Bancos
(defun registrarBancos()
    (setq band 1);Bandera para las validaciones de los datos 1=true,0=false
    (setq i 0)
    (loop
        (format t"----Datos Banco: ~d----~%" (+ i 1))
        (setq banco (make-Banco)) ;Estructura de banco
        ;Ingresar Nit del Banco
        (loop
            (print "Digite el nit:")
            (setf (Banco-nit banco)(read))
            (if (typep (Banco-nit banco) 'integer) 
                (setq band 1) ;Si el tipo de dato es entero entonces el loop termina
                (progn (setq band 0) (format  t"Error! Ingrese un tipo de dato valido para el Nit...~%"))
            )
            (when (= band 1) (return ))
        )
        ;Ingresar Nombre del Banco
        (loop
            (print "Digite el nombre:")
            (setf (Banco-nombre banco)(read))
            (if (typep (Banco-nombre banco) 'number) 
                (progn (setq band 0) (format  t"Error! Ingrese un tipo de dato valido para el nombre...~%"))
                (setq band 1) ;Si el tipo de dato no es un numero entonces el loop termina
            )
            (when (= band 1) (return ))
        )
        ;Ingresar el numero de empleados del Banco
        (loop
            (print "Digite el numero de empleados:")
            (setf (Banco-num_empleados banco)(read))
            (if (typep (Banco-num_empleados banco) 'integer) 
                (setq band 1) ;Si el tipo de dato es entero entonces el loop termina
                (progn (setq band 0) (format  t"Error! Ingrese un tipo de dato valido para el numero de empleados...~%"))
            )
            (when (= band 1) (return ))
        )
        ;Registrar el banco en el vector
        (setf (aref vectorBancos i) banco)
        (setq i (+ i 1))
        (when (> i 1) (return ))
    )
)


