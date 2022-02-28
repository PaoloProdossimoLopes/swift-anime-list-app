<a name="#top"><a/>
<p align="left"><a href="https://github.com/PaoloProdossimoLopes/repository-template/blob/main/DOCUMENTATION/ARCHITECTURE/ARCHITECTURE.md">◀️ BACK TO ARCHITECTURE</a></p>
  
  

# LOGIN VIEW
A Login view é uma das telas referente ao fluxo de login
  
  
  
## CARACTERISTICAS:
| IMPORTAÇÕES |  TIPO  |
| :---------: | :----: |
|    UIKit    | UIView |
  
<p align="right"><a href="#top">🔼 BACK TO THE TOP</a></p>

<!--
| Left-Aligned  | Center Aligned  | Right Aligned |
| :------------ |:---------------:| -----:|
| col 3 is      | some wordy text | $1600 |
| col 2 is      | centered        |   $12 |
| zebra stripes | are neat        |    $1 |
-->  
 
  
## PROTOCOLOS:
#### LoginViewDelegate:
<pre>
func enterButtonHandleTapped(_ sender: UIButton)
    |- Açao do delegate para o botao 'enter'
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
private(set) lazy var titleIcon: UIImageView = { ... }()
    |- Icone do App
    
private(set) lazy var emailTextField: UITextField = { ... }()
    |- Textfield para colocar o email e a senha
    
...
</pre>
<p align="right"><a href="#top">🔼 BACK TO THE TOP</a></p>
  
  
  
## INICIALIZADOR:
<pre>
init(delegate: LoginViewDelegate) { ... }
</pre>
<p align="right"><a href="#top">🔼 BACK TO THE TOP</a></p>
  
  
  
## METODOS:
<pre>
private func commonInit() { ... }
    |- Utilidade: Centralizar as funcoes em um starter para ser chamado no init
    
private func configureViewHierarchy() { ... }
    |- Utilidade: Centralizar os ajustes de hierarquia de view
    
private func configureConstraints() { ... }
    |- Utilidade: Centralizar os ajustes de constraints
    
....
</pre>
<p align="right"><a href="#top">🔼 BACK TO THE TOP</a></p>
  
  
  
## SELECTORS:
  
<pre>
@objc private func enterButtonWasTapped(_ sender: UIButton) { ... }
    |- Utilidade: Capturar o clique no botao para acionar o delegate
    
...
</pre>
<p align="right"><a href="#top">🔼 BACK TO THE TOP</a></p>
  

  
## EXTENSÕES PARA IMPLEMENTAÇOES:
<p align="right"><a href="#top">🔼 BACK TO THE TOP</a></p>
