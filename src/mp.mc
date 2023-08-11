#--------------------- Functions ---------------------#
function load{
    scoreboard objectives add LANG_MC_INTERNAL dummy
    tellraw @a [{"text": "Console => ","color":"green"},{"text": "loaded","color":"white"}]
}

function tick{
    # Kill the slime
    tp @e[type=slime] ~ ~-600 ~ 

    # Hulk
    #execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{CustomModelData:110001}}}] run effect give @s jump_boost 1 4 true
    execute as @a if entity @s[nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{CustomModelData:110001}}}] run{
        effect give @s jump_boost 1 5 true
        gamerule fallDamage false
    }
    execute as @a unless entity @s[nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{CustomModelData:110001}}}] run gamerule fallDamage true

    # Iron Man
   execute as @a[predicate=mp:sneak,nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{CustomModelData:110003}}}] at @s run function mp:power/ironnman
   execute as @a[predicate=!mp:sneak,nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{CustomModelData:110003}}}] at @s run effect clear @s levitation
   # Dr Strange
   execute as @a[predicate=mp:sneak,nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{CustomModelData:110004}}}] at @s run effect give @e[distance=1..5] slowness 2 3 true 

   # Flash
   execute as @a[predicate=mp:sprint,nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{CustomModelData:110005}}}] at @s run function mp:power/flash

   # Hawkeye
   execute as @a[predicate=mp:sneak,nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{CustomModelData:110006}}}] at @s run effect give @e[distance=1..40] glowing 2 1 true

   # Deadpool
   execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{CustomModelData:110007}}}] at @s run effect give @s regeneration 1 5 true

    # Effects
   execute as @e[type=item,nbt={Item:{id:"minecraft:terracotta",tag:{blow:1b}}}] at @s run function mp:effect/explosion
   execute as @e[type=item,nbt={Item:{id:"minecraft:terracotta",tag:{lightning:1b}}}] at @s run function mp:effect/lightning
   execute as @e[type=item,nbt={Item:{id:"minecraft:terracotta",tag:{arrow:1b}}}] at @s run function mp:effect/arrow

   # Pickaxe Extra Perks
   execute as @e[nbt={HurtTime:10s}] at @s if entity @p[distance=..5,nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",tag:{CustomModelData:110002}}}] run function mp:effect/lightning_entity
   execute as @e[nbt={HurtTime:10s}] at @s if entity @p[distance=..5,nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",tag:{CustomModelData:110004}}}] run function mp:effect/strange_launch

}

#--------------------- Directories ---------------------#
dir pickaxe{

    function hulk{
        give @s netherite_pickaxe{display:{Name:'{"text":"Hulk Pickaxe","italic":false}'},HideFlags:63,CustomModelData:110001,hulk:1b,Enchantments:[{id:"minecraft:knockback",lvl:8s},{id:"minecraft:efficiency",lvl:5s}],AttributeModifiers:[{AttributeName:"generic.max_health",Name:"generic.max_health",Amount:20,Operation:0,UUID:[I;921561140,-426622403,-1157260875,-2059602541],Slot:"mainhand"}]} 1
    }
    function thor{
        give @s netherite_pickaxe{display:{Name:'{"text":"Thor Pickaxe","italic":false}'},HideFlags:63,CustomModelData:110002,thor:1b,Enchantments:[{id:"minecraft:efficiency",lvl:5s}]} 1
    }
    function ironman{
        give @s netherite_pickaxe{display:{Name:'{"text":"Ironman Pickaxe","italic":false}'},HideFlags:63,CustomModelData:110003,ironman:1b,Enchantments:[{id:"minecraft:efficiency",lvl:6s},{id:"minecraft:unbreaking",lvl:3s}]} 1
    }
    function strange{
        give @s netherite_pickaxe{display:{Name:'{"text":"Dr Strange Pickaxe","italic":false}'},HideFlags:63,strange:1b,CustomModelData:110004,Enchantments:[{id:"minecraft:efficiency",lvl:6s}]} 1
    }
    function flash{
        give @s netherite_pickaxe{display:{Name:'{"text":"Flash Pickaxe","italic":false}'},HideFlags:63,CustomModelData:110005,flash:1b,Enchantments:[{id:"minecraft:efficiency",lvl:32000s}]} 1
    }
    function hawkeye{
        give @s netherite_pickaxe{display:{Name:'{"text":"Hawkeye Pickaxe","italic":false}'},HideFlags:63,CustomModelData:110006,hawkeye:1b,Enchantments:[{id:"minecraft:efficiency",lvl:5s}]} 1
    }
    function deadpool{
        give @s netherite_pickaxe{display:{Name:'{"text":"Dealpool Pickaxe","italic":false}'},HideFlags:63,CustomModelData:110007,deadpool:1b,Enchantments:[{id:"minecraft:sharpness",lvl:15s},{id:"minecraft:smite",lvl:15s},{id:"minecraft:bane_of_arthropods",lvl:15s},{id:"minecraft:looting",lvl:5s},{id:"minecraft:efficiency",lvl:6s}]} 1
    }

}

dir power{
    function ironnman{
        effect give @s levitation 1 10 true
        #tp ~ ~3 ~ 
        effect give @s resistance 5 225 true
        particle dust 1.000 0.906 0.902 2 ~ ~ ~ 0 0 0 1 100 normal @a
        playsound entity.generic.extinguish_fire master @a ~ ~ ~ 0.2 2
    }
    function flash{
        effect give @s speed 1 6 true
        particle flame ~ ~0.2 ~ 0 0 0 0.2 20 normal @a
    }
}

dir effect{
    function explosion{
        effect give @p[distance=..5] resistance 1 225 true
        summon tnt ~ ~ ~ {Fuse:0}
        kill @s
    }
    function lightning{
        effect give @p[distance=..5] resistance 12 225 true
        execute as @e[distance=..6,type=!player] at @s run summon lightning_bolt ~ ~ ~
        kill @s
    }
    function arrow{
        effect give @p[distance=..5] resistance 1 225 true
        kill @s
        summon arrow ~0.1 ~1.5 ~ {pickup:1b}
        summon arrow ~-0.1 ~1.5 ~ {pickup:1b}
        summon arrow ~ ~1.5 ~0.1 {pickup:1b}
        summon arrow ~ ~1.5 ~-0.1 {pickup:1b}
        summon arrow ~ ~1.5 ~ {pickup:1b}
        summon tnt ~ ~1.5 ~ {Fuse:0}
        summon firework_rocket ~ ~1.5 ~ {LifeTime:0,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:4,Colors:[I;16711680,543487,16766996]}]}}}}
    }
    function lightning_entity{
        summon lightning_bolt ~ ~ ~ 
        effect give @p[distance=..5] resistance 3 225 true
    }
    function strange_launch{
        data merge entity @s {Motion:[0.0,2.0,0.0]}
        particle totem_of_undying ~ ~ ~ 0 0 0 0.5 100 normal @a
        playsound minecraft:entity.firework_rocket.launch master @a ~ ~ ~ 1 0.7
    }
}

dir crafted{
    function hulk{
        recipe take @s mp:hulk
        advancement revoke @s only mp:hulk_adv
        function mp:pickaxe/hulk
        clear @s minecraft:knowledge_book
    }
    function thor{
        recipe take @s mp:thor
        advancement revoke @s only mp:thor_adv
        function mp:pickaxe/thor
        clear @s minecraft:knowledge_book
    }
    function ironman{
        recipe take @s mp:ironman
        advancement revoke @s only mp:ironman_adv
        function mp:pickaxe/ironman
        clear @s minecraft:knowledge_book
    }
    function strange{
        recipe take @s mp:strange
        advancement revoke @s only mp:strange_adv
        function mp:pickaxe/strange
        clear @s minecraft:knowledge_book
    }
    function flash{
        recipe take @s mp:flash
        advancement revoke @s only mp:flash_adv
        function mp:pickaxe/flash
        clear @s minecraft:knowledge_book
    }
    function hawkeye{
        recipe take @s mp:hawkeye
        advancement revoke @s only mp:hawkeye_adv
        function mp:pickaxe/hawkeye
        clear @s minecraft:knowledge_book
    }
    function deadpool{
        recipe take @s mp:deadpool
        advancement revoke @s only mp:deadpool_adv
        function mp:pickaxe/deadpool
        clear @s minecraft:knowledge_book
    }
}
