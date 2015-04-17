# kafka cookbook

Installs Kafka `v0.7.2` and zookeeper.

Based on the Kafka cookbook originally released by ExactTarget (thanks!)

## Requirements

This cookbook depend on java being already installed on the system.

### Platform

* Amazon Linux
* Ubuntu 12.04
* Ubuntu 14.04

Might work on other platforms / versions, but these are the ones that are
included in `.kitchen.yml` and/or tested in the wild, so YMMV.

## Attributes

## Recipes

This section describes the different recipes that are available.

### install

Downloads and installs Kafka from the official binary releases.
Defaults to installing `v0.7.2` of Kafka.

## Copyright

Copyright :: 2012 Eric Hauser, ExacTarget

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add-component-x`)
3. Write your change
4. Check that your change works, for example with Vagrant
5. Submit a Pull Request using Github