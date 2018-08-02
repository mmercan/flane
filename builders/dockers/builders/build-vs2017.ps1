$variant = '15.7'
$windowsTag = '10.0.14393.1715'

#docker build -t aspcore-full-framework:2.0.5 -f ./docker/Builder/dockerfile .
#docker build --no-cache -t mmercan/aspcore-full-framework:4.6.2 -f ./dockerfile .
#docker build -t mmercan/vs2017:15.7 -f ./vs2017/dockerfile .

docker build -t "mmercan/vs2017:$variant-$windowsTag" -f "vs2017/$variant/Dockerfile" -m 4GB "./vs2017/$variant"
docker tag "mmercan/vs2017:$variant-$windowsTag" "mmercan/vs2017:$variant"
docker push "mmercan/vs2017:$variant-$windowsTag"