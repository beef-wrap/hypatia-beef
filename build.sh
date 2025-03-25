cmake -S . -B hypatia/build -DCMAKE_BUILD_TYPE=Debug
cmake --build hypatia/build --config Debug

cmake -S . -B hypatia/build -DCMAKE_BUILD_TYPE=Release
cmake --build hypatia/build --config Release