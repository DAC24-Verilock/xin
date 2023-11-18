module Util.FileUtil (
    writeStringToFile,
    createAndWriteFile,
    copyFileToDirectory
) where

import Data.Text (Text, pack)
import qualified Data.Text.IO as TIO
import System.Directory (createDirectoryIfMissing, copyFile)
import System.FilePath ((</>), takeDirectory, takeFileName)

writeStringToFile :: FilePath -> String -> IO ()
writeStringToFile path content = createAndWriteFile path (pack content)

createAndWriteFile :: FilePath -> Text -> IO ()
createAndWriteFile path content = do
    createDirectoryIfMissing True $ takeDirectory path
    TIO.writeFile path content

copyFileToDirectory :: FilePath -> FilePath -> IO ()
copyFileToDirectory srcFile destDir = do
  createDirectoryIfMissing True destDir
  let destFile = destDir </> takeFileName srcFile
  copyFile srcFile destFile
  putStrLn $ "File copied to: " ++ destFile
