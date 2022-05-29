#/bin/sh

# About: Installs custom icons
#
#
# Image filenames: prefix-example.png
#    prefix vendorname or username to avoid nameclashes (alternatively --novendor)
#
# Desktop files:
#    Icons=prefix-example      (No extension!)
#
#

for imgfile in *.png
do
	xdg-icon-resource install --size 128 "${imgfile}"
done

