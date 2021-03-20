import React, { Component } from "react";

export default class ForgotPass extends Component {
    render() {
        return (
            <form>
            <h3>Forgot Password</h3>

            <div className="form-group">
                <label>Recovery Email Address</label>
                <input type="email" className="form-control" placeholder="Enter email" />
            </div>

            <button type="submit" className="btn btn-primary btn-block">Submit</button>
        </form>
        );
    }
}