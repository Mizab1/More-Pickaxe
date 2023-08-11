#built using mc-build (https://github.com/IanSSenne/mcbuild), Datapack by Mizab

tp @e[type=slime] ~ ~-600 ~
execute as @a if entity @s[nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{CustomModelData:110001}}}] run function mp:__generated__/execute/0
execute as @a unless entity @s[nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{CustomModelData:110001}}}] run gamerule fallDamage true
execute as @a[predicate=mp:sneak,nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{CustomModelData:110003}}}] at @s run function mp:power/ironnman
execute as @a[predicate=!mp:sneak,nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{CustomModelData:110003}}}] at @s run effect clear @s levitation
execute as @a[predicate=mp:sneak,nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{CustomModelData:110004}}}] at @s run effect give @e[distance=1..5] slowness 2 3 true
execute as @a[predicate=mp:sprint,nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{CustomModelData:110005}}}] at @s run function mp:power/flash
execute as @a[predicate=mp:sneak,nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{CustomModelData:110006}}}] at @s run effect give @e[distance=1..40] glowing 2 1 true
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{CustomModelData:110007}}}] at @s run effect give @s regeneration 1 5 true
execute as @e[type=item,nbt={Item:{id:"minecraft:terracotta",tag:{blow:1b}}}] at @s run function mp:effect/explosion
execute as @e[type=item,nbt={Item:{id:"minecraft:terracotta",tag:{lightning:1b}}}] at @s run function mp:effect/lightning
execute as @e[type=item,nbt={Item:{id:"minecraft:terracotta",tag:{arrow:1b}}}] at @s run function mp:effect/arrow
execute as @e[nbt={HurtTime:10s}] at @s if entity @p[distance=..5,nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",tag:{CustomModelData:110002}}}] run function mp:effect/lightning_entity
execute as @e[nbt={HurtTime:10s}] at @s if entity @p[distance=..5,nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",tag:{CustomModelData:110004}}}] run function mp:effect/strange_launch