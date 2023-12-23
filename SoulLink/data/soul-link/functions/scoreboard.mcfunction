scoreboard objectives add generic dummy

scoreboard objectives add Health health

scoreboard objectives add lowestHealth dummy
scoreboard objectives add halfHealth dummy
scoreboard objectives add halfHeart dummy

scoreboard objectives add deathCount deathCount
scoreboard objectives add soulDeathCount dummy
scoreboard objectives add trueDeathCount deathCount

scoreboard objectives add damageDealt minecraft.custom:minecraft.damage_dealt "Damage Dealt"
scoreboard objectives add damageTaken minecraft.custom:minecraft.damage_taken "Damage Taken"
scoreboard objectives add walk minecraft.custom:minecraft.walk_one_cm "Distance Walked"
scoreboard objectives add sprint minecraft.custom:minecraft.sprint_one_cm "Distance Sprinted"
scoreboard objectives add crouch minecraft.custom:minecraft.crouch_one_cm "Distance Crouched"
scoreboard objectives add fall minecraft.custom:minecraft.fall_one_cm "Distance Fallen"
scoreboard objectives add jump minecraft.custom:minecraft.jump "Times Jumped"
scoreboard objectives add mobKills minecraft.custom:minecraft.mob_kills "Mobs Killed"

scoreboard objectives add realDamageDealt dummy
scoreboard objectives add realDamageTaken dummy
scoreboard players set ten realDamageDealt 10
scoreboard players set ten realDamageTaken 10

scoreboard objectives setdisplay sidebar Health
scoreboard objectives setdisplay below_name Health