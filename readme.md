# Scalepix

**This is still work in progress!**

## What is it?

A shell script to scale all JPG-images in a folder. Also, it renames them using a consistent naming convention.

## Why is that useful?

Do you own multiple cameras? Then you often have something like this:

* __Camera A__ stores its images with this filename pattern: `IMG_1467.JPG`
* __Camera B__ does something like: `DSC_093.jpg`

If you make a best-of selection with images from both camera models, your images get all mixed up in your folder (depends on your current folder sorting of your OS).
So, you might want to have a consistent naming convention for all your images in that folder.

* This script reads the Exif-data of all your images in a folder and prepends date and time to the filename.
* Also, it scales the image to a desired percentage. (When I want to upload my best of image collection to an online image gallery, having huge JPG-files results in lots of GB.)

So in the end `IMG_1467.JPG` and `DSC_093.jpg` become:

```
20161025_120341_IMG_1467.jpg # shot on: 2016/10/25, 12:03 and 41 seconds
20161104_151309_DSC_093.jpg  # shot on: yeah, I guess you got it
```

## Fist setup

* clone repo or download .sh-file
* make it executable: `chmod +x scalepix.sh`
* `mv` script to a folder with your JPG-files

## Dependencies

* exiv2
* convert

## Usage

**CAUTION**: Make a backup of your original image files/folder before running this script!

```
# mv script to a folder with JPG files, then execute
./scalepix.sh # default scaling: 50%

# call with own scaling percentage, e.g. 75%
./scalepix.sh 75
```
