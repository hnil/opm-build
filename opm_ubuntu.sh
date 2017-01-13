# Make sure we have updated URLs to packages etc.
sudo apt-get update -y

# For server edition of Ubuntu add-apt-repository depends on
sudo apt-get install -y software-properties-common

# Add PPAs we need
sudo add-apt-repository -y ppa:opm/ppa                 # OPM packages
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test # Updated GCC packages
sudo apt-get update -y

# Packages necessary for building
sudo apt-get install -y build-essential gfortran pkg-config cmake

# Packages necessary for documentation
sudo apt-get install -y doxygen ghostscript texlive-latex-recommended pgf gnuplot

# Packages necessary for version control
sudo apt-get install -y git-core

# Prerequisite libraries
sudo apt-get install -y liblas-dev liblas-c-dev libboost-all-dev \
  libsuitesparse-dev libeigen3-dev libert.ecl-dev
#libsuperlu3-dev libumfpack5.6.2 
# Parts of Dune needed
sudo apt-get install libdune-common-dev libdune-geometry-dev \
  libdune-istl-dev libdune-grid-dev

# Optional but recommended
#sudo apt-get install g++-4.9
#json
# needed for parrallel build
sudo apt-get install libtrilinos-zoltan-dev
