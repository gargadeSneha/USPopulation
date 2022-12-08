//
//  YearVC.swift
//  USPopulation
//
//  Created by Trycatch AIr 12 on 17/10/22.
// https://datausa.io/api/data?drilldowns=Nation&measures=Population

import UIKit

class YearVC: UIViewController {
    
    
    var array = [NSDictionary]()

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationItem.setHidesBackButton(true, animated: true)
        
          tableview.delegate = self
          tableview.dataSource = self
        
        
        guard let url = URL(string: "https://datausa.io/api/data?drilldowns=Nation&measures=Population") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                do
                {
                    let jsondata = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    self.array = (jsondata as AnyObject).value(forKey: "data") as! [NSDictionary]
                    DispatchQueue.main.async {
                        self.tableview.reloadData()
                    }
                    print(jsondata)
                } catch
                {
                    print("Somthing went wrong")
                }
            }
        }.resume()
    }
  
}
extension YearVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTVC
        cell.cellLabel.text = array[indexPath.row].value(forKey: "Year") as! String
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PopulationVC") as! PopulationVC
        vc.Population = array[indexPath.row].value(forKey: "Population") as! Int
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
