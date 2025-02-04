workspace(name = "rules_antlr")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_jar")

http_archive(
    name = "remote_java_tools_linux",
    sha256 = "085c0ba53ba764e81d4c195524f3c596085cbf9cdc01dd8e6d2ae677e726af35",
    urls = [
        "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v10.6/java_tools_javac11_linux-v10.6.zip",
        "https://github.com/bazelbuild/java_tools/releases/download/javac11_v10.6/java_tools_javac11_linux-v10.6.zip",
    ],
)

http_archive(
    name = "remote_java_tools_windows",
    sha256 = "873f1e53d1fa9c8e46b717673816cd822bb7acc474a194a18ff849fd8fa6ff00",
    urls = [
        "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v10.6/java_tools_javac11_windows-v10.6.zip",
        "https://github.com/bazelbuild/java_tools/releases/download/javac11_v10.6/java_tools_javac11_windows-v10.6.zip",
    ],
)

http_archive(
    name = "remote_java_tools_darwin",
    sha256 = "d15b05d2061382748f779dc566537ea567a46bcba6fa34b56d7cb6e6d668adab",
    urls = [
        "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v10.6/java_tools_javac11_darwin-v10.6.zip",
        "https://github.com/bazelbuild/java_tools/releases/download/javac11_v10.6/java_tools_javac11_darwin-v10.6.zip",
    ],
)

local_repository(
    name = "examples",
    path = "./examples",
)

http_jar(
    name = "junit",
    sha256 = "59721f0805e223d84b90677887d9ff567dc534d7c502ca903c0c2b17f05c116a",
    url = "https://jcenter.bintray.com/junit/junit/4.12/junit-4.12.jar",
)

http_jar(
    name = "jimfs",
    sha256 = "c4828e28d7c0a930af9387510b3bada7daa5c04d7c25a75c7b8b081f1c257ddd",
    url = "https://jcenter.bintray.com/com/google/jimfs/jimfs/1.1/jimfs-1.1.jar",
)

http_jar(
    name = "guava",
    sha256 = "4a5aa70cc968a4d137e599ad37553e5cfeed2265e8c193476d7119036c536fe7",
    url = "https://jcenter.bintray.com/com/google/guava/guava/27.1-jre/guava-27.1-jre.jar",
)

load("//antlr:repositories.bzl", "rules_antlr_dependencies")

rules_antlr_dependencies(2, 3, 4)

git_repository(
    name = "io_bazel_stardoc",
    remote = "https://github.com/bazelbuild/stardoc.git",
    tag = "0.4.0",
)

load("@io_bazel_stardoc//:setup.bzl", "stardoc_repositories")

stardoc_repositories()

git_repository(
    name = "stardoc_templates",
    remote = "https://github.com/marcohu/stardoc_templates.git",
    tag = "0.1.0",
)
