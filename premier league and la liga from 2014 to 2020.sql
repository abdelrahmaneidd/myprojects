SELECT distinct
teams.name as Club,
ply.name as Player_Name,
count(app.gameID) over (partition by games.season ) as Apps,
sum(app.assists) over (partition by games.season ) as Assists,
sum(app.goals) over (partition by games.season ) as Goals,
games.season
FROM appearances app
join players ply
ON app.playerID= ply.playerID
join games
on app.gameID = games.gameID
join teamstats
on app.gameID = teamstats.gameID
join teams
on teamstats.teamID = teams.teamID
where 
  app.playerID= 2097  and teams.name = 'Barcelona'  and games.season=2017
  
GROUP BY
app.gameID,
app.playerID,
teamstats.teamID,
teams.name,
ply.name,
app.goals,
app.assists,
games.season
order by season

SELECT distinct
teams.name as Club,
ply.name as Player_Name,
count(app.gameID) over (partition by games.season ) as Apps,
sum(app.assists) over (partition by games.season ) as Assists,
sum(app.goals) over (partition by games.season ) as Goals,
games.season
FROM appearances app
join players ply
ON app.playerID= ply.playerID
join games
on app.gameID = games.gameID
join teamstats
on app.gameID = teamstats.gameID
join teams
on teamstats.teamID = teams.teamID
where 
  app.playerID= 647 and teams.name = 'Tottenham'  and games.season=2017
GROUP BY
app.gameID,
app.playerID,
teamstats.teamID,
teams.name,
ply.name,
app.goals,
app.assists,
games.season
order by season


SELECT distinct
teams.name as Club,
ply.name as Player_Name,
count(app.gameID) over (partition by games.season ) as Apps,
sum(app.assists) over (partition by games.season ) as Assists,
sum(app.goals) over (partition by games.season ) as Goals,
games.season
FROM appearances app
join players ply
ON app.playerID= ply.playerID
join games
on app.gameID = games.gameID
join teamstats
on app.gameID = teamstats.gameID
join teams
on teamstats.teamID = teams.teamID
where 
  app.playerID= 1250 and teams.name = 'liverpool'  and games.season=2017
GROUP BY
app.gameID,
app.playerID,
teamstats.teamID,
teams.name,
ply.name,
app.goals,
app.assists,
games.season
order by season


SELECT distinct
teams.name as Club,
ply.name as Player_Name,
count(app.gameID) over (partition by games.season ) as Apps,
sum(app.assists) over (partition by games.season ) as Assists,
sum(app.goals) over (partition by games.season ) as Goals,
games.season
FROM appearances app
join players ply
ON app.playerID= ply.playerID
join games
on app.gameID = games.gameID
join teamstats
on app.gameID = teamstats.gameID
join teams
on teamstats.teamID = teams.teamID
where 
  app.playerID= 2371 and teams.name = 'real madrid'  and games.season=2017
GROUP BY
app.gameID,
app.playerID,
teamstats.teamID,
teams.name,
ply.name,
app.goals,
app.assists,
games.season
order by season