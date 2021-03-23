import React, { Component } from "react";

export default class SignUp extends Component {

    addUser() {
        fetch('http://192.168.50.71:8000/third_party_login',
        {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5zIn0.IW9X3o4xo5xxOPWE-UE2ZojD4Ee8-26L2wdYvWkm6ao"
        },
        body: JSON.stringify({
            name: document.getElementById("name").value,
            email: document.getElementById("email").value,
            login_token: document.getElementById("login_token").value
        })
         })
         .then(reply => {
         console.log("Added");
        });
    }
        
    render() {
        return (
            <form>
                <h3>Sign Up</h3>
                <div className="form-group">
                    <label>Name</label>
                    <input type="text" className="form-control" placeholder="Name" id="name" />
                </div>

                <div className="form-group">
                    <label>Email address</label>
                    <input type="email" className="form-control" placeholder="Enter email" id="email" />
                </div>

                <div className="form-group">
                    <label>Password</label>
                    <input type="password" className="form-control" placeholder="Enter password" id="login_token" />
                </div>

                <button type="submit" className="btn btn-primary btn-block" onClick={this.addUser}>Sign Up</button>
                <p className="forgot-password text-right">
                    Already registered <a href="/sign-in">sign in?</a>
                </p>
            </form>
        );
    }
}