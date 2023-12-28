execute as @r[scores={deathCount=1..}] run tag @s add playerWhoDied
execute as @a[tag=playerWhoDied] run scoreboard players add @s soulDeathCount 1

title @a times 1s 10s 3s
title @a subtitle {"text":"Your soul has been severed.","color":"aqua","italic":true}
title @a title [{"selector":"@a[tag=playerWhoDied]","bold":false},{"text":" died","color":"red","bold":false}]
title @a subtitle {"text":"All souls have been severed.","color":"aqua","italic":true}
title @a title [{"text":"YOU","color":"dark_red","bold":false},{"text":" died","color":"red","bold":false}]

execute as @a run scoreboard players operation @s realDamageDealt = @s damageDealt
execute as @a run scoreboard players operation @s realDamageTaken = @s damageTaken
execute as @a run scoreboard players operation @s realDamageDealt /= ten realDamageDealt
execute as @a run scoreboard players operation @s realDamageTaken /= ten realDamageTaken

execute as @a run tellraw @a [\
    {"selector":"@s"},\
    {"text":" Statistics: ","color":"white"},\
    {"text":"\nLowest health reached: ","color":"white"},\
    {"score":{"name":"@s","objective":"lowestHealth"},"color":"red"},\
    {"text":"\nTimes dropped below half health: ","color":"white"},\
    {"score":{"name":"@s","objective":"halfHealth"},"color":"red"},\
    {"text":"\nTimes dropped to half a heart: ","color":"white"},\
    {"score":{"name":"@s","objective":"halfHeart"},"color":"red"},\
    {"text":"\nDamage Received: ","color":"white"},\
    {"score":{"name":"@s","objective":"realDamageTaken"},"color":"red"},\
    {"text":"\nDamage Dealt: ","color":"white"},\
    {"score":{"name":"@s","objective":"realDamageDealt"},"color":"red"},\
    {"text":"\nEnemies Killed: ","color":"white"},\
    {"score":{"name":"@s","objective":"mobKills"},"color":"red"}\
]
#,\
#{"text":"\nDistance Walked: ","color":"white"},\
#{"score":{"name":"@s","objective":"walk"},"color":"red"},\
#{"text":"\nDistance Crouched: ","color":"white"},\
#{"score":{"name":"@s","objective":"crouch"},"color":"red"},\
#{"text":"\nDistance Sprinted: ","color":"white"},\
#{"score":{"name":"@s","objective":"sprint"},"color":"red"},\
#{"text":"\nTimes Jumped: ","color":"white"},\
#{"score":{"name":"@s","objective":"jump"},"color":"red"},\
#{"text":"\nDistance Fallen: ","color":"white"},\
#{"score":{"name":"@s","objective":"fall"},"color":"red"}\

gamerule showDeathMessages false
execute as @a at @s unless entity @s[tag=playerWhoDied] run summon minecraft:lightning_bolt
kill @a

# If not hardcore: 
#tag @a remove alreadyDead
#tag @a remove playerWhoDied
#scoreboard players set @a deathCount 0
#gamerule showDeathMessages false

# If global hardcore: create armorstand tagged to kill @a[gamemode=survival]