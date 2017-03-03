import Foundation
import Vapor
import HTTP

class StudentController {
    var students: Dictionary<String, Dictionary<String, String>> = Dictionary()

    func get(req: Request) throws -> ResponseRepresentable {
        let studentsJson = try students.toJson()
        return Response(headers: ["Content-Type": "application/json; charset=utf-8"], body: studentsJson)
    }

    func get(req: Request, rollNumber: String) throws -> ResponseRepresentable {
        guard let student = students[rollNumber] else {
            throw Abort.serverError
        }
        return try JSON(node: student)
    }

    func post(req: Request) throws -> ResponseRepresentable {
        let student = try Student(req: req)
        students[student.rollNumber] = student.toMap()
        return JSON.empty()
    }

    func put(req: Request) throws -> ResponseRepresentable {
        let student = try Student(req: req)
        if(students.keys.contains(student.rollNumber)) {
            students[student.rollNumber] = student.toMap()
        } else {
            throw Abort.badRequest
        }
        return JSON.empty()
    }

    func delete(req: Request, rollNumber: String) throws -> ResponseRepresentable {
        if(students.keys.contains(rollNumber)) {
            students.removeValue(forKey: rollNumber)
        } else {
            throw Abort.badRequest
        }
        return JSON.empty()
    }
}
