#!/bin/bash
macro() {
    export MACRO_POLO_WORKDIR=$PWD
}
polo() {
    cd "$MACRO_POLO_WORKDIR" || return
}