import UIKit
import FSPagerView

class HomeViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    @IBOutlet weak var pageControl: FSPageControl! {
        didSet {
            self.pageControl.numberOfPages = self.imageNames.count
            self.pageControl.contentHorizontalAlignment = .center
            self.pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            self.pageControl.hidesForSinglePage = true
        }
    }
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    //MARK: - Property
    fileprivate let imageNames = ["1.jpg","2.jpg","3.jpg"]
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
    }
    
    private func navagationBarStatus(offset: CGFloat) {
        if(offset > 150){
            self.navigationController?.navigationBar.isHidden = false
            self.navigationController?.navigationBar.alpha = (offset - 150) / 50
        }else{
            self.navigationController?.navigationBar.isHidden = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navagationBarStatus(offset: self.scrollView.contentOffset.y)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        self.navigationController?.navigationBar.isHidden = true
        
    }
    //MARK:: - Method
    private func setController() {
        
        
        pagerView.delegate = self
        pagerView.dataSource = self
        scrollView.delegate = self
        //네이게이션 설정
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.topItem?.title = "JOYFUL"
        self.navigationController?.navigationBar.tintColor = .white
        self.tabBarController?.tabBar.tintColor = .white
        //탭바 설정
        self.tabBarController?.tabBar.items?[0].image = UIImage(named: "Home")
        self.tabBarController?.tabBar.items?[0].title = "Home"
        self.tabBarController?.tabBar.items?[0].imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: -3, right: 0)
        self.tabBarController?.tabBar.items?[1].image = UIImage(named: "Home")
        self.tabBarController?.tabBar.items?[1].title = "Home"
        self.tabBarController?.tabBar.items?[1].imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: -3, right: 0)
        self.tabBarController?.tabBar.items?[2].image = UIImage(named: "More")
        self.tabBarController?.tabBar.items?[2].title = "More"
        self.tabBarController?.tabBar.items?[2].imageInsets = UIEdgeInsets(top: 3, left: 0, bottom: -3, right: 0)
//        self.tabBarItem.image = UIImage(named: "Home")
        
        self.title = "JOYFUL"
        pagerView.isInfinite = true
        pagerView.automaticSlidingInterval = 3.0
    }
    

}

extension HomeViewController: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.imageNames.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleAspectFill
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
    }
}

extension HomeViewController: FSPagerViewDelegate {
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControl.currentPage = targetIndex
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let OffsetY = scrollView.contentOffset.y
        if(OffsetY > 150){
            self.navigationController?.navigationBar.isHidden = false
            self.navigationController?.navigationBar.alpha = (OffsetY - 150) / 50
        }else{
            self.navigationController?.navigationBar.isHidden = true
        }
    }
    
}
