//
//  TableViewController.swift
//  JsonParse
//
//  Created by Aditya on 09/07/21.
//

import UIKit

class TableViewController: UITableViewController {
    var employeList: [employe] = [employe]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()

       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return employeList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell?.textLabel?.text = 
        "\(employeList[indexPath.row].Name) , \(employeList[indexPath.row].Email) , \(employeList[indexPath.row].Department)"
        return cell!
    }
    
func fetchData()
{
    guard let fileLocation = Bundle.main.url(forResource: "employe", withExtension: "json")
    else{
        return
    }
    do{
        let data = try Data(contentsOf: fileLocation)
        let receivedData = try JSONDecoder().decode([employe].self, from: data)
        self.employeList = receivedData
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    catch{
        print("error while decoding")
    }
}

}
