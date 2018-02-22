import Foundation

extension Job {
    
    static func fromJson(json: [String: Any]) -> Job? {
        
        //Travis or Jenkins ?
        
        if (json["slug"] != nil)
        {
            if (json["active"] as? Int == 1)
            {
                
                let dateFormatter = DateFormatter()

                dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ssZ"
                guard let timestamp = dateFormatter.date(from: json["last_build_finished_at"] as! String) else {
                    fatalError("ERROR: Date conversion failed due to mismatched format.")
                }
                
                var name = json["slug"] as! String
                if let rangeOfSlash = name.range(of: "/", options: .backwards) {
                    name = String(name.suffix(from: rangeOfSlash.upperBound))
                }
               
                let b = Build(displayName: "#" + (json["last_build_number"] as! String), estimatedDuration: json["last_build_duration"] as! Int, duration: json["last_build_duration"] as! Int, timestamp: timestamp, progress: 100)
                
                
                let jobStatus = json["last_build_status"] as! Int
                var result = JobColor.red
                if (jobStatus == 0)
                {
                    result = JobColor.blue
                }
                return Job(name: name, url: "https://travis-ci.org" + (json["slug"] as! String), jobColor: result, lastBuild: b)
            }
            else
            {
                return nil
            }
        }
        else
        {
        
        guard let name = json["name"] as? String,
            let url = json["url"] as? String,
            let colorName = json["color"] as? String,
            let color = JobColor(rawValue: colorName)
        else {
                return nil
            
        }

        let lastBuild = json["lastBuild"] as? [String: Any]
        return Job(name: name, url: url, jobColor: color, lastBuild: Build.fromJson(json: lastBuild))
        }
        
    }
    

}
