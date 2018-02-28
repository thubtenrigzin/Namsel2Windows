@echo off

cd install

Rem Python 2.7 - 64bit
	wget https://www.python.org/ftp/python/2.7.14/python-2.7.14.amd64.msi
	msiexec /i python-2.7.14.amd64.msi /passive TARGETDIR=r:\Python27
	del python-2.7.14.amd64.msi
					path (avec l'installation?)

Rem VC
	wget https://repo.saltstack.com/windows/dependencies/VCForPython27.msi
	msiexec /i VCForPython27.msi /passive
	del VCForPython27.msi
					voir avec le path??
						change le fichier python (nécessaire si path ?)

Rem More Stuffs
python -m pip install Cython numpy pillow sklearn simplejson scipy opencv-contrib-python
	
	Rem Downgrade scikit
	pip install --upgrade scikit-learn==0.18.1

Rem GTK
wget https://github.com/SpiNNakerManchester/SpiNNakerManchester.github.io/releases/download/v1.0-win64/gtk.-bundle_2.22.1-20101229_win64.zip
unzip gtk.-bundle_2.22.1-20101229_win64.zip c:\gtk
del gtk.-bundle_2.22.1-20101229_win64.zip
set path=c:\gtk\bin;%PATH%

	Rem pycairo
	wget https://github.com/SpiNNakerManchester/SpiNNakerManchester.github.io/releases/download/v1.0-win64/py2cairo-1.10.0.win-amd64-py2.7.exe
	py2cairo-1.10.0.win-amd64-py2.7.exe
	del py2cairo-1.10.0.win-amd64-py2.7.exe

	Rem pygtk
	wget https://github.com/SpiNNakerManchester/SpiNNakerManchester.github.io/releases/download/v1.0-win64/pygtk-2.22.0.win-amd64-py2.7.exe
	pygtk-2.22.0.win-amd64-py2.7.exe
	del pygtk-2.22.0.win-amd64-py2.7.exe
	
	Rem pygobject
	wget https://github.com/SpiNNakerManchester/SpiNNakerManchester.github.io/releases/download/v1.0-win64/pygobject-2.28.6.win-amd64-py2.7.exe
	pygobject-2.28.6.win-amd64-py2.7.exe
	del pygobject-2.28.6.win-amd64-py2.7.exe

Rem Santailor
wget https://github.com/scantailor/scantailor/releases/download/RELEASE_0_9_11_1/scantailor-0.9.11.1-64bit-install.exe
scantailor-0.9.11.1-64bit-install.exe
del scantailor-0.9.11.1-64bit-install.exe

Rem Fonts installation
cscript install-fonts.vbs

Rem Building Namsel
cd ..
python setup.py build_ext --inplace

mkdir \tmp
cd ..\data_generation
python font_draw.py

cd ..\datasets
unzip datapickles.zip

cd ..
python classify.py