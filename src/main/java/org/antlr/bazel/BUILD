load("@rules_java//java:defs.bzl", "java_binary")

package(default_visibility = ["//visibility:public"])

filegroup(
    name = "srcs",
    srcs = glob(["*"]),
)

java_import(
    name = "JavaBuilder",
    jars = [
        "@remote_java_tools_darwin//:JavaBuilder"
    ]
)

java_library(
    name = "bazel_lib",
    srcs = glob(["*.java"]),
    deps = [
        "JavaBuilder",
    ],
)

java_binary(
    name = "bazel",
    runtime_deps = [
        ":bazel_lib",
    ],
    main_class = "org.antlr.bazel.AntlrRules",
)
