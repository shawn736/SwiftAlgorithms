import UIKit

final class AlgorithmViewController: SectionProxyTableViewController {
    
    enum Action {
        case selectCategory(Algorithm.Category)
        case selectAlgorithm(Algorithm)
    }
    
    weak var dispatcher: AlogrithmActionDispatching?
    private let footer = DonateFooterView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80))
    
    override init(style: UITableViewStyle) {
        super.init(style: .grouped)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func update(with sections: [TableSectionController]) {
        sections.forEach { section in
            section.registerReusableTypes(tableView: tableView)
        }
        
        self.sections = sections
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = footer
        
        // Setup the Search Controller
        definesPresentationContext = true
        
        hero.isEnabled = true
    }
}
