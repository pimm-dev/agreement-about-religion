latest_release="$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/jgm/pandoc/releases/latest | cut -d'/' -f8)"
download_link="https://github.com/jgm/pandoc/releases/download/$latest_release/pandoc-$latest_release-1-amd64.deb"
downloaded_filename="$(basename $download_link)"
echo "Latest Release Found: $latest_release"
echo "Downloading: $downloaded_filename"
wget $download_link
sudo dpkg -i $downloaded_filename
