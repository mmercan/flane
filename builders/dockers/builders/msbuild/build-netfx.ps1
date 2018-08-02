$windowsTag = '10.0.14393.1715'
$variants = 'netfx-4.5.2' #, 'netfx-4.5.2-ssdt', 'netfx-4.5.2-webdeploy'

foreach ($variant in $variants) {
    docker build -t "mmercan/msbuild:$variant-$windowsTag" -f "$variant/Dockerfile" "./$variant"
    docker tag "mmercan/msbuild:$variant-$windowsTag" "mmercan/msbuild:$variant"
    docker push "mmercan/msbuild:$variant-$windowsTag"
}