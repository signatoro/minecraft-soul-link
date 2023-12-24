import os
import time
import shutil
import logging
import subprocess

from mcrcon import MCRcon


logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')


class SoulLink():
    running = True

    world_num = 1

    server_running = False

    def start_program(self):   

        self.send_command('/execute if entity @a[tag=playerWhoDied] run tag @p[tag=playerWhoDied] list')

        # self.server_running = False

        # self.start_server()

        # while self.running:

        #     if self.check_all_player_dead():
        #         self.stop_server()
        #         self.move_world()

        #         self.start_server()

        #     time.sleep(25)

        return 0



    def start_server(self):
        print("Creating the server")
        if not self.server_running:
            
            if not os.path.exists("current_world/world"):
                os.mkdir("current_world/world")

            self.server_running = True
            subprocess.run(['docker-compose', 'up', '-d'])
            
            time.sleep(50)
            print("Finished start up")

            # Check if world has been created
            print("Adding Data Pack")
            if os.path.exists("current_world/world"):
                while not os.path.exists("current_world/world/datapacks/SoulLink"):
                    if (os.path.exists("current_world/world/datapacks")):
                        shutil.copytree("SoulLink", "current_world/world/datapacks/SoulLink")
                        break
                    print ("Waiting...")
                    time.sleep(35)

            # time.sleep(35)
            print("Loading Data Pack")
            # docker exec -it minecraft-soul-link_minecraft-server_1 rcon-cli --password 1234ss 'say 1'
            subprocess.run(['docker', 'exec', '-it', 'minecraft-soul-link_minecraft-server_1', 'rcon-cli', '--password', '1234ss', '/reload'])
            

            # Check if the datapack is in the game. 
        else:
            logging.debug("Server is already running")

    def stop_server(self):
        if self.server_running:

            self.send_command("say !! The world will be reset in 45 seconds !!")

            time.sleep(35)

            self.send_command("say !! The server will reset 10 seconds !!")

            time.sleep(5)

            self.send_command("say !! The server will reset 5 seconds !!")

            time.sleep(5)
            
            self.send_command("say !! The server is being shut down!!") 
            self.send_command("It will restart in a few minutes !!")

            time.sleep(3)
            
            print("Server shutdown beginning")

            subprocess.run(['docker-compose', 'down'])
            time.sleep(6)
            self.server_running = False
            print("Server Fully Stopped")
        else:
            logging.debug("Server is already shutdown")

    def move_world(self):
        print(os.listdir())
        logging.debug(os.listdir)
        shutil.move("current_world/world", f"old_worlds/world_{self.world_num}")
        self.world_num = self.world_num + 1
        
        

    def check_all_player_dead(self) -> bool:
        print ("Checking if a player has died")

        response = self.send_command('/execute if entity @a[tag=playerWhoDied] run tag @p[tag=playerWhoDied] list')
        
        if response:
            rep_break = response.split(' ')
            print(f"{rep_break.pop(0)} has died!")
            return True
        # logs = subprocess.check_output(['docker', 'logs', 'minecraft-soul-link_minecraft-server_1']).decode('utf-8')

        # if 'All Souls Have Been Severed.' in logs:
        #     print("Player has died!")
        #     return True

        return False
    
    def send_command(self, command):
        response = ''
        try:
            # Replace 'your_rcon_password' and 'your_minecraft_server_ip' with your actual RCON password and server IP
            with MCRcon('10.0.0.117', '1234ss') as client:
                response = client.command(command)
                print(response)
        except:
            print('Command Failed')
        
        return response

#playerWhoDied 


if __name__ == "__main__":
    thing = SoulLink()
    thing.start_program()
    pass
