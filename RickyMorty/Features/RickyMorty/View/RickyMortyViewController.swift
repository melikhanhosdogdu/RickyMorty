//
//  RickyMortyViewController.swift
//  RickyMorty
//
//  Created by Melikhan Hosdogdu on 6.10.2021.
//

import UIKit
import SnapKit

protocol RickyMortyOutput {
    func changeLoading(isLoading:Bool)
    func loadData(values: [Result])
}


final class RickyMortyViewController: UIViewController {
    private let labelTitle : UILabel = UILabel()
    private let tableView  :UITableView = UITableView()
    private let indicator : UIActivityIndicatorView = UIActivityIndicatorView()
    
    private lazy var results : [Result] = []
    private lazy var viewModel : IRickyMortyViewModel = RickyMortyViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.setDelegate(output: self)
        viewModel.fetchItems()

    } //scskj
    
  private  func configure()  {
        view.addSubview(tableView)
        view.addSubview(labelTitle)
        view.addSubview(indicator)
        drawDesing()
        makeTableView()
        makeLabel()
        makeIndicator()
        
    }
    
    private func drawDesing(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RickyMortyTableViewCell.self, forCellReuseIdentifier: RickyMortyTableViewCell.Identifier.custom.rawValue)
        tableView.rowHeight = 170
        self.view.backgroundColor = .white
        self.labelTitle.text = "Ricky Morty"
        self.labelTitle.font = .boldSystemFont(ofSize: 25)
        self.indicator.color = .blue
        self.indicator.startAnimating()
    }
    
}

extension RickyMortyViewController : RickyMortyOutput{
    func changeLoading(isLoading: Bool) {
        isLoading ? indicator.startAnimating() : indicator.stopAnimating()
    }
    
    func loadData(values: [Result]) {
        results = values
        tableView.reloadData()
    }
    
    
}

extension RickyMortyViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell : RickyMortyTableViewCell = tableView.dequeueReusableCell(withIdentifier: RickyMortyTableViewCell.Identifier.custom.rawValue) as? RickyMortyTableViewCell else {
            return UITableViewCell()
        }
        cell.saveModel(model: results[indexPath.row])
        return cell
    }
    
    
}

extension RickyMortyViewController {
    
    private func makeTableView(){
        tableView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.right.left.equalTo(labelTitle)
            
            
        }
    }
    private func makeLabel(){
        
        labelTitle.snp.makeConstraints{ (make) in
            
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.greaterThanOrEqualTo(10)
            
        }
    }
    private func makeIndicator(){
        indicator.snp.makeConstraints { make in
            make.height.equalTo(labelTitle)
            make.right.equalTo(labelTitle).offset(-5)
            make.top.equalTo(labelTitle)
        }
    }
}
