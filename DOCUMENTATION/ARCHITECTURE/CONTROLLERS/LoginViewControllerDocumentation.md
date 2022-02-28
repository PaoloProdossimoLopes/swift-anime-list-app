<a name="#top"><a/>
<p align="left"><a href="https://github.com/PaoloProdossimoLopes/repository-template/blob/main/DOCUMENTATION/ARCHITECTURE/ARCHITECTURE.md">◀️ BACK TO ARCHITECTURE</a></p>
  
  

# LOGIN VIEW CONTROLLER
A Login view é uma das telas referente ao fluxo de login
  
  
  
## CARACTERISTICAS:
#### IMPORTAÇOES:
UIKit
  
#### TIPO:
UIViewController
<p align="right"><a href="#top">🔼 BACK TO THE TOP</a></p>
  
  
## DEPENDENCIAS:
<pre>
private var viewModel: LoginViewModelProtocol?
    |- Conecçao com a viewModel
</pre>
<p align="right"><a href="#top">🔼 BACK TO THE TOP</a></p>
  
  
  
## PROPRIEDADES:
<pre>
private(set) lazy var loginView: LoginView = { ... }() 
...
</pre>
<p align="right"><a href="#top">🔼 BACK TO THE TOP</a></p>
  
  
  
## INICIALIZADOR:
<pre>
init(viewModel: LoginViewModelProtocol) { ... }
</pre>
<p align="right"><a href="#top">🔼 BACK TO THE TOP</a></p>
  
  
  
## METODOS:
<pre>
static func instantiate(delegate: LoginCoordinatorToControllerDelegate, viewModel: LoginViewModelProtocol) -> LoginViewController { ... }
    |- Instancia a controller

private func staterController() { ... }
    |- Utilidade: Centralizar as funcoes em um starter para ser chamado no viewDidLoad
....
</pre>
<p align="right"><a href="#top">🔼 BACK TO THE TOP</a></p>
  

  
## EXTENSÕES:
* LoginViewDelegate
<p align="right"><a href="#top">🔼 BACK TO THE TOP</a></p>
