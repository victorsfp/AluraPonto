//
//  Camera.swift
//  Alura Ponto
//
//  Created by Victor dos Santos Feitosa on 29/10/24.
//

import Foundation
import UIKit

protocol CameraDelegalate: AnyObject {
    func didSelectFoto(_ image: UIImage)
}

class Camera: NSObject {
    
    weak var delegate: CameraDelegalate?
    
    func abrirCamera(_ controller: UIViewController, _ imagePicker: UIImagePickerController) {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
        imagePicker.cameraDevice = UIImagePickerController.isCameraDeviceAvailable(.front) ? .front : .rear
        
        controller.present(imagePicker, animated: true)
    }
    
    func abrirBibliotecaFotos(_ controller: UIViewController, _ imagePicker: UIImagePickerController) {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        controller.present(imagePicker, animated: true)
    }
}

extension Camera: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true)
        guard let foto = info[.editedImage] as? UIImage else { return }
        
        delegate?.didSelectFoto(foto)
    }
    
}
