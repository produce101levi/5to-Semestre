const todoModel = require("../models/todo_model");

exports.todoCreate = (req, res, next) => {
    todoModel.create(req.body);
    res.status(201).send();
}