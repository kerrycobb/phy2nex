let doc = """
Convert phylip file to nexus with option to include partition file.

Usage:
  phy2nex INPUT [OUTPUT] [--partition FILE]
  phy2nex (-h | --help)

Arguments:
  INPUT           Input file path
  OUTPUT          Output file path [default: INPUT.nex]

Options:
  -h, --help                 Show this screen.
  -p FILE, --partition FILE  Partition file path

"""

import strutils
import os
import docopt

let args = docopt(doc)

var out_path: string
if args["OUTPUT"]:
  out_path = $args["OUTPUT"]
else:
  out_path = changeFileExt($args["INPUT"], ".nex")
var
  in_handle = open($args["INPUT"])
  out_handle = open(out_path, fmWrite)
  line = readLine(in_handle)
  header = line.splitWhitespace()
  ntax = header[0]
  nchars = header[0]

out_handle.writeLine("#NEXUS")
if args["--partition"]:
  out_handle.writeLine("BEGIN SETS;")
  var part_handle = open($args["--partition"])
  while true:
    try:
      var line = readLine(part_handle)
      out_handle.writeLine("\t\t" & line)
    except IOError:
      break
  part_handle.close()
  out_handle.writeLine("\t;\nEND;")

out_handle.writeLine("BEGIN DATA;\n\tDIMENSIONS NTAX=$1 NCHAR=$2;\n\tFORMAT DATATYPE=DNA MISSING=? GAP=-;\n\tMATRIX" % [ntax , nchars])

while true:
  try:
    var line = readLine(in_handle)
    outhandle.writeLine("\t\t" & line)
  except IOError:
    break
in_handle.close()
out_handle.writeLine("\t;\nEND;")
out_handle.close()
