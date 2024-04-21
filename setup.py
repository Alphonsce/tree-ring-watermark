# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
import re
from distutils.core import Command

from setuptools import find_packages, setup


# IMPORTANT:
# 1. all dependencies should be listed here with their version requirements if any
# 2. once modified, run: `make deps_table_update` to update src/tree-ring-watermark/dependency_versions_table.py
_deps = [
#    "torch==1.13.0",
   "transformers==4.31.0",
   "diffusers==0.14.0",
]

# this is a lookup table with items like:
#
# tokenizers: "huggingface-hub==0.8.0"
# packaging: "packaging"
#
# some of the values are versioned whereas others aren't.
deps = {b: a for a, b in (re.findall(r"^(([^!=<>~]+)(?:[!=<>~].*)?$)", x)[0] for x in _deps)}

# since we save this data in src/tree-ring-watermark/dependency_versions_table.py it can be easily accessed from
# anywhere. If you need to quickly access the data from this table in a shell, you can do so easily with:
#
# python -c 'import sys; from tree-ring-watermark.dependency_versions_table import deps; \
# print(" ".join([ deps[x] for x in sys.argv[1:]]))' tokenizers datasets
#
# Just pass the desired package names to that script as it's shown with 2 packages above.
#
# If tree-ring-watermark is not yet installed and the work is done from the cloned repo remember to add `PYTHONPATH=src` to the script above
#
# You can then feed this for example to `pip`:
#
# pip install -U $(python -c 'import sys; from tree-ring-watermark.dependency_versions_table import deps; \
# print(" ".join([ deps[x] for x in sys.argv[1:]]))' tokenizers datasets)
#


def deps_list(*pkgs):
    return [deps[pkg] for pkg in pkgs]


class DepsTableUpdateCommand(Command):
    """
    A custom distutils command that updates the dependency table.
    usage: python setup.py deps_table_update
    """

    description = "build runtime dependency table"
    user_options = [
        # format: (long option, short option, description).
        ("dep-table-update", None, "updates src/tree_ring_watermark/dependency_versions_table.py"),
    ]

    def initialize_options(self):
        pass

    def finalize_options(self):
        pass

    def run(self):
        entries = "\n".join([f'    "{k}": "{v}",' for k, v in deps.items()])
        content = [
            "# THIS FILE HAS BEEN AUTOGENERATED. To update:",
            "# 1. modify the `_deps` dict in setup.py",
            "# 2. run `make deps_table_update``",
            "deps = {",
            entries,
            "}",
            "",
        ]
        target = "src/tree_ring_watermark/dependency_versions_table.py"
        print(f"updating {target}")
        with open(target, "w", encoding="utf-8", newline="\n") as f:
            f.write("\n".join(content))


extras = {}


install_requires = [
    # deps["torch"],
    deps["diffusers"],
    deps["transformers"],
]

setup(
    name="tree_ring_watermark",
    version="0.1.1",
    description="tree_ring_watermark",
    long_description=open("README.md", "r", encoding="utf-8").read(),
    long_description_content_type="text/markdown",
    keywords="deep learning",
    license="MIT",
    author="Yuxin Wen",
    author_email="patrick@huggingface.co",
    url="https://github.com/YuxinWenRick/tree-ring-watermark",
    package_dir={"": "src"},
    packages=find_packages("src"),
    include_package_data=True,
    
    package_data={
        # 'tree_ring_watermark': ['src/tree_ring_watermark/open_clip/bpe_simple_vocab_16e6.txt.gz', 'src/tree_ring_watermark/open_clip/model_configs/*.json']
        "": ["*.gz", "*.json"]
    },

    python_requires=">=3.7.0",
    install_requires=install_requires,
    extras_require=extras,
    classifiers=[
        "Development Status :: 5 - Production/Stable",
        "Intended Audience :: Developers",
        "Intended Audience :: Education",
        "Intended Audience :: Science/Research",
        "License :: OSI Approved :: Apache Software License",
        "Operating System :: OS Independent",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Topic :: Scientific/Engineering :: Artificial Intelligence",
    ],
    cmdclass={"deps_table_update": DepsTableUpdateCommand},
)

# Release checklist
# 1. Change the version in __init__.py and setup.py.
# 2. Commit these changes with the message: "Release: Release"
# 3. Add a tag in git to mark the release: "git tag RELEASE -m 'Adds tag RELEASE for pypi' "
#    Push the tag to git: git push --tags origin main
# 4. Run the following commands in the top-level directory:
#      python setup.py bdist_wheel
#      python setup.py sdist
# 5. (You can skip this for now) Upload the package to the pypi test server first:
#      twine upload dist/* -r pypitest
#      twine upload dist/* -r pypitest --repository-url=https://test.pypi.org/legacy/
# 6. Check that you can install it in a virtualenv by running:
#      pip install -i https://testpypi.python.org/pypi tree_ring_watermark
#      tree_ring_watermark env
#      tree_ring_watermark test
# 7. Upload the final version to actual pypi:
#      twine upload dist/* -r pypi
# 8. Add release notes to the tag in github once everything is looking hunky-dory.
# 9. Update the version in __init__.py, setup.py to the new version "-dev" and push to master

