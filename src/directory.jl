

export check_dir
function check_dir(dir::String)
    if !isdir(dir)
        mkpath(dir)
    end
end

export rm_dir
function rm_dir(dir::String)
    if !isdir(dir) return end
    dir = abspath(dir)
    a = readdir(dir)
    rm_files = [".DS_Store",]
    for irf in rm_files
        if irf in a
            rm(joinpath(dir, irf))
            filter!(x->x != irf, a)
        end
    end
    if isempty(a)
        rm(dir)
        rm_dir(dirname(dir))
    end
end



export add_lockfile
function add_lockfile(filename::String, sleep_time::Float64 = 16.0)
    count = 0
    # sleep_time = 16.9
    p = dirname(filename)
    # @show filename, p
    isdir(p) || mkpath(p)
    while true
        if isfile(filename)
            print(string("\r $count exist! wait $sleep_time s. ", filename, ))
            sleep(sleep_time)
            count += 1
        else
            # run(`touch $filename`)
            touch(filename)
            break
        end
    end
end

export rm_lockfile
function rm_lockfile(filename::String, rm_path = true)
    if isfile(filename)
        # run(`rm $filename`)
        try
            rm(filename)
        catch
            @warn "deleted? $filename"
        end
    end
    if rm_path 
        rm_dir(dirname(filename))
    end
end
