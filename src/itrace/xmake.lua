
-- add target
add_target("itrace")

    -- make as a shared library
    set_kind("shared")

    -- add defines
    add_defines("__tb_prefix__=\"itrace\"")

    -- set the object files directory
    set_objectdir("$(buildir)/.objs")

    -- add includes directory
    add_includedirs("$(buildir)")
    add_includedirs("$(buildir)/itrace")

    -- add packages
    add_options("tbox", "base")

    -- add the common source files
    add_files("*.m")

