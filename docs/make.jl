using Documenter, HTbase

makedocs(;
    modules=[HTbase],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/htyeim/HTbase.jl/blob/{commit}{path}#L{line}",
    sitename="HTbase.jl",
    authors="htyeim <htyeim@gmail.com>",
    assets=String[],
)

deploydocs(;
    repo="github.com/htyeim/HTbase.jl",
)
