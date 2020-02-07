import UIKit
import SnapKit

let MORECELL_HEIGHT: CGFloat = 50

class MoreViewController: UIViewController {

    @IBOutlet weak var moreTableView: UITableView!
    @IBOutlet weak var moreTableViewHeight: NSLayoutConstraint!
    
    let moreTitleArray: [String] = ["교회 소개", "목사님 소개", "선교 히스토리"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.alpha = 1.0
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Method
    private func setController() {
        self.moreTableView.delegate = self
        self.moreTableView.dataSource = self
        
        self.navigationController?.navigationBar.topItem?.title = "MORE"
        self.navigationController?.navigationBar.tintColor = .white
    }
}

extension MoreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        moreTableViewHeight.constant = MORECELL_HEIGHT * CGFloat(moreTitleArray.count)
        self.view.layoutIfNeeded()
        return MORECELL_HEIGHT
    }
}

extension MoreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moreTableViewHeight.constant = MORECELL_HEIGHT * CGFloat(moreTitleArray.count)
        print(moreTableViewHeight.constant)
        print(moreTableView.contentSize.height)
        print(moreTitleArray.count)
        
//        moreTableView.snp.makeConstraints { (make) in
//            make.height.equalTo(MORECELL_HEIGHT * CGFloat(moreTitleArray.count))
//        }
        return moreTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        moreTableViewHeight.constant = MORECELL_HEIGHT * CGFloat(moreTitleArray.count)
        cell!.textLabel?.text = moreTitleArray[indexPath.row]
        return cell!
    }
}

extension MoreViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if(viewController != self.tabBarController?.viewControllers![0]){
            self.navigationController?.navigationBar.isHidden = false
        }else{
            self.navigationController?.navigationBar.isHidden = true
        }
        print(self)
        print("selectedViewcontroller", tabBarController.selectedViewController)
        print("viewcontroller", viewController)
    }
}
