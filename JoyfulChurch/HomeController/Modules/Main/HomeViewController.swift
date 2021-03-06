import UIKit
import FSPagerView

let MENUCELLHEIGHT: CGFloat = 460/3

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
    @IBOutlet weak var menuBaseView: UIView!
    @IBOutlet weak var menuBaseViewHeight: NSLayoutConstraint!
    @IBOutlet weak var menuTableView: UITableView!
    
    //MARK: - Property
    fileprivate let imageNames = ["1.jpg","2.jpg","3.jpg"]
    fileprivate let menuArray = ["EVENT", "CONNECT", "PRAYER", "SOCIAL"]
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(enterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(enterForeground), name: UIApplication.didBecomeActiveNotification, object: nil)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
        navagationBarStatus(offset: self.scrollView.contentOffset.y)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
        NotificationCenter.default.removeObserver(self, name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
        print("viewWillDisappear")
    }
    
    //MARK:: - Method
    private func setController() {
        self.menuTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
        
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
        pagerView.automaticSlidingInterval = 10.0
    }
    
    private func navagationBarStatus(offset: CGFloat) {
        self.navigationController?.navigationBar.isHidden = true
        if(offset > 50){
            self.navigationController?.navigationBar.isHidden = false
            self.navigationController?.navigationBar.alpha = (offset - 50) / 50
            
        }else{
            self.navigationController?.navigationBar.isHidden = true
        }
    }
    
    @objc private func enterForeground() {
        print("enterForeground")
        self.navigationController?.navigationBar.isHidden = true
        navagationBarStatus(offset: self.scrollView.contentOffset.y)
    }
    
    @objc func enterBackground() {
        print("enterBackground")
        self.navigationController?.navigationBar.isHidden = true
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
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pageControl.currentPage = pagerView.currentIndex
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let OffsetY = scrollView.contentOffset.y
        if(OffsetY > 50){
            self.navigationController?.navigationBar.isHidden = false
            self.navigationController?.navigationBar.alpha = (OffsetY - 50) / 50
        }else{
            self.navigationController?.navigationBar.isHidden = true
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
