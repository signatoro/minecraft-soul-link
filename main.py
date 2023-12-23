import os
import sys
import time
import shutil
import logging
import requests
import subprocess

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')


SERVER_URL = '10.0.0.117:25565'

class SoulLink():
    running = True

    world_num = 1

    server_running = False

    def start_program(self):

        self.start_server()

        while self.running:

            time.sleep(25)

            if self.check_all_player_dead():
                self.stop_server()
                time.sleep(15)
                self.move_world()

                pass

        # Check if world exists start docker
        # If world doesn't exist start docker add datapack
        
        # Check if player is dead

        # If player is dead. stop the docker container. move the world. Add data to csv 
        # Start the docker container.
            

            

        return 0



    def start_server(self):
        if not self.server_running:
            self.server_running = True
            subprocess.run(['docker-compose', 'up', '-d'])
            time.sleep(15)

            # Check if world has been created

            if os.path.exists("current_world/world"):
                while not os.path.exists("current_world/world/datapack/SoulLink"):
                    if (os.path.exists("current_world/world/datapack")):
                        shutil.copytree("SoulLink", "current_world/world/datapack")
                    time.sleep(35)


            # Check if the datapack is in the game. 


            time.sleep(90)
        else:
            logging.debug("Server is already running")

    def stop_server(self):
        if self.server_running:
            self.server_running = False
            subprocess.run(['docker-compose', 'down'])
        else:
            logging.debug("Server is already shutdown")

    def move_world(self):
        print(os.listdir())
        logging.debug(os.listdir)
        shutil.move("current_world/world", f"old_worlds/world_{self.world_num}")
        self.world_num = self.world_num + 1
        
        

    def check_all_player_dead() -> bool:

        response = requests.get(SERVER_URL, '/player/deaths')
        data = response.json()

        for player_data in data:
            print(player_data)
            if player_data.get('death_count', 0) > 1:
                    return True

        return False



if __name__ == "__main__":
    thing = SoulLink()
    thing.start_program()
    pass