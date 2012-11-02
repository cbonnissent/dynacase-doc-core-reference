import argparse
import yaml
import os
import csv


def generateCSV(arguments):
    if not arguments.tocPath or not os.path.isfile(arguments.tocPath):
        print "You need to specify a valid path"
    currentFile = open(arguments.tocPath)
    dataMap = yaml.load(currentFile)
    if arguments.csvPath != "none":
        currentWriter = csv.DictWriter(open(arguments.csvPath, 'w'), {'content': 1, 'level': 2}, extrasaction='ignore', delimiter=';', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    for currentData in dataMap['book']['chapters']:
        if arguments.csvPath != "none":
            currentWriter.writerow(currentData)
        else:
            print currentData

parser = argparse.ArgumentParser(description='Some tools for handling toc')
subparsers = parser.add_subparsers()

generateCSVParser = subparsers.add_parser('generateCSV')
generateCSVParser.add_argument('tocPath', default='./')
generateCSVParser.add_argument('csvPath', default='/tmp/toc.csv')
generateCSVParser.set_defaults(func=generateCSV)

args = parser.parse_args()
args.func(args)
