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
        fetch('http://192.168.50.71:8000/WorkoutName?userid=eq.' + document.cookie)
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
            <div key={item.workout_id}>
              <h3>Workout: {item.name}</h3>
              <h3> Due Date: {item.datedue}</h3>
              <h3>Length of Time: {item.length_of_time}</h3>
            </div>
          ))}
                </div>
                
            );
        }
    }
}