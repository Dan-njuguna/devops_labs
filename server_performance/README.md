## Server Performance

- This script demonstrates how server performance is monitored, it shows:
  - Total CPU usage
  - Total memory usage (Free vs Used including percentage)
  - Total disk usage (Free vs Used including percentage)
  - Top 5 processes by CPU usage
  - Top 5 processes by memory usage


### Overview

To get cpu usage, we check usage with the command `top` and use text manipulation tools to extract the required values: `grep` and `awk`.
Change the file permission to make it executable `chmod u+x server_stats.sh` and run with: `./server_stats.sh`

Expected output:

```bash
Total CPU usage: 37.7%
Memory used percentage: 71.8%
Free memory percentage: 6.9%

Memory Used: 7.90GiB
Free Memory: 0.76GiB
Total Memory: 11.00GiB
```

So far, I have covered; CPU Usage and Memory Usage only.


**NOTE:** All props to `roadmap.sh` for providing this wonderful roadmap and [learning labs](https://roadmap.sh/projects/server-stats) for DevOps.
