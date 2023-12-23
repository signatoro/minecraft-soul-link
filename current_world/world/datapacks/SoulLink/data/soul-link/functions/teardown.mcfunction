gamerule commandBlockOutput true
gamerule showDeathMessages true
#gamerule doImmediateRespawn false

scoreboard objectives remove worldDeaths
scoreboard objectives remove Health
scoreboard objectives remove lowestHealth
scoreboard objectives remove deathCount
scoreboard objectives remove damageDealt
scoreboard objectives remove damageTaken
scoreboard objectives remove walk
scoreboard objectives remove sprint
scoreboard objectives remove crouch
scoreboard objectives remove fall
scoreboard objectives remove jump
scoreboard objectives remove mobKills
scoreboard objectives remove halfHealth
scoreboard objectives remove halfHeart
scoreboard objectives remove realDamageDealt
scoreboard objectives remove realDamageTaken

bossbar remove minecraft:minhp

tag @a remove halfHealth
tag @a remove hpChecked
tag @a remove alreadyDead
tag @a remove playerWhoDied