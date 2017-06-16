{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_SQL_lexical_analyzer (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/media/alicia/Nuevo vol/2017/IORM/ERD_Idioms_builder/SQL_lexical_analyzer/.cabal-sandbox/bin"
libdir     = "/media/alicia/Nuevo vol/2017/IORM/ERD_Idioms_builder/SQL_lexical_analyzer/.cabal-sandbox/lib/x86_64-linux-ghc-7.10.3/SQL-lexical-analyzer-0.1.0.0-4ujujVgJhiyHEfcH6GgXOc"
datadir    = "/media/alicia/Nuevo vol/2017/IORM/ERD_Idioms_builder/SQL_lexical_analyzer/.cabal-sandbox/share/x86_64-linux-ghc-7.10.3/SQL-lexical-analyzer-0.1.0.0"
libexecdir = "/media/alicia/Nuevo vol/2017/IORM/ERD_Idioms_builder/SQL_lexical_analyzer/.cabal-sandbox/libexec"
sysconfdir = "/media/alicia/Nuevo vol/2017/IORM/ERD_Idioms_builder/SQL_lexical_analyzer/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "SQL_lexical_analyzer_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "SQL_lexical_analyzer_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "SQL_lexical_analyzer_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "SQL_lexical_analyzer_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "SQL_lexical_analyzer_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
