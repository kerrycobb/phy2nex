# phy2nex
Convert phylip file to nexus with option to include partition file

#### Installation
Nim must be installed in order to compile. For instructions on installing Nim, see the documentation [here](https://nim-lang.org/install.html)

Download script `wget https://raw.githubusercontent.com/kerrycobb/phy2nex/master/phy2nex.nim`

Compile script with `nim --run c -o:phy2nex phy2nex.nim`

Place compiled binary in your path with `mv phy2nex /usr/local/bin`


#### Usage
```
Usage:
  phy2nex INPUT [OUTPUT] [--partition FILE]
  phy2nex (-h | --help)

Arguments:
  INPUT           Input file path
  OUTPUT          Output file path [default: INPUT.nex]

Options:
  -h, --help                 Show this screen.
  -p FILE, --partition FILE  Partition file path

```
