import Foundation

extension MonitorResult {
    static func fromJson(json: [String: Any]) -> MonitorResult? {
        
        guard let name = json["name"] as? String,
            let jobs = json["jobs"] as? [[String: Any]] else {
                return nil
        }

        return MonitorResult(jobs: jobs.flatMap(Job.fromJson),
                             name: name)
    }
    
    static func fromArray(array: [Any], name : String) -> MonitorResult? {
        
        guard let jobs = array as? [[String: Any]] else {
                return nil
        }
        
        return MonitorResult(jobs: jobs.flatMap(Job.fromJson),
                             name: name)
    }
    

}
