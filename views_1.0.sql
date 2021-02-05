SELECT users_clients.clients,
    users.userid
   FROM (users_clients
     FULL JOIN users ON ((users.userid = users_clients.userid)))
  WHERE (users.role = 1);

SELECT assignedworkout.datedue,
    workouts.name,
    workouts.length_of_time
   FROM (workouts
     FULL JOIN assignedworkout ON ((workouts.workout_id = assignedworkout.workout_id)));

SELECT third_party_login.name,
    users.userid
   FROM (third_party_login
     FULL JOIN users ON ((users.login_token = third_party_login.login_token)));

SELECT assignedworkout.datedue,
    assignedworkout.assignedid,
    assignedworkout.userid,
    assignedworkout.workout_id
   FROM (assignedworkout
     LEFT JOIN users ON ((users.userid = assignedworkout.userid)));