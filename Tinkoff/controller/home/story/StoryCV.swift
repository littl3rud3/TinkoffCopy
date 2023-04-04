import UIKit
import SkeletonView

class StoryCV: UICollectionView {

    private var viewModel: IGHomeViewModel = IGHomeViewModel()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 3
        layout.itemSize = CGSize(width: 105, height: 110)
        
        super.init(frame: CGRect.zero, collectionViewLayout: layout)

        backgroundColor = .clear
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.reuseIdentifier)
        translatesAutoresizingMaskIntoConstraints = false
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extension|UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
extension StoryCV: UICollectionViewDelegate,SkeletonCollectionViewDataSource,
                       UICollectionViewDelegateFlowLayout {
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> SkeletonView.ReusableCellIdentifier {
        StoryCell.reuseIdentifier
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: StoryCell.reuseIdentifier,for: indexPath) as? StoryCell else { fatalError() }
        let story = viewModel.cellForItemAt(indexPath: indexPath)
        cell.story = story
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            if let stories = self.viewModel.getStories(), let stories_copy = try? stories.copy().stories {
                let storyPreviewScene = IGStoryPreviewController.init(stories: stories_copy, handPickedStoryIndex:  indexPath.row, handPickedSnapIndex: 0)
                storyPreviewScene.modalPresentationStyle = .overFullScreen
                self.parentViewController?.present(storyPreviewScene, animated: true, completion: nil)
            }
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 80, height: 100)
//    }
}
