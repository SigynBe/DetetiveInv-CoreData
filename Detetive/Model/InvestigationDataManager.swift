//
//  InvestigationDataManager.swift
//  Detetive
//
//  Created by Rebeca Pacheco on 11/12/20.
//

import Foundation
import CoreData

internal struct InvestigationDataManager{
    
    static let shared = InvestigationDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error{
                fatalError("erro de load \(error)")
            }
        }
        return container
    }()
    
    //Criar e Salvar registro no banco
    func createInvestigationNote(weapon: String?, hour: String?, local: String?, suspect: String?) -> Investigation? {
        
        let context = persistentContainer.viewContext
        let investigationDetails = NSEntityDescription.insertNewObject(forEntityName: "Investigation", into: context) as! Investigation
        
        investigationDetails.reportHour = hour
        investigationDetails.reportWeapon = weapon
        investigationDetails.reportLocal = local
        investigationDetails.reportSuspect = suspect
        
        do {
            try context.save()
            return investigationDetails
        } catch let createError {
            print("Failed to create: \(createError)")
        }
        
        return nil
    }
    
    //Listar registros do banco
    
    //Listar registros do banco
    
    //Deletar Registro do banco
    
}

