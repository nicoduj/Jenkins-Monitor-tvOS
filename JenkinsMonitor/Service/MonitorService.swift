import Alamofire

class MonitorService {

    
    func getMonitor(with url: String, completionHandler: @escaping (MonitorResult?, Error?) -> ()) {
        
        var localURL : String
        var isTravis = false
        
        if (url.contains("api.travis-ci"))
        {
            localURL = url
            isTravis = true
        }
        else
        {
            localURL = url.appending("/api/json?tree=name,jobs[name,url,color,lastBuild[displayName,estimatedDuration,timestamp,duration]]")
        }

        Alamofire.request(localURL)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    if (isTravis)
                    {

                        guard let array = response.result.value as? [Any],
                            let monitorResult = MonitorResult.fromArray(array: array, name: localURL) else {
                                completionHandler(nil, NSError(domain: "Can't parse json result", code: 0, userInfo: nil))
                                return
                        }
                        completionHandler(monitorResult, nil)
                    }
                    else
                    {

                        guard let json = response.result.value as? [String: Any],
                            let monitorResult = MonitorResult.fromJson(json: json) else {
                                completionHandler(nil, NSError(domain: "Can't parse json result", code: 0, userInfo: nil))
                                return
                        }
                        completionHandler(monitorResult, nil)
                    }


                    
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
}
