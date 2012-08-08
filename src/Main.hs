{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Conduit
import Data.Conduit.Network as Nw
import Data.Conduit.List as Cl
import Data.Conduit.Text as Ct
import Data.Conduit.Binary as Cb

main::IO()
main = runTCPClient (ClientSettings 4000 "127.0.0.1") client

client::Nw.Application IO
client _ sink = runResourceT $ Cb.sourceFile "someFile.txt" $$ Cb.lines =$ sink
        