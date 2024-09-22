import json
import os
import subprocess
import sys

def generate_config():
    result = subprocess.run(['php', 'ecosystem.config.php'], capture_output=True, text=True)
    if result.returncode != 0:
        print("Error generating ecosystem.config.json:")
        print(result.stderr)
        return False
    return True

def load_config():
    with open('ecosystem.config.json') as f:
        return json.load(f)

def start_servers(apps):
    for app in apps:
        name = app['name']
        script = app['script']
        path = app['path']
        print(f"Starting {name}...")
        subprocess.run(['pm2', 'start', script, '--name', name], cwd=path)

def stop_servers(apps):
    for app in apps:
        name = app['name']
        print(f"Stopping {name}...")
        subprocess.run(['pm2', 'stop', name])

def main():
    if len(sys.argv) != 2:
        print("Usage: python3 deployer.py [start|stop]")
        return

    command = sys.argv[1]
    if command == 'start':
        if not generate_config():
            return

        config = load_config()
        apps = config.get('apps', [])
        start_servers(apps)
    elif command == 'stop':
        if not os.path.exists('ecosystem.config.json'):
            print("The ecosystem.config.json file does not exist. Please run the PHP script first.")
            return

        config = load_config()
        apps = config.get('apps', [])
        stop_servers(apps)
    else:
        print("Unrecognized command.")

if __name__ == '__main__':
    main()
