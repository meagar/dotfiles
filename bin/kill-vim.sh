#!/bin/bash

ps axuw | grep nvim | grep -v grep | awk '{print $2}' | xargs kill -9
