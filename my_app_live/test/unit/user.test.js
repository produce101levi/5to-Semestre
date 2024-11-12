const userModel = require("../../models/user");

describe("User Model Test", () => {
    
    it("should be able to return whether the user is adult", () => {
        const user = new userModel({username: "John Doe", age: 20});
        expect(user.isAdult()).toBeTruthy();
    })

    it("should be able to return whether the user is not an adult", () => {
        const user = new userModel({username: "John Doe", age: 16});
        expect(user.isAdult()).toBeFalsy();
    })
})