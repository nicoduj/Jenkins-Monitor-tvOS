import UIKit

protocol JobCellCreator: class {
    func configureCell(indexPath: IndexPath, from job: Job?) -> UICollectionViewCell
}

protocol DataSourceDelegate: class {
    func dataSourceDidRefreshItems()
}

class MonitorServiceDataSource: NSObject, UICollectionViewDataSource {

    weak var jobCellCreator: JobCellCreator?
    weak var delegate: DataSourceDelegate?

    var lastResult: MonitorResult? {
        didSet {
            self.delegate?.dataSourceDidRefreshItems()
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lastResult?.jobs?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let jobCellCreator = jobCellCreator else {
            return UICollectionViewCell()
        }

        return jobCellCreator.configureCell(indexPath: indexPath, from: lastResult?.jobs?[indexPath.row])
    }
    
    
    // The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MonitorViewTitle", for: indexPath)
            
            
            
            guard let dashboardTitleView = headerView as? DashboardTitleView else {
                return headerView
            }
        
            dashboardTitleView.titleLabel.text = self.lastResult?.name
            
            dashboardTitleView.backgroundColor = UIColor(red:0.85, green:0.93, blue:0.97, alpha:1.0);
            dashboardTitleView.titleLabel.textColor = UIColor(red:0.19, green:0.44, blue:0.56, alpha:1.0);
            dashboardTitleView.layer.borderWidth = 3.0
            dashboardTitleView.layer.borderColor = UIColor(red:0.74, green:0.87, blue:0.95, alpha:1.0).cgColor

            
            return dashboardTitleView

            
        default:
            
            assert(false, "Unexpected element kind")
        }
        
    }
    


    func refreshData(url: String) {
        MonitorService().getMonitor(with: url) { [weak self] (monitorResult, error) in
            guard let strongSelf = self else { return }
            if let error = error {
                print(error)
                return
            }

            strongSelf.lastResult = monitorResult
        }
    }

    
}
