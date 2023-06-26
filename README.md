> #  Whitehouse Petitions 📰 



		
#### Proyecto7 del Libro "[Hacking with iOS: Edición UIKit - Pablo Hudson](https://www.hackingwithswift.com/read "Hacking with iOS: Edición UIKit - pablo hudson")"

#### Whitehouse Petitions es una App creada con el fin de tomar una fuente de datos de un sitio web y analizarla en información útil para los usuarios. La opción elegida fué la petición de la Casa Blanca "Nosotros, el pueblo" en los EE. UU., donde los estadounidenses pueden enviar solicitudes de acción y otros pueden votar al respecto.
---


#### 📚Inmersiones acerca de 
1. UITabBarController
2. UITableViewController
3.  UINavigationController
4. WebKit
5.  Parsing JSON using the Codable protocol


-----
- UITableViewController📱 y Parsing JSON 
 #####La Subclase de "ViewController" es responsable de mostrar una lista de peticiones en una tabla, obtener los datos de las peticiones desde una fuente externa, permitir la selección de una petición para ver los detalles y mostrar un mensaje de créditos al usuario.
 
1.  Método showError():Crea y presenta un controlador de alerta (UIAlertController) con un título y un mensaje de error.
 
2. Método Parse (JSON): Crea una instancia del decodificador de JSON . Intenta decodificar los datos JSON proporcionados en el parámetro json utilizando el tipo Petitions. Si la decodificación tiene éxito, asigna los resultados de las peticiones decodificadas al arreglo petitions y actualiza la tabla (tableView) para mostrar los datos.

3. Método showCredits(): Crea y presenta un controlador de alerta (UIAlertController) con un título y un mensaje de créditos.

 

```swift
import UIKit

class ViewController: UITableViewController {
    .    var petitions = [Petition]()

	  func showError(){
	  }
////descargando JSON con tipo de datos
	   func parse(json: Data) { 
	   “ let decoder = JSONDecoder()
	   
//encuentra este tipo y hazlo un objeto
    if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
        petitions = jsonPetitions.results
        tableView.reloadData()
    }
}”
	   
 @objc func showCredits() { 
 }
 
}
```

-  WebKit 🖥️
#####El framework que facilita la integración y visualización de contenido web en aplicaciones iOS y macOS a través de la clase WKWebView. Podremos ver en detalle lo que está en subtítulo

```swift
    import UIKit
    import WebKit
    
    class DetailViewController: UIViewController {
	
     var webView: WKWebView!
	 
	  override func viewDidLoad() {
        super.viewDidLoad()

        webView = WKWebView()
         view = webView
		 
		  // html personalizado
        webView.loadHTMLString(html, baseURL: nil)
}

```



------------

- NavigationController 📲

#####Se establece el botón "Créditos" en la barra de navegación y determina la URL a utilizar para obtener los datos de las peticiones. Dependiendo de la etiqueta del elemento de la pestaña actual en el controlador de navegación, se asigna una URL diferente a la variable urlString. Esto permite cargar datos de diferentes fuentes dependiendo de la selección de la pestaña.

[![Navigation Controller](https://static.javatpoint.com/tutorial/ios/images/ios-navigation-controller6.png "Navigation Controller")](http://https://www.javatpoint.com/ios-navigation-controller "Navigation Controller")

```swift
 override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Créditos", style: .plain, target: self, action: #selector(showCredits))
		
 if navigationController?.tabBarItem.tag == 0 {
          urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=100008&limit=100"
        }
```




----
-  UITabBarController 🀰
#####Administra una variedad de controladores de vista entre los que el usuario puede elegir. La utilizaremos para mostrar las recientes peticiones y otra para mostrar las peticiones populares. 

Agregamos el nuevo controlador de vista a la matriz viewControllers de nuestro controlador de barra de pestañas, lo que hará que aparezca en la barra de pestañas. Creamos un objeto UITabBarItem para el nuevo controlador de vista, otorgándole el ícono "Top Rated"

[![UITabBarController](https://i.stack.imgur.com/YqimMl.pnghttps://stackoverflow.com/questions/71194968/setting-a-uitabbarappearance-breaks-uitabbaritem-appearance-proxy-font-size-when "UITabBarController")](https://stackoverflow.com/questions/71194968/setting-a-uitabbarappearance-breaks-uitabbaritem-appearance-proxy-font-size-when "UITabBarController")



