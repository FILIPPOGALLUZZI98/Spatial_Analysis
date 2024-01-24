# The Landsat program started in 1972 and is is the longest running Earth-observation satellite program
# Public satellite data:
# http://earthexplorer.usgs.gov/
# https://lpdaacsvc.cr.usgs.gov/appeears/
# https://search.earthdata.nasa.gov/search
# https://lpdaac.usgs.gov/data_access/data_pool
# https://scihub.copernicus.eu/
# https://aws.amazon.com/public-data-sets/landsat/


# Most remote sensing products consist of observations of reflectance data. That is, they are measures 
# of the intensity of the sun’s radiation that is reflected by the earth. Reflectance is normally measured 
# for different wavelengths of the electromagnetic spectrum. For example, it can be measured in the near-infrared,
# red, green, and blue wavelengths. If that is the case, satellite data can be referred to as “multi-spectral”
# The data are normally stored as raster data, and are generally referred to as “images”.

# A panchromatic image consists of only one band. It is usually displayed as a grey scale image, i.e. the displayed
# brightness of a particular pixel is proportional to the pixel digital number which is related to the intensity of
# solar radiation reflected by the targets in the pixel and detected by the detector. Thus, a panchromatic image may
# be similarly interpreted as a black-and-white aerial photograph of the area. The Radiometric Information is the main
# information type utilized in the interpretation.

# A multispectral image consists of several bands of data. For visual display, each band of the image may be displayed
# one band at a time as a grey scale image, or in combination of three bands at a time as a colour composite image. 
# Interpretation of a multispectral colour composite image will require the knowledge of the spectral reflectance signature
# of the targets in the scene. In this case, the spectral information content of the image is utilized in the interpretation.

# If a multispectral image consists of the three visual primary colour bands (red, green, blue), the three bands may be
# combined to produce a "true colour" image. For example, the bands 3 (red band), 2 (green band) and 1 (blue band) of a
# LANDSAT TM image or an IKONOS multispectral image can be assigned respectively to the R, G, and B colours for display. 
# In this way, the colours of the resulting colour composite image resemble closely what would be observed by the human eyes.
# The display colour assignment for any band of a multispectral image can be done in an entirely arbitrary manner. In this case,
# the colour of a target in the displayed image does not have any resemblance to its actual colour. The resulting product is 
# known as a false colour composite image. There are many possible schemes of producing false colour composite images. However,
# some scheme may be more suitable for detecting certain objects in the image.

# A very common false colour composite scheme for displaying a SPOT multispectral image is shown below:
# R=NIR; G=RED; B=GREEN
# This false colour composite scheme allows vegetation to be detected readily in the image. In this type of false colour 
# composite images, vegetation appears in different shades of red depending on the types and conditions of the vegetation,
# since it has a high reflectance in the NIR band
# Clear water appears dark-bluish (higher green band reflectance), while turbid water appears cyan (higher red reflectance 
# due to sediments) compared to clear water. Bare soils, roads and buildings may appear in various shades of blue, yellow or
# grey, depending on their composition.

# Another common false colour composite scheme for displaying an optical image with a short-wave infrared (SWIR) band is shown below:
# R=SWIR; G=NIR; B=RED
# In this display scheme, vegetation appears in shades of green. Bare soils and clearcut areas appear purplish or magenta. 
# The patch of bright red area on the left is the location of active fires. A smoke plume originating from the active fire site
# appears faint bluish in colour.
























