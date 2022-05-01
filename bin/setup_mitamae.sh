#!/bin/sh
set -eu

version='1.12.9'
mitamae_version="mitamae-${version}"

if ! [ -f "bin/${mitamae_version}" ]; then
  case "$(uname)" in
    "Darwin")
      case "$(uname -m)" in
        "arm64")
          mitamae_bin="mitamae-aarch64-darwin"
        ;;
        "86_64")
          mitamae_bin="mitamae-x86_64-darwin"
        ;;
      esac
      ;;
    "Linux")
      mitamae_bin="mitamae-x86_64-linux"
      ;;
    *)
      echo "unknown uname: $(uname)"
      exit 1
      ;;
  esac

  # http://www.hcn.zaq.ne.jp/___/unix/curl_manual.html
  curl -o "bin/${mitamae_bin}.tar.gz" -fL "https://github.com/itamae-kitchen/mitamae/releases/download/v${version}/${mitamae_bin}.tar.gz"
  tar xvzf "bin/${mitamae_bin}.tar.gz"

  rm "bin/${mitamae_bin}.tar.gz"
  mv "${mitamae_bin}" "bin/${mitamae_version}"
  chmod +x "bin/${mitamae_version}"
  ln -sf "${mitamae_version}" bin/mitamae

else
  echo 'already installed Mitamae'
fi
