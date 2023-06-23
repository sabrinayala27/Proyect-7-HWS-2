//
//  DetailViewController.swift
//  Proyect 7 HWS
//
//  Created by Sabrina Ayala on 08/05/2023.
//

//Estaremos aprendiendo acerca de UITabBarController que maneja una matriz de ViewControllers

import UIKit
import WebKit

//it is a free floating class
// podremos ver en detalle lo que esta en el subtitulo 
class DetailViewController: UIViewController {
    var webView: WKWebView!
    
    //wich petition to show on the screen
    // tenemos que utilizar HTML para poder configurar bien las proporciones
    //HTML se utiliza principalmente para crear la estructura y el contenido de una pág web
    var detailItem: Petition?

    override func viewDidLoad() {
        super.viewDidLoad()

        webView = WKWebView()
         view = webView
        
        // revisamos que el item exista para poder utilizarlo
        guard let detailItem = detailItem else { return }
        
        //multylines here
        //we wanted to load our own HTML rather than a web site, so we used the loadHTMLString() method.
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 100%; } </style>
        </head>
        </body>
        \(detailItem.body)
        </body>
        </html>
        """
        
        // html personalizado
        webView.loadHTMLString(html, baseURL: nil)

      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
