
export add_lockfile
function add_lockfile(filename::String, sleep_time::Float64 = 16.0)
    count = 0
    # sleep_time = 16.9
    while true
        if isfile(filename)
            print(string("\r $count exist! wait $sleep_time s. ", filename, ))
            sleep(sleep_time)
            count += 1
        else
            run(`touch $filename`)
            # touch(filename)
            break
        end
    end
end

export rm_lockfile
function rm_lockfile(filename::String)
    if isfile(filename)
        run(`rm $filename`)
        # rm(filename)
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
    dir = dirname(dir)
    while true
        if isempty(readdir(dir))
            rm(dir)
        else
            break
        end
        dir = dirname(dir)
    end
end

