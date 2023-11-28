(load "llenar.lsp")

; Structs

(defun structCliente()
 (defstruct Cliente
  id
  nombre
  genero
  )
(setq cli (make-Cliente))
)

llenarDatosCliente(cli)