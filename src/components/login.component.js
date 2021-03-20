import { getAllByDisplayValue } from "@testing-library/react";
import axios from "axios";
import React, { Component } from "react";
import { Redirect } from "react-router";

export default class Login extends Component {

    handleClick(e, email) {
        e.preventDefault();
        console.log(document.getElementById('email').value);
        fetch('http://192.168.50.71:8000/UserInfo?email=eq.' + document.getElementById('email').value)
        .then(response => {
            response.json().then(data => {

                var pass = document.getElementById('login_token').value;
                if (data[0].login_token == pass){
                    if(data[0].role == 1){
                       document.cookie = data[0].userid;
                       window.location = "/trainers";
                    }
                    else if (data[0].role === 2){
                       console.log(data[0].userid)
                       document.cookie = data[0].userid;
                       window.location = "/workouts";
                    }
    
                }
               });
            })
    }

    render() {
        return (
            <form>
            <h3>Sign In</h3>

            <div className="form-group">
                <label>Email address</label>
                <input id="email" name="email" type="email" className="form-control" placeholder="Enter email" />
            </div>

            <div className="form-group">
                <label>Password</label>
                <input id="login_token" type="password" className="form-control" placeholder="Enter password" />
            </div>

            <div className="form-group">
                <div className="custom-control custom-checkbox">
                    <input type="checkbox" className="custom-control-input" id="customCheck1" />
                    <label className="custom-control-label" htmlFor="customCheck1">Remember me</label>
                </div>
            </div>
            
            <button type="submit" className="btn btn-primary btn-block" onClick={this.handleClick} >Submit</button>
            <p className="forgot-password text-right">
                Forgot <a href="/forgot-pass">password?</a>
            </p>
        </form>
        );
    }

}

