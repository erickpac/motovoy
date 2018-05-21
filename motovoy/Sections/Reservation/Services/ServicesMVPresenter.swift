//
//  ServicesMVPresenter.swift
//  motovoy
//
//  Created by Erick Pac on 5/20/18.
//  Copyright © 2018 Nextdots. All rights reserved.
//

class ServicesMVPresenter {
    fileprivate let apiManager: APIManager
    fileprivate var view: ServicesMVView?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func attachView(_ view: ServicesMVView) {
        self.view = view
    }
    
    func detachView() {
        view = nil
    }
    
    func getServices() -> Void {
        let services: [ServicesMV] = [
            ServicesMV(name: "REVISIÓN", subServices: [SubServiceMV(name: "MOTOVOY BÁSICA"),
                                                        SubServiceMV(name: "MOTOVOY A PUNTO"),
                                                        SubServiceMV(name: "MOTOVOY SEGURIDAD")], expand: true),
            ServicesMV(name: "CAMBIAR ACEITE", subServices: [SubServiceMV()], expand: false),
            ServicesMV(name: "PASAR ITV", subServices: [SubServiceMV(name: "COM REVISIÓN PRE-ITV (PVP €)"),
                                                         SubServiceMV(name: "SÓLO PASAR ITV (PVP €)")], expand: true),
            ServicesMV(name: "PASTILLAS DE FRENO", subServices: [SubServiceMV(name: "PASTILLA DELANTERA (PVP €)"),
                                                                  SubServiceMV(name: "PASTILLA TRASERA (PVP €)"),
                                                                  SubServiceMV(name: "AMBAS (PVP €)")], expand: true),
            ServicesMV(name: "CAMBIAR NEUMÁTICOS", subServices: [SubServiceMV(name: "NEUMÁTICO DELANTERO"),
                                                                  SubServiceMV(name: "NEUMÁTICO TRASERO"),
                                                                SubServiceMV(name: "AMBOS")], expand: true),
            ServicesMV(name: "CAMBIAR BATERÍA", subServices: [SubServiceMV(name: "CAMBIAR BATERÍA (PVP €)")], expand: true),
            ServicesMV(name: "OTROS", subServices: [SubServiceMV()], expand: false),
        ]
        
        view?.getServicesSuccess(services: services)
    }
}
