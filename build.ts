import { type Build } from 'xbuild';

const build: Build = {
    common: {
        project: 'hypatia',
        archs: ['x64'],
        variables: [],
        copy: {
            'hypatia/hypatia.h': 'hypatia/hypatia.c'
        },
        defines: ['HYPATIA_IMPLEMENTATION'],
        options: [],
        subdirectories: [],
        libraries: {
            hypatia: {
                sources: ['hypatia/hypatia.c']
            }
        },
        buildDir: 'build',
        buildOutDir: 'libs',
        buildFlags: []
    },
    platforms: {
        win32: {
            windows: {},
            android: {
                archs: ['x86', 'x86_64', 'armeabi-v7a', 'arm64-v8a'],
            }
        },
        linux: {
            linux: {}
        },
        darwin: {
            macos: {}
        }
    }
}

export default build;