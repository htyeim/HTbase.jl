
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
isemptydir(dir::AbstractString) = isempty(readdir(dir))
function rm_lockfile(filename::String, rm_path = true)
    if isfile(filename)
        run(`rm $filename`)
        # rm(filename)
    end
    if rm_path 
        d = dirname(filename)
        if isemptydir(d)
            rm(d)
        end
    end
end

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
    if isempty(readdir(dir))
        rm(dir)
        rm_dir(dirname(dir))
    end
end

