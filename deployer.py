import subprocess

config_file = 'ecosystem.config.php'

def start_pm2_web():
    try:
        subprocess.run(['pm2', 'start', config_file], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error while starting applications: {e}")

def stop_pm2_web():
    try:
        subprocess.run(['pm2', 'stop', config_file], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error while stopping applications: {e}")

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: python deployer.py [start|stop]")
        sys.exit(1)

    command = sys.argv[1].lower()
    if command == 'start':
        print("Launching all servers..")
        start_pm2_web()
        print("All servers have been launched successfully!")
    elif command == 'stop':
        print("Stopping all servers..")
        stop_pm2_web()
        print("All servers have been stopped successfully!")
    else:
        print("Unknown command. Use 'start' or 'stop'.")
        sys.exit(1)
