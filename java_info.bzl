# Aspect that traverses dependency edges and prints out the details from the java_info provider
# For each relevant target. This includes things files, compile classpaths, etc.
# See https://docs.bazel.build/versions/master/skylark/lib/JavaInfo.html for information on the info in this provider
#
# Invoke with:
# bazel build --nobuild $target --aspects //bazel:java_info.bzl%java_info_aspect
def _java_info_aspect_impl(target, ctx):
    output = """
{target_label}: 
+ default_info:
    - files: {files}
    - default_runfiles: {default_runfiles}
    - files_to_run: {files_to_run}""".format(
        target_label = target.label,
        outputs = target[DefaultInfo],
        files = target[DefaultInfo].files.to_list(),
        default_runfiles = target[DefaultInfo].default_runfiles,
        files_to_run = target[DefaultInfo].files_to_run,
    )

    if JavaInfo in target:
        output = output + """
+ java_info:
    - java_outputs: {java_outputs}
    - runtime_output_jars: {runtime_output_jars}
    - compile_jars: {compile_jars}
    - runtime_output_jars: {runtime_output_jars}
    - transitive_compile_time_jars: {transitive_compile_time_jars}
    - transitive_runtime_jars: {transitive_runtime_jars}""".format(
            java_outputs = target[JavaInfo].outputs.jars[0].class_jar,
            compile_jars = target[JavaInfo].compile_jars,
            transitive_compile_time_jars = target[JavaInfo].transitive_compile_time_jars,
            runtime_output_jars = target[JavaInfo].runtime_output_jars,
            transitive_runtime_jars = target[JavaInfo].transitive_runtime_jars,
        )

    print(output)
    return []

java_info_aspect = aspect(
    implementation = _java_info_aspect_impl,
    attr_aspects = ["deps"],
)
