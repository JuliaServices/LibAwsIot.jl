using LibAwsIot
using Documenter

DocMeta.setdocmeta!(LibAwsIot, :DocTestSetup, :(using LibAwsIot); recursive=true)

makedocs(;
    modules=[LibAwsIot],
    repo="https://github.com/JuliaServices/LibAwsIot.jl/blob/{commit}{path}#{line}",
    sitename="LibAwsIot.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://github.com/JuliaServices/LibAwsIot.jl",
        assets=String[],
        size_threshold=2_000_000, # 2 MB, we generate about 1 MB page
        size_threshold_warn=2_000_000,
    ),
    pages=["Home" => "index.md"],
)

deploydocs(; repo="github.com/JuliaServices/LibAwsIot.jl", devbranch="main")
