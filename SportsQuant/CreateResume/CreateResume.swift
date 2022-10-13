//
//  CreateResume.swift
//  SportsQuant
//
//  Created by talal ahmad on 13/10/2022.
//

import Foundation
import PDFKit

class CreateResume {
    
    static var shared = CreateResume()
    
    func generate(scrollView: UIView, filename: String? = nil , completion: (URL?, Error?)->() ) -> Void {
        
        var _filename = filename ?? UUID().uuidString
        
        let path = URL(fileURLWithPath: _filename).pathExtension
        if path.isEmpty || path != "pdf" {
            _filename = "\(_filename).pdf"
        }
        
        let pdfMetaData = [
            kCGPDFContextTitle : "\(filename ?? "xyz") (Resume)",
            kCGPDFContextSubject: Bundle.main.appName,
            kCGPDFContextCreator: Bundle.main.appName,
            kCGPDFContextAuthor: "123@gmail.com"
        ]
        
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]
        
        let pageRect = CGRect(origin: .zero, size: scrollView.frame.size)
        scrollView.clipsToBounds = false
        
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
                
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let outputFileURL = documentDirectory.appendingPathComponent(_filename)
                
        do {
            
            try renderer.writePDF(to: outputFileURL, withActions: { (context) in
                context.beginPage()
                let _context = context.cgContext
                
                scrollView.layer.render(in: _context)
                scrollView.clipsToBounds = true
                
                completion(outputFileURL, nil)
            })

        } catch {
            let error = "Could not create PDF file: \(error.localizedDescription)"
            completion(nil, error as? Error)
        }
        
    }
    
    func PDFToImage(url: URL, withName: String? = nil) -> URL? {
        
        guard let document = PDFDocument(url: url) else {
            return nil }     // Instantiate a `CGPDFDocument` from the PDF file's URL.
        
        guard let page = document.page(at: 0) else { return nil }  // Get the first page of the PDF document.
        let pageRect = page.bounds(for: .mediaBox)     // Fetch the page rect for the page we want to render.
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
        
        let img = renderer.image { ctx in
            UIColor.white.set()
            ctx.fill(CGRect(x: 0, y: 0, width: pageRect.width, height: pageRect.height))
            ctx.cgContext.translateBy(x: -pageRect.origin.x, y: pageRect.size.height - pageRect.origin.y)
            ctx.cgContext.scaleBy(x: 1.0, y: -1.0)
            page.draw(with: .mediaBox, to: ctx.cgContext)
        }
        
        if let data = img.jpegData(compressionQuality: 0.8) {
            guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                return nil
            }
            
            let outputFileURL = documentDirectory.appendingPathComponent("\(withName ?? UUID().uuidString).png")
                        
            do {
                try data.write(to: outputFileURL)
            } catch {}
            
            return outputFileURL
        }
        
        return nil
    }
    
    
}
