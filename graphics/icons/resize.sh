for img in ./*.png; do
  magick "$img" -resize 128x128\! "./$(basename "$img")"
done
