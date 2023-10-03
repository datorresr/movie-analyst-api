module.exports = {
    apps: [
      {
        name: "moviesback-app",
        script: "/home/ec2-user/movie-analyst-api/server.js",
        env: {
          NODE_ENV: "production",
          DB_HOST: process.env.DB_HOST
        },
        max_restarts: 3, 
        min_uptime: 10000

      }
    ]
  };