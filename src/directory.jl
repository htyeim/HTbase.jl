
export add_lockfile
function add_lockfile(filename::String)
    while true
        if isfile(filename)
            print(string(" exist! wait 16 s. ", filename, ))
            sleep(16.9)
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

