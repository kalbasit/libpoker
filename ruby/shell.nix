# This allows overriding nixpkgs by passing `--arg pkgs ...`
{ pkgs ? import ./nixpkgs.nix {}
, lib ? pkgs.lib
}:

with pkgs;
with lib;

let

in stdenv.mkDerivation {
  name = "libpoker-ruby-dev";

  buildInputs = [
    ruby.devEnv
  ];

  # # Setup bundler to compile native extensions correctly
  # BUNDLE_BUILD__THERUBYRACER =  builtins.concatStringsSep " " [
  #   "--with-system-v8"
  #   "--with-v8-dir=${getDev v8_3_16_14}"
  # ];
  #
  # BUNDLE_BUILD__LIBV8 = builtins.concatStringsSep " " [
  #   "--with-system-v8"
  #   "--with-v8-dir=${getDev v8}"
  # ];
  #
  # BUNDLE_BUILD__SQLITE3 = builtins.concatStringsSep " " [
  #   "--with-sqlite3-include=${getDev sqlite}/include"
  #   "--with-sqlite3-lib=${getLib sqlite}/lib"
  # ];
  #
  BUNDLE_BUILD__NOKOGIRI = builtins.concatStringsSep " " ([
    "--use-system-libraries"
    "--with-zlib-include=${getDev zlib}/include"
    "--with-zlib-lib=${getLib zlib}/lib"
    "--with-xml2-include=${getDev libxml2}/include/libxml2"
    "--with-xml2-lib=${getLib libxml2}/lib"
    "--with-xslt-include=${getDev libxslt}/include"
    "--with-xslt-lib=${getLib libxslt}/lib"
    "--with-exslt-include=${getDev libxslt}/include"
    "--with-exslt-lib=${getLib libxslt}/lib"
  ] ++ optionals stdenv.isDarwin [
    "--with-iconv-lib=${getLib libiconv}/lib"
    "--with-iconv-include=${getDev libiconv}/include"
  ]);

  #
  # BUNDLE_BUILD__PG = builtins.concatStringsSep " " [
  #   "--with-pg-lib=${getLib postgresql}/lib"
  #   "--with-pg-include=${getDev postgresql}/include"
  # ];

  # Make sure no one does a nix build on this file!
  phases = ["nobuildPhase"];
  nobuildPhase = ''
    echo
    echo "This derivation is not meant to be built, aborting";
    echo
    exit 1
  '';
}
