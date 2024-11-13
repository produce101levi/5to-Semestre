const TodoController = require("../../controllers/todo_controller");
const TodoModel = require("../../models/todo_model");


const httpMocks = require("node-mocks-http");
const newTask = require("../mockups/todo_mockup.json");

TodoModel.create = jest.fn();

let req, res, next;
beforeEach(() => {
    res = httpMocks.createResponse();
    req = httpMocks.createRequest();
    next = null;
})

describe("Test Create method exists", () => {
    it("should have a create method", () => {
        expect(typeof TodoController.todoCreate).toBe("function");
    });
    
    it("should call todoModel.create", () => {
        req.body = newTodo;
        TodoController.todoCreate(req, res, next);
        expect(TodoModel.create).toBeCalledWith(newTodo);
    });
})