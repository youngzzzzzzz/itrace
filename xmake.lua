
-- version
set_version("1.0.3")

-- set warning all as error
set_warnings("all", "error")

-- set language: c99, c++11
set_languages("c99", "cxx11")

-- disable some compiler errors
add_cxflags("-Wno-error=deprecated-declarations")
add_mxflags("-Wno-error=deprecated-declarations")

-- the debug mode
if modes("debug") then
    
    -- enable the debug symbols
    set_symbols("debug")

    -- disable optimization
    set_optimize("none")

    -- add defines for debug
    add_defines("__tb_debug__")

    -- attempt to enable some checkers for pc
    if archs("i386", "x86_64") then
        add_cxflags("-fsanitize=address", "-ftrapv")
        add_mxflags("-fsanitize=address", "-ftrapv")
        add_ldflags("-fsanitize=address")
    end

-- the release modes
elseif modes("release") then

    -- set the symbols visibility: hidden
    set_symbols("hidden")

    -- strip all symbols
    set_strip("all")

    -- fomit the frame pointer
    add_cxflags("-fomit-frame-pointer")
    add_mxflags("-fomit-frame-pointer")

    -- for pc
    if archs("i386", "x86_64") then
 
        -- enable fastest optimization
        set_optimize("fastest")

    -- for embed
    else
        -- enable smallest optimization
        set_optimize("smallest")
    end
end

-- for embed
if not archs("i386", "x86_64") then

    -- add defines for small
    add_defines("__tb_small__")

end

-- add option: demo
add_option("demo")
    set_option_enable(true)
    set_option_showmenu(true)
    set_option_category("option")
    set_option_description("Enable or disable the demo module")

-- add packages
add_pkgdirs("pkg") 

-- add projects
add_subdirs("src/itrace", "src/demo") 
