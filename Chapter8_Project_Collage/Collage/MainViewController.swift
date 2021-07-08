/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import Combine

final class MainViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imagePreview: UIImageView! {
        didSet {
            imagePreview.layer.borderColor = UIColor.gray.cgColor
        }
    }
    @IBOutlet weak var buttonClear: UIButton!
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var itemAdd: UIBarButtonItem!
    
    // MARK: - Private properties
    
    private var subscriptions: Set<AnyCancellable> = .init()    // 현재 VC의 생명주기와 연결된 UI subscriptions 들을 저장한다. VC가 네비게이션 스택에서 pop 되거나 dismiss 되면, 그 즉시 구독들은 취소된다.
    private let images: CurrentValueSubject<[UIImage], Never> = .init([])   // 유저의 현재 선택된 사진들을 내보내는 용도로 사용.
    // 데이터를 UI 요소에 바인딩할때, CurrentValueSubject가 PassthroughSubject 보다 적합하다고 한다. 전자는 구독시 최소한 하나의 값이 전송되고, UI가 정의되지 않은 상태를 가지지 않도록 항상 보장한다. 즉 깨진상태에서 초기값을 기다리지 않는다.
    
    // MARK: - View controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let collageSize = imagePreview.frame.size
        
        images
            .handleEvents(receiveOutput: { [weak self] photos in
                self?.updateUI(photos: photos)
            })  // collage에 사진을 추가할 때 마다 handleEvents operator가 실행된다. 이 operator는 publisher가 이벤트를 내보낼때 사이드이펙트를 야기할 수도 있는데, 이는 chapter 10에서 다룬다.
            .map { photos in
                UIImage.collage(images: photos, size: collageSize)
            }
            .assign(to: \.image, on: imagePreview)  // photo를 imagePreview.image 에 바인딩한다.
            .store(in: &subscriptions)
    }
    
    private func updateUI(photos: [UIImage]) {
        buttonSave.isEnabled = photos.count > 0 && photos.count % 2 == 0
        buttonClear.isEnabled = photos.count > 0
        itemAdd.isEnabled = photos.count < 6
        title = photos.count > 0 ? "\(photos.count) photos" : "Collage"
    }
    
    // MARK: - Actions
    
    @IBAction func actionClear() {
        images.send([])
    }
    
    @IBAction func actionSave() {
        guard let image = imagePreview.image else { return }
        
        PhotoWriter.save(image)
            .sink(receiveCompletion: { [unowned self] completion in
                if case .failure(let error) = completion {
                    self.showMessage("Error", description: error.localizedDescription)
                }
                self.actionClear()
            }, receiveValue: { [unowned self] id in
                self.showMessage("Saved with id: \(id)")
            })
            .store(in: &subscriptions)
    }
    
    @IBAction func actionAdd() {
        let photosVC = storyboard!.instantiateViewController(withIdentifier: "PhotosViewController") as! PhotosViewController
        
        photosVC.$selectedPhotosCount
            // selectedPhotosCount를 현재 뷰컨의 title에 바인딩
            // --> publisher의 출력을 수신측의 특정 인스턴스 속성에 바인딩
            // 일반적으로 모델을 뷰의 속성에 바인딩하고, 네트워크 요청을 뷰모델의 입력에 바인딩 하는 등으로 쓰인다.
            .filter { $0 > 0 }
            .map { "Selected \($0) photos" }
            .assign(to: \.title, on: self)
            .store(in: &subscriptions)
        
        let newPhotos = photosVC.selectedPhotos
            .prefix(while: { [unowned self] _ in
                return self.images.value.count < 6
            })
            .share()
        // 동일한 publisher에 대해 여러 구독을 만들때 이런식으로 publisher을 공유하는 식으로 써야 안전하다.
        // 주의할 점은, share()은 공유구독에서 같은 값을 다시 내보내지 않는다.
        // 예를 들어서, share()에 대해 두개의 구독을 가지고 있고, source publisher가 동기적으로 값을 내보내면, 첫번째 출력값은 두번째 subscriber가 구독할 기회를 갖기 전에 오직 첫번째 subscriber에게만 전달된다.
        //  source publisher가 비동기적으로 값을 내보내는 경우는 문제없음
        //  이게 대체 무슨 말이지 ......
        //  이를 해결하기 위해 새로운 subscriber가 구독할 때 과거 값을 다시 내보내는 자체 공유 연산자를 구축한다고  한다. Chapter 18에서 shareReply() 때 다시 언급될 예정.
        
        newPhotos
            .map { [unowned self] newImage in
                return self.images.value + [newImage]
            }
            .assign(to: \.value, on: images)
            .store(in: &subscriptions)
        
        newPhotos
            .ignoreOutput() // 값은 무시하고 오직 completion event만 제공한다.
            .delay(for: 2.0, scheduler: DispatchQueue.main) // selectedPhotosCount에 의한 타이틀을 2초동안 유지했다가 바꾼다.
            .sink(receiveCompletion: { [unowned self] _ in
                self.updateUI(photos: self.images.value)
            }, receiveValue: { _ in })
            .store(in: &subscriptions)
        
        navigationController?.pushViewController(photosVC, animated: true)
    }
    
    private func showMessage(_ title: String, description: String? = nil) {
        /*
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { alert in
            self.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
        */
        alert(title: title, text: description)
            .sink(receiveValue: { _ in })
            .store(in: &subscriptions)
    }
}
