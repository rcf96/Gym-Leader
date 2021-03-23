import React, { Component } from "react";

export default class Trainers extends Component {
    constructor(props) {
        super(props);
        this.state = {
            items: [],
            isLoaded: false,
        };
    }
    
    componentDidMount() {
       // e.preventDefault();
        fetch('http://192.168.50.71:8000/TrainersView?userid=eq.' + document.cookie)
        .then(response => { 
            response.json().then(data => {
                this.setState({
                    isLoaded: true,
                    items: data
                })
                console.log(data);
            });

        });
    }

    addClient() {
        fetch('http://192.168.50.71:8000/UserInfo?name=eq.' + document.getElementById("name").value).then(response => {
                response.json().then(data => {
                console.log(data)
                var userid = data[0].userid;
        fetch('http://192.168.50.71:8000/users?userid=eq.' + userid,
        {
            method: "PATCH",
            headers: {
              "Content-type": "application/json",
              "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5zIn0.IW9X3o4xo5xxOPWE-UE2ZojD4Ee8-26L2wdYvWkm6ao"
            },
            body: JSON.stringify({
              trainer: document.cookie
            })
          })
        .then(reply => {
            console.log("Added");
        });

        //Add client to database
        //UPDATE public.users SET
        //trainer = '2'::integer WHERE userid = 2;
        //var sql = "UPDATE public.users SET trainer = trainer.userid::integer WHERE userid = userid";
        //var dbConnection = SQL.Connect

    })
    })
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
                        <div key={item.name}>
                            <p> </p>
                            <h3>Client: {item.name}</h3>
                        </div>
                    ))}
                    <div>
                        <p> </p>
                        <p> </p>
                    </div>
                    <div>
                        <p>___________________________________________________</p>
                    </div>
                    <div padding-top="100px" >
                        <h3>Add New Client</h3>
                        <span>
                            <p>Client</p>
                            <input type="text" id="name" ></input>
                        </span>
                        <p></p>
                        <button type="submit" className="btn btn-primary btn-block" onClick={this.addClient}>Add Client</button>
                    </div>
             </div>
                
            );
        }
    }
}