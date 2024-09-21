import subprocess

def start_pm2_web():
    try:
        print("Starting PM2 applications...")
        subprocess.run(['pm2', 'start', 'ecosystem.config.js'], check=True)
        print("Applications started successfully!")
    except subprocess.CalledProcessError as e:
        print(f"Error while starting applications: {e}")

def stop_pm2_web():
    try:
        print("Stopping PM2 applications...")
        subprocess.run(['pm2', 'stop', 'ecosystem.config.js'], check=True)
        print("Applications stopped successfully!")
    except subprocess.CalledProcessError as e:
        print(f"Error while stopping applications: {e}")

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: python launch_servers.py [start|stop]")
        sys.exit(1)

    command = sys.argv[1].lower()
    if command == 'start':
        start_pm2_web()
    elif command == 'stop':
        stop_pm2_web()
    else:
        print("Unknown command. Use 'start' or 'stop'.")
        sys.exit(1)
