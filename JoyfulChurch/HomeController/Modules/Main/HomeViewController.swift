import UIKit
import FSPagerView
import SwiftyJSON

let MENUCELLHEIGHT: CGFloat = 460/3

class HomeViewController: UIViewController {
    
    // MARK: - Property
    private var imageURLs = [URL]()
    private var images = [UIImage]()
    private var menuArray = ["EVENT", "CONNECT", "PRAYER", "SOCIAL"]
    private let homeVM = HomeViewModel()
    
    // MARK: - IBOutlet
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    @IBOutlet weak var pageControl: FSPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var menuBaseView: UIView!
    @IBOutlet weak var menuBaseViewHeight: NSLayoutConstraint!
    @IBOutlet weak var menuTableView: UITableView!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setController()
        scrollView.contentInsetAdjustmentBehavior = .never
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }


    // MARK: : - Method
    private func setController() {
        
        //메뉴 테이블 뷰 설정
        self.menuTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
        
        //페이지뷰 설정
        pagerView.delegate = self
        pagerView.dataSource = self
        pagerView.isInfinite = true
        pagerView.automaticSlidingInterval = 10.0
        scrollView.delegate = self
        
        //네이게이션 설정
        self.navigationController?.navigationBar.isHidden = true
        
        DispatchQueue.global().async {
            self.homeVM.getMainBannerImages { [weak self] (urls) in
                guard let self = self else { return }
                self.imageURLs = urls
//                for url in self.imageURLs {
//                    guard let data = try? Data(contentsOf: url), let image = UIImage(data: data) else { continue }
//                    self.images.append(image)
//                    Log.tj(self.images)
//                }
                Log.tj(self.imageURLs)
                self.pagerView.reloadData()
                self.pageControl.numberOfPages = self.imageURLs.count
                self.pageControl.contentHorizontalAlignment = .center
                self.pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
                self.pageControl.hidesForSinglePage = true
            }
        }
    }
}

extension HomeViewController: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.imageURLs.count
    }

    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: "EmptyPhoto")
        cell.imageView?.kf.setImage(with: imageURLs[index])
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

    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pageControl.currentPage = pagerView.currentIndex
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY >= 0 && offsetY <= 50 {
            headerView.alpha = offsetY / 50
        } else if offsetY < 0 {
            headerView.alpha = 0
        } else {
            headerView.alpha = 1
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MENUCELLHEIGHT
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
        let segue = cell.getSegueIdentifierFromSelectedRows(indexPath: indexPath)
        self.performSegue(withIdentifier: segue, sender: nil)
    }

    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
        cell.contentView.backgroundColor = .white
    }

    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuBaseViewHeight.constant = MENUCELLHEIGHT * CGFloat(menuArray.count)
        return menuArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell

        cell.menuImageView.image = UIImage(named: menuArray[indexPath.row])

        return cell
    }

}
