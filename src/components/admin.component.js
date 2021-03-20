import React, { Component } from "react";

export default class Workouts extends Component {
    constructor(props) {
        super(props);
        this.state = {
            items: [],
            isLoaded: false,
        };
    }

    componentDidMount() {
        fetch('http://192.168.50.71:8000/users?userid=eq.' + document.cookie)
        .then(response => { 
            response.json().then(data => {
                if (data[0].isadmin != 1){
                    window.location = "/sign-in"
                }
                else {
                    fetch('http://192.168.50.71:8000/UserInfo').then(result => {
                        result.json().then(data2 => {
                            this.setState({
                                isLoaded: true,
                                items: data2
                            })

                        })               

                    })

                }
            });

        });

    }
    
    render() {
        const { items } = this.state;
        if (!this.state.isLoaded) {
            return <div>Loading ... </div>;
        }
        else {
            return (
                
                //Fetch workouts by user ID?
                //UserID is passed in from login?
                //Cookie = UserID
                //Display Workouts
                <div>
          {items.map(item => (
            <div key={item.userid}>
              <h3>Name: {item.name}</h3>
              <h3> Email: {item.email}</h3>
              <h3>User Id: {item.role}</h3>
              <br></br>
            </div>
          ))}
                </div>
                
            );
        }
    }
}