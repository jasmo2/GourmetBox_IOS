//
//  ChipsTableViewController.swift
//  SpoonBox
//
//  Created by Jaime Molina Orbe on 4/2/16.
//  Copyright © 2016 jasmo2. All rights reserved.
//

import UIKit
import Fakery
import Kingfisher


class ChipsTableViewController: UITableViewController {

    @IBOutlet weak var cancelProcessButton: UIBarButtonItem!
   
    
    let faker = Faker(locale: "es")
    let chipsImages: [String] = [
        "https://www.dropbox.com/s/7az7rn83tn9wc6i/0_9b300_6581c0db_orig.png?dl=0",
        "https://www.dropbox.com/s/ypmm87pyemj66dn/kartosh01.png?dl=0",
        "https://www.dropbox.com/s/o3ukwk9xkfd3515/0_9b2ff_20b326f6_orig.png?dl=0",
        "https://www.dropbox.com/s/l2xoswm38bkwceh/potato_PNG435.png?dl=0",
        "https://www.dropbox.com/s/u7ipuhwsia0ivuf/potato_PNG437.png?dl=0",
        "https://www.dropbox.com/s/dty30ll85e8vk4w/potato_PNG438.png?dl=0"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")

        
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        return chipsImages.count
    }

    override func viewWillAppear(animated: Bool) {
        print("viewWillAppear")
        self.navigationController!.setToolbarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController!.setToolbarHidden(true, animated: true)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SingleCell") as! SingleCellTableViewCell
        let fLorem = "\(faker.name.prefix()) \(faker.name.title()) \(faker.name.firstName()) \(faker.name.lastName())"
        cell.cellText.text = fLorem
        
        cell.cellImage.kf_showIndicatorWhenLoading = true
        let URL = NSURL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-\(indexPath.row + 1).jpg")!
        
        cell.cellImage.kf_setImageWithURL(URL, placeholderImage: nil,
                                              optionsInfo: [.Transition(ImageTransition.Fade(1))],
                                              progressBlock: { receivedSize, totalSize in
                                                print("\(indexPath.row + 1): \(receivedSize)/\(totalSize)")
            },
                                              completionHandler: { image, error, cacheType, imageURL in
                                                print("\(indexPath.row + 1): Finished")
        })
        

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func goToIndex(sender: UIBarButtonItem){
        print("cancel")
        self.navigationController!.dismissViewControllerAnimated(true, completion: nil)
    }
}
