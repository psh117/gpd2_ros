# Searches for GBD includes and library files, including Addons.
#
# Sets the variables
#   gbd_FOUND
#   GPD_LIB_INCLUDE_DIR
#   GPD_LIB
#


SET (gbd_FOUND FALSE)

## System dependencies are found with CMake's conventions

find_path (GPD_LIB_INCLUDE_DIR gpd/grasp_detector.h
	HINTS
	/usr/local/include
	/usr/include
	)

find_library(GPD_LIB NAMES gpd 
	PATHS 
	/usr/local/lib PATH_SUFFIXES lib NO_DEFAULT_PATH)

if (GPD_LIB)
  message(STATUS "Library GPD found in ${GPD_LIB}")
else()
  message(FATAL_ERROR "Library GPD not found")
endif()
include_directories(${GPD_LIB_INCLUDE_DIR})
message(STATUS "gpd_include_dir: ${GPD_LIB_INCLUDE_DIR}")


IF (GPD_LIB_INCLUDE_DIR AND GPD_LIB)
	SET (gbd_FOUND TRUE)
ENDIF (GPD_LIB_INCLUDE_DIR AND GPD_LIB)


IF (gbd_FOUND)
   IF (NOT gbd_FIND_QUIETLY)
      MESSAGE(STATUS "Found GBD: ${GPD_LIB}")
   ENDIF (NOT gbd_FIND_QUIETLY)

ELSE (gbd_FOUND)
   IF (gbd_FIND_REQUIRED)
		 MESSAGE(SEND_ERROR "Could not find GBD")
   ENDIF (gbd_FIND_REQUIRED)
ENDIF (gbd_FOUND)

MARK_AS_ADVANCED (
	GPD_LIB_INCLUDE_DIR
	GPD_LIB
	)
