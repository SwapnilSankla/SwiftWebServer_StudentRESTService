import Vapor
import HTTP

struct Student {
    let rollNumber: String 
    let firstName: String
    let lastName: String
    let collegeName: String
}

extension Student {
    init(req: Request) throws {
        guard let json = req.json else {
            throw Abort.badRequest
        }

        if let rollNumber = json["rollNumber"]?.string,
           let firstName = json["firstName"]?.string,
           let lastName = json["lastName"]?.string,
           let collegeName = json["collegeName"]?.string {
            self.rollNumber = rollNumber
            self.firstName = firstName
            self.lastName = lastName
            self.collegeName = collegeName
        } else {
            throw Abort.badRequest
        }
    }

    func toMap() -> Dictionary<String, String> {
        return ["firstName": firstName,
                "lastName": lastName,
                "rollNumber": rollNumber,
                "collegeName": collegeName]
    }
}
