Edge Server
-----

- Uses ignition.yml and Github actions to build Flatcar ISO images.
- Builds Docker images of the Gleam app, which the Flatcar OS pulls at an interval.
- All OS images contain a Netmaker client to form a secure mesh network

Each ISO image is built for a specific edge location, so that it can run on any server. The Gleam app 
that runs on this image can run in a distributed fashion so that edge servers can be scaled 
horizontally - 100% plug and play. The images could run anywhere as long as monitors and apps can 
reach them. As the OS images already identify edge locations, the Docker image is identical for all,
simply taking environment variables.

Ideas
---
- Mesh VPN of all edges, allowing for interconnections
- Erlang cluster based on edge location OS cookie
- RQLite as the distributed SQLite database for each edge location
- Write immutable data to cloud Parquet files
- OS Images could have a "type" env variable: i.e. facility or HQ. The server could start 
  different children based on such variable.
