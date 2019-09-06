-- PLEASE KEEP MOD SECTIONS IN ALPHABETICAL ORDER
-- ORGANIZE LOGIC BY THE TARGET ITEM

if minetest.get_modpath('bbq') then
    minetest.clear_craft({output='bbq:smoker_blueprint'})
    minetest.register_craft({
        output='bbq:smoker_blueprint',
        recipe={
            {'default:paper', 'default:paper', 'default:paper'},
            {'default:paper', 'dye:blue',      'default:paper'},
            {'default:paper', 'default:paper', 'default:paper'},
        }
    })
    minetest.clear_craft({output='bbq:woodpile'})
    minetest.register_craft({
        output='bbq:woodpile 4',
        recipe={
            {'default:tree', 'default:tree', 'default:tree'},
            {'default:tree', 'default:tree', 'default:tree'},
            {'default:tree', 'default:tree', 'default:tree'},
        }
    })
    minetest.clear_craft({output='bbq:woodpile_acacia'})
    minetest.register_craft({
        output='bbq:woodpile_acacia 4',
        recipe={
            {'default:acacia_tree', 'default:acacia_tree', 'default:acacia_tree'},
            {'default:acacia_tree', 'default:acacia_tree', 'default:acacia_tree'},
            {'default:acacia_tree', 'default:acacia_tree', 'default:acacia_tree'},
        }
    })
    minetest.clear_craft({output='bbq:woodpile_aspen'})
    minetest.register_craft({
        output='bbq:woodpile_aspen 4',
        recipe={
            {'default:aspen_tree', 'default:aspen_tree', 'default:aspen_tree'},
            {'default:aspen_tree', 'default:aspen_tree', 'default:aspen_tree'},
            {'default:aspen_tree', 'default:aspen_tree', 'default:aspen_tree'},
        }
    })
    minetest.clear_craft({output='bbq:woodpile_junglewood'})
    minetest.register_craft({
        output='bbq:woodpile_junglewood 4',
        recipe={
            {'default:jungletree', 'default:jungletree', 'default:jungletree'},
            {'default:jungletree', 'default:jungletree', 'default:jungletree'},
            {'default:jungletree', 'default:jungletree', 'default:jungletree'},
        }
    })
    minetest.clear_craft({output='bbq:woodpile_pine'})
    minetest.register_craft({
        output='bbq:woodpile_pine 4',
        recipe={
            {'default:pine_tree', 'default:pine_tree', 'default:pine_tree'},
            {'default:pine_tree', 'default:pine_tree', 'default:pine_tree'},
            {'default:pine_tree', 'default:pine_tree', 'default:pine_tree'},
        }
    })
end

if minetest.get_modpath('bones') and minetest.get_modpath('bonemeal') then
    if minetest.get_modpath('building_blocks') then
        minetest.register_craft({
            output='bones:bones',
            recipe={
                {'bonemeal:bone', 'bonemeal:bone',       'bonemeal:bone'},
                {'bonemeal:bone', 'building_blocks:Tar', 'bonemeal:bone'},
                {'bonemeal:bone', 'bonemeal:bone',       'bonemeal:bone'},
            }
        })
    end
    if minetest.get_modpath('terumet') then
        minetest.register_craft({
            output='bones:bones',
            recipe={
                {'bonemeal:bone', 'bonemeal:bone',     'bonemeal:bone'},
                {'bonemeal:bone', 'terumet:block_tar', 'bonemeal:bone'},
                {'bonemeal:bone', 'bonemeal:bone',     'bonemeal:bone'},
            }
        })
    end
end

if minetest.get_modpath('cblocks') then
    -- make colored blocks cheaper, dye-wise
    local colours = {
        black='dye:black',
        blue='dye:blue',
        brown='dye:brown',
        cyan='dye:cyan',
        dark_green='dye:dark_green',
        dark_grey='dye:dark_grey',
        green='dye:green',
        grey='dye:grey',
        magenta='dye:magenta',
        orange='dye:orange',
        pink='dye:pink',
        red='dye:red',
        violet='dye:violet',
        white='dye:white',
        yellow='dye:yellow'
    }
    for color, dye in pairs(colours) do
        minetest.clear_craft({output=("cblocks:wood_%s"):format(color)})
        minetest.register_craft({
            output = ("cblocks:wood_%s 8"):format(color),
            recipe = {
                {"group:wood", "group:wood", "group:wood"},
                {"group:wood", dye,          "group:wood"},
                {"group:wood", "group:wood", "group:wood"},
            }
        })
        minetest.clear_craft({output=("cblocks:stonebrick_%s"):format(color)})
        minetest.register_craft({
            output = ("cblocks:stonebrick_%s 8"):format(color),
            recipe = {
                {"default:stonebrick", "default:stonebrick", "default:stonebrick"},
                {"default:stonebrick", dye,                  "default:stonebrick"},
                {"default:stonebrick", "default:stonebrick", "default:stonebrick"},
            }
        })
        minetest.clear_craft({output=("cblocks:glass_%s"):format(color)})
        minetest.register_craft({
            output = ("cblocks:glass_%s 8"):format(color),
            recipe = {
                {"default:glass", "default:glass", "default:glass"},
                {"default:glass", dye,             "default:glass"},
                {"default:glass", "default:glass", "default:glass"},
            }
        })
    end
end

if minetest.get_modpath("cottages") then
    if minetest.get_modpath("xdecor") then
        -- recipe conflict with xdecor wood framed glass
        minetest.clear_craft({output="cottages:glass_pane"})
        minetest.register_craft({
            output = "cottages:glass_pane 4",
            recipe = {{'default:glass'}}
        })
    end
    if minetest.get_modpath("farming") then
        -- complicated recipe conflict w/ wheat and straw
        minetest.clear_craft({output="cottages:straw_bale"})
        minetest.register_craft({
            output = "cottages:straw_bale",
            recipe = {
                {'cottages:straw_mat'},
                {'cottages:straw_mat'},
                {'cottages:straw_mat'},
            }
        })
    end
end

if minetest.get_modpath('default') then
    -- add some recipes for kinds of dirt
    minetest.register_craft({
        output = "default:dirt_with_snow",
        type = "shapeless",
        recipe = {"default:dirt", "default:snow"}
    })
    minetest.register_craft({
        output = "default:dirt_with_rainforest_litter",
        type = "shapeless",
        recipe = {"default:dirt", "default:jungleleaves"}
    })
    minetest.register_craft({
        output = "default:dirt_with_dry_grass",
        type = "shapeless",
        recipe = {"default:dirt", "default:dry_grass_1"}
    })
    minetest.register_craft({
        output = "default:dirt_with_coniferous_litter",
        type = "shapeless",
        recipe = {"default:dirt", "default:pine_needles"}
    })
    minetest.register_craft({
        output = "default:permafrost",
        type = "shapeless",
        recipe = {"default:dirt", "default:ice"}
    })
    minetest.register_craft({
        output = "default:permafrost_with_moss",
        type = "shapeless",
        recipe = {"default:permafrost", "default:junglegrass"}
    })
    minetest.register_craft({
        output = "default:permafrost_with_stones",
        type = "shapeless",
        recipe = {"default:permafrost", "default:gravel"}
    })
    -- smelt tree into coal (but don't make this a net-gain in heat)
    minetest.register_craft({
        type='cooking',
        output='default:coal_lump',
        recipe='default:tree',
        cooktime=80,
    })
end

-- TODO digilines:lightsensor

if minetest.get_modpath("extra") then
    -- EDGY1'S ADDITION
    minetest.register_craft({
        output = "extra:french_fries ",
        recipe = {
             {'extra:cottonseed_oil', 'extra:potato_slice', 'extra:potato_slice'},
             {'extra:potato_slice',   'extra:potato_slice', 'extra:potato_slice'},
             {'extra:potato_slice',   'extra:potato_slice', 'extra:potato_slice'},
          },
       })
    minetest.register_craft({
        output = "extra:onion_rings ",
        recipe = {
             {'extra:cottonseed_oil', 'extra:onion_slice', 'extra:onion_slice'},
             {'extra:onion_slice',    'extra:onion_slice', 'extra:onion_slice'},
             {'extra:onion_slice',    'extra:onion_slice', 'extra:onion_slice'},
          },
       })
    minetest.register_craft({
       type = "cooking",
       output = "extra:potato_crisps",
       recipe = "extra:potato_slice"
    })

    if minetest.global_exists("terumet") then
        if minetest.get_modpath('farming') then
            -- add a recipe for the blooming onion that doesn't require techpack
            terumet.register_alloy_recipe({
                result="extra:blooming_onion",
                input={"farming:onion", "extra:cottonseed_oil"},
                flux=0,
                time=10,
            })
        end

        if minetest.get_modpath('mobs_fish') then
            terumet.register_alloy_recipe({
                result="extra:fish_sticks",
                input={"mobs_fish:clownfish", "extra:cottonseed_oil"},
                flux=0,
                time=10,
            })
            terumet.register_alloy_recipe({
                result="extra:fish_sticks",
                input={"mobs_fish:tropical", "extra:cottonseed_oil"},
                flux=0,
                time=10,
            })
        end
    end

    if minetest.get_modpath('farming') then
        -- slices should require the cutting board
        minetest.clear_craft({output="extra:onion_slice"})
        minetest.register_craft({
            output = "extra:onion_slice 8",
            type = "shapeless",
            recipe = {'farming:onion', 'farming:cutting_board'},
            replacements = {{"farming:cutting_board", "farming:cutting_board"}},
        })
        minetest.clear_craft({output="extra:potato_slice"})
        minetest.register_craft({
            output = "extra:potato_slice 8",
            type = "shapeless",
            recipe = {'farming:potato', 'farming:cutting_board'},
            replacements = {{"farming:cutting_board", "farming:cutting_board"}},
        })
        minetest.clear_craft({output="extra:tomato_slice"})
        minetest.register_craft({
            output = "extra:tomato_slice 8",
            type = "shapeless",
            recipe = {'farming:tomato', 'farming:cutting_board'},
            replacements = {{"farming:cutting_board", "farming:cutting_board"}},
        })
    end
end

if minetest.get_modpath("gravelsieve") then
    -- make gravelsieve expensive
    minetest.clear_craft({output="gravelsieve:sieve"})
    minetest.register_craft({
        output = "gravelsieve:sieve",
        recipe = {
            {"group:wood", "",                      "group:wood"},
            {"group:wood", "default:diamondblock",  "group:wood"},
            {"group:wood", "",                      "group:wood"},
        },
    })
    -- make autosieve even more expensive
    minetest.clear_craft({output="gravelsieve:auto_sieve"})
    minetest.register_craft({
        output = "gravelsieve:auto_sieve",
        recipe = {
            {"default:diamondblock", "default:diamondblock", "default:diamondblock"},
            {"default:mese",         "gravelsieve:sieve",    "default:mese"},
            {"default:diamondblock", "default:mese",         "default:diamondblock"},
        },
    })

    -- make comopressed gravel behave like other compressed nodes
    minetest.clear_craft({output="gravelsieve:compressed_gravel"})
    minetest.clear_craft({recipe="gravelsieve:compressed_gravel", type="cooking"})
    minetest.register_craft({
        output = "gravelsieve:compressed_gravel",
        recipe = {
            {"default:gravel", "default:gravel", "default:gravel"},
            {"default:gravel", "default:gravel", "default:gravel"},
            {"default:gravel", "default:gravel", "default:gravel"},
        },
    })
    minetest.register_craft({
        output = "default:gravel 9",
        recipe = {
            {"gravelsieve:compressed_gravel"},
        },
    })
end

if minetest.get_modpath('hangglider') and minetest.get_modpath('terumet') and minetest.get_modpath('mobs') and minetest.get_modpath('farming') and minetest.get_modpath('moreblocks') then
    minetest.clear_craft({output='hangglider:hangglider'})
    minetest.register_craft({
        output='hangglider:hangglider',
        recipe={
            {'farming:slab_hemp_block_1', 'farming:slab_hemp_block_1', 'farming:slab_hemp_block_1'},
            {'terumet:item_rebar',        '',                          'terumet:item_rebar'},
            {'',                          'mobs:saddle',               ''}
        }
    })
end

if minetest.get_modpath('hot_air_balloons') and minetest.get_modpath('farming') and minetest.get_modpath('terumet') and minetest.get_modpath('xdecor') and minetest.get_modpath('moreblocks') then
    minetest.clear_craft({output='hot_air_balloons:item'})
    minetest.register_craft({
        output='hot_air_balloons:item',
        recipe={
            {'farming:hemp_block', 'farming:hemp_block',       'farming:hemp_block'},
            {'farming:hemp_block', 'terumet:mach_htr_furnace', 'farming:hemp_block'},
            {'moreblocks:rope',    'xdecor:barrel',            'moreblocks:rope'}
        }
    })
end

if minetest.get_modpath("itemframes") and minetest.get_modpath("wool") and minetest.get_modpath('xdecor') then
    -- avoid conflict with xdecor item frame
    minetest.clear_craft({output="itemframes:frame"})
    minetest.register_craft({
        output = "itemframes:frame",
        recipe = {
            {"default:stick", "default:stick", "default:stick"},
            {"default:stick", "group:wool",    "default:stick"},
            {"default:stick", "default:stick", "default:stick"},
        },
    })
end

if minetest.get_modpath("moreblocks") and minetest.get_modpath('xdecor') then
--    -- avoid conflict with xdecor empty_shelf (craft into each other)
--    minetest.clear_craft({output="moreblocks:empty_shelf"})
--    minetest.register_craft({
--        output = "moreblocks:empty_shelf",
--        type = "shapeless",
--        recipe = {"xdecor:empty_shelf"}
--    })
--    minetest.register_craft({
--        output = "xdecor:empty_shelf",
--        type = "shapeless",
--        recipe = {"moreblocks:empty_shelf"}
--    })
    -- avoid conflict with xdecor cactus brick
    minetest.clear_craft({recipe={"default:cactus", "default:brick"}, type="shapeless"})
    minetest.register_craft({
            output = "moreblocks:cactus_brick",
            recipe = {{"default:cactus", "default:brick"}}
    })

    -- moreblocks:grey_bricks and xdecor:moonbrick
    minetest.clear_craft({recipe={"default:stone", "default:brick"}, type="shapeless"})
    minetest.register_craft({
            output = "moreblocks:grey_bricks 2",
            recipe = {{"default:stone", "default:brick"}}
    })
end

if minetest.get_modpath('ropes') and minetest.get_modpath('default') and minetest.get_modpath('basic_materials') then
    -- avoid conflict w/ steel leggings from 3d armor
    minetest.clear_craft({output='ropes:ladder_steel'})
    minetest.register_craft({
        output='ropes:ladder_steel',
        recipe={
            {'basic_materials:steel_bar', '',                     'basic_materials:steel_bar'},
            {'',                          'default:ladder_steel', '' },
            {'basic_materials:steel_bar', '',                     'basic_materials:steel_bar'},
        }
    })
    -- just being consistent w/ the above recipe
    minetest.clear_craft({output='ropes:ladder_wood'})
    minetest.register_craft({
        output='ropes:ladder_wood',
        recipe={
            {'default:stick', '',                    'default:stick'},
            {'',              'default:ladder_wood', '' },
            {'default:stick', '',                    'default:stick'},
        }
    })
end

if minetest.get_modpath('soundblocks') then
    minetest.clear_craft({output='soundblocks:ironbellitem'})
    minetest.register_craft({
        output='soundblocks:ironbellitem',
        recipe={{'default:stick', 'default:steel_ingot'}}
    })
end

if minetest.get_modpath("terumet") then
    if minetest.get_modpath("tubelib_addons1") then
        -- make tubelib upgrade recipe a little more sensical
        minetest.clear_craft({output="terumet:item_upg_tubelib"})
        minetest.register_craft({
            output = "terumet:item_upg_tubelib",
            recipe = {
                {"",              "group:glue",            ""},
                {"tubelib:tubeS", "terumet:item_upg_base", "tubelib:tubeS"},
                {"",              "terumet:item_thermese", ""},
            }
        })
    end
    if minetest.get_modpath('extra') and minetest.get_modpath('bucket') and minetest.get_modpath('farming') then
        -- fix conflict between pasta and item glue
        minetest.clear_craft({recipe={'farming:flour', 'bucket:bucket_water'}, type='shapeless'})
        local def = minetest.registered_items['farming:rice_flour']
        if def then
            local groups = table.copy(def.groups or {})
            groups.food_flour = 1
            minetest.override_item('farming:rice_flour', {groups=groups})
        end

        minetest.register_craft({
            output='extra:pasta 5',
            recipe={{'group:food_flour', 'bucket:bucket_water'}},
            replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}},
        })
        minetest.register_craft({
            output='terumet:item_glue 8',
            recipe={{'bucket:bucket_water', 'group:food_flour'}},
            replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}},
        })
    end
end

if minetest.get_modpath('tnt') and minetest.get_modpath('bonemeal') then
    -- make tnt stuff more expensive
    minetest.clear_craft({output="tnt:gunpowder"})
    minetest.register_craft({
        output = "tnt:gunpowder",
        type = "shapeless",
        recipe = {"default:gravel", "default:coal_lump", "bonemeal:fertiliser"}
    })
end

if minetest.get_modpath("travelnet") and minetest.get_modpath("titanium") then
    -- make elevator expensive
    minetest.clear_craft({output="travelnet:elevator"})
    minetest.register_craft({
        output = "travelnet:elevator",
        recipe = {
            {"default:glass", "default:steelblock", "default:glass", },
            {"default:glass", "titanium:block",     "default:glass", },
            {"default:glass", "default:steelblock", "default:glass", }
        },
    })

    -- make travelnet even more expensive
    minetest.clear_craft({output="travelnet:travelnet"})
    if minetest.get_modpath('caverealms') then
        minetest.register_craft({
            output = "travelnet:travelnet",
            recipe = {
                {"caverealms:glow_mese", "titanium:block", "caverealms:glow_mese", },
                {"caverealms:glow_mese", "default:mese",   "caverealms:glow_mese", },
                {"caverealms:glow_mese", "titanium:block", "caverealms:glow_mese", }
            },
        })
    else
        minetest.register_craft({
            output = "travelnet:travelnet",
            recipe = {
                {"default:glass", "titanium:block", "default:glass", },
                {"default:mese",  "default:mese",   "default:mese", },
                {"default:glass", "titanium:block", "default:glass", }
            },
        })
    end
end

if minetest.get_modpath("tubelib") then
    -- allow any wool (instead of only dark green) in pusher recipe
    minetest.clear_craft({output="tubelib:pusher"})
    minetest.register_craft({
        output = "tubelib:pusher 2",
        recipe = {
            {"group:wood",    "group:wool",           "group:wood"},
            {"tubelib:tubeS", "default:mese_crystal", "tubelib:tubeS"},
            {"group:wood",    "group:wool",           "group:wood"},
        },
    })

    -- make the forceload block super expensive
    if minetest.get_modpath("titanium") and minetest.get_modpath("basic_materials") then
        minetest.clear_craft({output="tubelib:forceload"})
        minetest.register_craft({
            output = "tubelib:forceload",
            recipe = {
                {"group:wood",                            "",                       "group:wood"},
                {"basic_materials:energy_crystal_simple", "titanium:titanium_tv_1", "basic_materials:energy_crystal_simple"},
                {"group:wood",                            "tubelib:wlanchip",       "group:wood"},
            },
        })
    end
end

if minetest.get_modpath('wool') then
    -- make colored wool cheaper (dye-wise)
    local colours = {
        black='dye:black',
        blue='dye:blue',
        brown='dye:brown',
        cyan='dye:cyan',
        dark_green='dye:dark_green',
        dark_grey='dye:dark_grey',
        green='dye:green',
        grey='dye:grey',
        magenta='dye:magenta',
        orange='dye:orange',
        pink='dye:pink',
        red='dye:red',
        violet='dye:violet',
        white='dye:white',
        yellow='dye:yellow'
    }
    for color, dye in pairs(colours) do
        minetest.clear_craft({output=("wool:%s"):format(color)})
        minetest.register_craft({
            output = ("wool:%s 8"):format(color),
            recipe = {
                {"group:wool", "group:wool", "group:wool"},
                {"group:wool", dye,          "group:wool"},
                {"group:wool", "group:wool", "group:wool"},
            }
        })
    end

    if minetest.get_modpath('farming') then
        minetest.register_craft({
            output = "wool:white",
            recipe = {
                {"farming:cotton", "farming:cotton"},
                {"farming:cotton", "farming:cotton"},
            }
        })
    end
end

if minetest.get_modpath("xdecor") then
    -- avoid conflict with mesecon pressure plate
    minetest.clear_craft({output="xdecor:pressure_stone_off"})
    minetest.register_craft({
        output = "xdecor:pressure_stone_off",
        recipe = {
            {"group:stone", "", "group:stone"},
            {"",            "", ""},
            {"",            "", ""},
        },
    })
    -- avoid conflict with mesecon pressure plate
    minetest.clear_craft({output="xdecor:pressure_wood_off"})
    minetest.register_craft({
        output = "xdecor:pressure_wood_off",
        recipe = {
            {"group:wood", "", "group:wood"},
            {"",           "", ""},
            {"",           "", ""},
        },
    })

    if minetest.get_modpath("farming") then
        -- avoid conflict with farming tatami
        minetest.clear_craft({output="xdecor:tatami"})
        minetest.register_craft({
            output = "xdecor:tatami",
            recipe = {
                {"farming:wheat", "",              "farming:wheat"},
                {"",              "farming:wheat", ""},
                {"",              "",              ""},
            },
        })
    end

    if minetest.get_modpath("wool") then
        minetest.clear_craft({output='xdecor:cushion'})
        minetest.register_craft({
            output='xdecor:cushion 2',
            recipe={{'wool:red', 'wool:red'}}
        })
    end
end