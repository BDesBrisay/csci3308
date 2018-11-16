#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Andy Sayler
# Summer 2014
# CSCI 3308
# Univerity of Colorado
# Text Processing Module

'''
CSCI 3308 - Lab 11
Author: Bryce DesBrisay


Error #1 from Question 5:
changed line in count_vowels function 
from:
vowels = re.compile(r'[aeou]', re.IGNORECASE)
to:
vowels = re.compile(r'[aeiou]', re.IGNORECASE)


Error #2 from Question 6:
changed line in is_phonenumber function
from
phonenum = re.compile(r'^[1-9]{3}([\-.])*[1-9]{3}\1*[1-9]{3}$')
to 
phonenum = re.compile(r'^[1-9]{3}([\-.])*[1-9]{3}\1*[1-9]{4}$')


'''

import unittest
import textproc

class TextprocTestCase(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        pass

    @classmethod
    def tearDownClass(cls):
        pass

    def setUp(self):
        pass

    def tearDown(self):
        pass

    def test_init(self):
        text = "tesing123"
        p = textproc.Processor(text)
        self.assertEqual(p.text, text)

    # Add Your Test Cases Here...

    def test_isString(self):
        p = textproc.Processor("string")
        self.assertTrue(type(p.text) is str)

    def test_count(self):
        length = 6
        p = textproc.Processor("String")
        self.assertEqual(p.count(), length)

    def test_countAlpha(self):
        length = 5
        p = textproc.Processor("Str6ing")
        self.assertEqual(p.count_alpha(), length)

    def test_countNum(self):
        length = 1
        p = textproc.Processor("Str6ing")
        self.assertEqual(p.count_numeric(), length)

    def test_countVowels(self):
        length = 2
        p = textproc.Processor("Str6iAng")
        self.assertEqual(p.count_vowels(), length)

    def test_isPhone(self):
        p = textproc.Processor("123-123-1234")
        self.assertTrue(p.is_phonenumber())

# Main: Run Test Cases
if __name__ == '__main__':
    unittest.main()
