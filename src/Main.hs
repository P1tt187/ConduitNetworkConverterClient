{-# LANGUAGE OverloadedStrings #-}
{-# XNoMonomorphismRestriction #-}

module Main where

import Data.Conduit
import Data.Conduit.Network as Nw
import Data.Conduit.List as Cl
import Data.Conduit.Text as Ct
import Data.Conduit.Binary as Cb
import Data.Conduit.Blaze as Cbl

main::IO()
main = runTCPClient (ClientSettings 4000 "127.0.0.1") client

client::GSource -> GSink
client _ sink = do  
   transPipe $ Cb.sourceFile "someFile.txt" $$ sink
        