## Server Performance Stats

### Requirements
- This script demonstrates how server performance is monitored, it shows:
  - Total CPU usage
  - Total memory usage (Free vs Used including percentage)
  - Total disk usage (Free vs Used including percentage)
  - Top 5 processes by CPU usage
  - Top 5 processes by memory usage

### Getting started

1. Clone the repository and move to the server performance directory:

```bash
git clone https://github.com/Dan-njuguna/devops_labs.git && cd devops_labs/server_performance
```

2. Make the Script executable

```bash
chmod u+x server_stats.sh
```

3. Execute the script.

```bash
./server_stats.sh
```

4. (Optional) Add the script to local commands path"

```bash
sudo ln -s server_stats.sh /usr/local/bin/server_stats
```

**NOTE** The above allows you to access the command to get your server stats from anywhere in your linux machine or on your server.

### Overview

**Expected `Example` output**:

```bash
Total CPU usage: 30.9%
========================================
Top 5 CPU Usage for processes
COMMAND         %CPU
qemu-system-x86 63.0
zen             10.9
Isolated Web Co  5.1
Isolated Web Co  4.5
com.docker.back  3.4

========================================
Memory used percentage: 81.8%
Free memory percentage: 4.0%

Memory Used: 9.00GiB
Free Memory: 0.44GiB
Total Memory: 11.00GiB

========================================

Top 5 processes by Memory Usage
COMMAND         %MEM
qemu-system-x86 22.0
zen              6.4
Isolated Web Co  6.1
Isolated Web Co  3.1
Isolated Web Co  2.5
========================================
Total disk space 457.00GiB
Used disk space 363.00GiB
Free disk space 71.00GiB

Used disk space percentage: 79.4%
Free disk space percentage: 15.5%
========================================
```

**NOTE:** All props to `roadmap.sh` for providing this wonderful roadmap and [learning labs](https://roadmap.sh/projects/server-stats) for DevOps.
