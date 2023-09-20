xhost +

docker run -it --rm \
    --env="DISPLAY=${DISPLAY}" \
    -p 8889:8889 \
    --gpus all \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="${PWD}/src/:/src/" \
    --volume="${PWD}/images/:/images/" \
    --volume="${PWD}/weights/:/weights/" \
    --name="diffusions" \
    diffusions \
    bash
echo "done"
