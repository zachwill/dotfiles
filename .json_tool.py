#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
    json-tool
    ~~~~~~~~~

    JSON command line utility.  Can pretty print JSON
    and doe some other things with it such as selecting
    items from sequences or objects.

    Select::

        {
            "items": [{"foo": 1}, {"foo": 2}]
        }

        items.foo

    :copyright: (c) Copyright 2011 by Armin Ronacher.
    :license: BSD, see LICENSE for more details.
"""
import sys
from optparse import OptionParser

try:
    import json
except ImportError:
    import simplejson as json


try:
    from pygments import highlight
    from pygments.formatters import Terminal256Formatter as Term256
    from pygments.lexers import JavascriptLexer
    have_pygments = True
except ImportError:
    have_pygments = False


def print_formatted_json(stream, json_data, indentation):
    formatted = json.dumps(json_data, indent=indentation)
    if have_pygments and getattr(stream, 'isatty', lambda: False)():
        formatted = highlight(formatted,
                              formatter=Term256(),
                              lexer=JavascriptLexer()).rstrip()
    print >> stream, formatted


def main():
    parser = OptionParser()
    parser.add_option('-i', '--indentation', dest='indent', type=int,
                      default=2,
                      help='Number of spaces to use for indentation')
    options, args = parser.parse_args()
    if len(args) > 1:
        parser.error('Too many arguments')
    elif not args:
        stream = sys.stdin
    else:
        stream = open(args[0])
    try:
        json_data = json.load(stream)
    except Exception, e:
        parser.error('Could not read json:\n  %s' % e)
    print_formatted_json(sys.stdout, json_data, options.indent)


if __name__ == '__main__':
    main()
