import SwiftUI
import UniformTypeIdentifiers

// DocumentPicker는 사용자가 특정 유형의 파일을 선택할 수 있도록 해주는 구조체입니다.
struct DocumentPicker: UIViewControllerRepresentable {

    var allowedTypes: [String]
    var onPick: (Result<[URL], Error>) -> Void
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        // 허용된 파일 유형 설정
        let documentTypes = allowedTypes.compactMap { UTType($0) }  // 옵셔널 바인딩으로 비옵셔널 배열로 변환
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: documentTypes, asCopy: true)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}

    class Coordinator: NSObject, UIDocumentPickerDelegate, UINavigationControllerDelegate {

        let parent: DocumentPicker

        init(_ parent: DocumentPicker) {
            self.parent = parent
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            parent.onPick(.success(urls))  // 성공적으로 URL을 가져왔을 때 처리
        }

        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            parent.onPick(.failure(NSError(domain: "UserCancelled", code: -1, userInfo: nil)))  // 취소 시 에러 처리
        }
    }
}
