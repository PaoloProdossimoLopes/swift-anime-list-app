<a name="#top"><a/>
<p align="left"><a href="https://github.com/PaoloProdossimoLopes/repository-template/blob/main/DOCUMENTATION/ARCHITECTURE/ARCHITECTURE.md">◀️ BACK TO ARCHITECTURE</a></p>
  
  

# LOGIN VIEW MODEL
Responsavel por conter a logica e noficar a view ou enviar comandos ao coordinator.



## CARACTERISTICAS:
#### Herança:
  - [X] Protocolos:
    - LoginViewModelProtocol
<p align="right"><a href="#top">🔼 BACK TO THE TOP</a></p>
  
 
  
## PROTOCOLS:
#### LoginViewModelProtocol:
<pre>
var viewDelegate: LoginViewToViewModel?
    
func fetchUSers()
    
...
</pre>
<p align="right"><a href="#top">🔼 BACK TO THE TOP</a></p>
  
  
  
## DEPENDENCIAS:
<pre>
private(set) weak var delegate: LoginViewDelegate?
    |- Delegate para as actions
    |- Referencia fraca
</pre>
<p align="right"><a href="#top">🔼 BACK TO THE TOP</a></p>
  
  
  
## PROPRIEDADES:
<pre>
weak var viewDelegate: LoginViewToViewModel?
    |-* Responsavel por notificar a view para que atualize

private let service: LoginServiceProtocol
    |-* Acesso para fazer as chamdas de API
    
...
</pre>
<p align="right"><a href="#top">🔼 BACK TO THE TOP</a></p>
  
  
  
## INICIALIZADOR:
<pre>
init(service: LoginServiceProtocol) { ... }
</pre>
<p align="right"><a href="#top">🔼 BACK TO THE TOP</a></p>
  
  
  
## METODOS:
<pre>
func fetchUsers() { ... }
    |-* Chama a API para buscar usuarios
    
....
</pre>
<p align="right"><a href="#top">🔼 BACK TO THE TOP</a></p>
