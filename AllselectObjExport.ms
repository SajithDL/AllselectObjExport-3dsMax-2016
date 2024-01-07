-- AllselectObjExport.ms
-- Export all selected objects to individual OBJ files.
-- Designed specifically for 3ds Max 2016
-- Created by Sajith Dilan Lalinda
-- https://github.com/SajithDL

-- Set the base path to the Downloads folder and create a new folder named "AllselectObjExport"
basePath = getDir #userscripts + "\\Downloads\\AllselectObjExport\\"

-- Function to get the current selection
fn getCurrentSelection = (selection as array)

-- Function to check if a file or directory exists
fn doesFileExist filePath = (getFiles filePath).count > 0

-- Store the initial selection
initialSelection = getCurrentSelection()

-- Check if the directory exists, if not, create it
if not doesFileExist basePath do (makeDir basePath)

if doesFileExist basePath then
(
    -- Iterate through each object in the initial selection
    for obj in initialSelection do
    (
        -- Clear any current selection and select only the current object
        clearSelection()
        select obj

        -- Define the filename for the OBJ file
        filename = basePath + obj.name + ".obj"
        print ("Exporting: " + filename)

        -- Export the current object to an OBJ file
        exportFile filename #noPrompt selectedOnly:true
    )
    print ("Export complete.")
)
else
(
    -- Print an error message if the directory does not exist
    print ("Error: Directory does not exist - " + basePath)
)
