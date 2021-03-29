{-# LANGUAGE OverloadedStrings #-}

module IOT.Packet.Format
  ( isImg
  , isImg'
  , isJson
  , isJson'
  , isJpeg
  , isJpeg'
  , isPng
  , isPng'
  , isGz
  , isGz'
  ) where

import qualified Data.ByteString as B (drop, isPrefixOf, last, take)
import qualified Data.ByteString.Lazy as BL (drop, isPrefixOf, last, take)

import Data.Char (ord)

isPng = BL.isPrefixOf "\137PNG\r\n\26\n"

isPng' = B.isPrefixOf "\137PNG\r\n\26\n"

isJpeg bytes = BL.take 4 (BL.drop 6 bytes) `elem` ["JFIF", "Exif"]

isJpeg' bytes = B.take 4 (B.drop 6 bytes) `elem` ["JFIF", "Exif"]

isImg x = isPng x || isJpeg x

isImg' x = isPng' x || isJpeg' x

isJson x =
  (BL.take 1 x == "{" && BL.last x == fromIntegral (ord '}')) ||
  (BL.take 1 x == "[" && BL.last x == fromIntegral (ord ']'))

isJson' x =
  (B.take 1 x == "{" && B.last x == fromIntegral (ord '}')) ||
  (B.take 1 x == "[" && B.last x == fromIntegral (ord ']'))

isGz = BL.isPrefixOf "\31\139"

isGz' = B.isPrefixOf "\31\139"
