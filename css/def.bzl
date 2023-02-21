def css_library(name, srcs):
    return [DefaultInfo(files = depset(srcs))]

def css_binary(name, deps):
    native.genrule(
        name = name,
        srcs = deps,
        outs = [name + ".css"],
        cmd_bash = """
            touch out;
            for f in $(SRCS); do
                if [[ ! -d $$f ]]; then
                (cat $$f; echo) >> out;
                fi;
            done;
            cat out > $@;
        """,
    )
