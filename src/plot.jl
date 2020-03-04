

export get_video_write
function get_video_write(datalen::Int64 = 12,
    title::String = "TEC video",
    artist::String = "Haitao Liu; htliu.me@gmail.com",
    comment::String = "TEC map")::PyObject
    manimation = pyimport("matplotlib.animation")
    # import matplotlib.animation as manimation
    # FFMpegWriter = manimation.writers.__getitem__("ffmpeg")
    metadata = Dict("title"   => title, 
                    "artist"  => artist,
                    "comment" => comment)
    manimation.FFMpegWriter(fps = max(datalen, 12) // 12, 
                 metadata = metadata)
end

