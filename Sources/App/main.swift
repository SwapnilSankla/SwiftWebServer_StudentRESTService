import Vapor

let drop = Droplet()
let studentController = StudentController()
drop.post("student", handler: studentController.post)
drop.get("student", handler: studentController.get)
drop.get("student", String.self, handler: studentController.get)
drop.put("student", handler: studentController.put)
drop.delete("student", String.self, handler: studentController.delete)
drop.run()
