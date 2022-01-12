![](MAPPER_Abstract_Image.png)

Here is a repository for the manuscript titled MAPPER: An open-source, high-dimensional image analysis pipeline unmasks differential regulation of *Drosophila* wing features developed and written by Nilay Kumar and Francisco Huizar in the Zartman lab at the University of Notre Dame. You can find the pre-print of the paper on bioRxiv [here](https://www.biorxiv.org/content/10.1101/2020.12.16.422888v1.full). The bulk of the code was built by [Nilay Kumar](https://scholar.google.com/citations?user=XZjD7PYAAAAJ&hl=en) and co-developed by [Francisco Huizar](https://www.linkedin.com/in/francisco-huizar-82bb1a127/). [Dr. Ramezan Paravi Torghabeh](https://www.linkedin.com/in/ramezan-paravi-torghabeh-phd-b432baa0/) and [Dr. Pavel Brodskiy](https://www.linkedin.com/in/pavelbrodskiy) provided guidance for code development. Experimental work and validation was carried out by Nilay Kumar, [Dr. Maria Unger](https://www.linkedin.com/in/maria-unger-10523158), [Trent Robinett](https://www.linkedin.com/in/trent-robinett-5a8979161), [Keity J. Farfan-Pira](https://mx.linkedin.com/in/keity-j-farf%C3%A1n-pira-3a5a06209), and [Dharsan Soundarrajan](https://scholar.google.com/citations?user=AWv4OiIAAAAJ&hl=en). This work was done within the [Multicellular Systems Engineering Lab](http://sites.nd.edu/zartmanlab/) at the University of Notre Dame and the [Laboratory of Growth Biology and Morphogenesis](https://www.fisio.cinvestav.mx/academicos/nahmad/index.html) at the Center for Research and Advanced Studies of the National Polytechnical Institute (Cinvestav). Please direct any questions to the principal investigator, [Dr. Jeremiah Zartman](http://sites.nd.edu/zartmanlab/contacts/). 

All code for the MAPPER application was done using [MATLAB](https://www.mathworks.com/products/matlab.html).  

# Instructions to run the application
- You can download all of the associated code [here](https://downgit.github.io/#/home?url=https://github.com/MulticellularSystemsLab/MAPPER/tree/main/MAPPER_v1.0.0)
- Once you have downloaded the .ZIP folder, extract the folder to an easily accessible location
- You can download the full user manual for how to begin using MAPPER [here](https://github.com/MulticellularSystemsLab/MAPPER/raw/main/MAPPER_v1.0.0/MAPPER_manual.pdf)
  - Alternatively, the full user manual is available within the downloadable MAPPER folder

# Available [ILASTIK](https://www.ilastik.org/documentation/pixelclassification/pixelclassification.html) pixel classification modules
Below you will find pre-trained pixel classification modules in ILASTIK for several wing images we have already processed. These modules are crucial for step five of the MAPPER user manual. Below each module link, you will find a representative image of the *Drosophila* wings that were used to train the module. You should download and use the ILASTIK module that has the closest resemblance in lighting, background, brightness, contrast, and saturation to the images you would like to process. If none of the available ILASTIK modules closely resemble the images you would like to process, there are detailed instructions in the user manual on how to train your own ILASTIK module. **NOTE:** The number of channels of your images must match the number of channels in the training data for the ILASTIK module you choose (*i.e.,* RGB channel images must have an ILASTIK module trained on RGB channel images).

- [Download](https://downgit.github.io/#/home?url=https://github.com/MulticellularSystemsLab/MAPPER/tree/main/ILASTIKPixelClassifier_1) ILASTIK module 1
  - **Source:** Nilay Kumar, Zartman Lab, Univeristy of Notre Dame
  - One channel (Grayscale)
![](Classifier_1.png)


- [Download](https://downgit.github.io/#/home?url=https://github.com/MulticellularSystemsLab/MAPPER/tree/main/ILASTIKPixelClassifier_2) ILASTIK module 2
  - **Source:** Nilay Kumar, Zartman Lab, Univeristy of Notre Dame
  - One channel (Grayscale)
![](Classifier_2.png)


- [Download](https://downgit.github.io/#/home?url=https://github.com/MulticellularSystemsLab/MAPPER/tree/main/ILASTIKPixelClassifier_3) ILASTIK module 3
  - **Source:** Nilay Kumar, Zartman Lab, Univeristy of Notre Dame
  - Three channels (RGB)
![](Classifier_3.png)


- [Download](https://downgit.github.io/#/home?url=https://github.com/MulticellularSystemsLab/MAPPER/tree/main/ILASTIKPixelClassifier_4) ILASTIK module 4
  - **Source:** Nilay Kumar, Zartman Lab, Univeristy of Notre Dame
  - One channel (Grayscale)
![](Classifier_4.png)


- [Download](https://downgit.github.io/#/home?url=https://github.com/MulticellularSystemsLab/MAPPER/tree/main/ILASTIKPixelClassifier_5) ILASTIK module 5
  - **Source:** Nilay Kumar, Zartman Lab, Univeristy of Notre Dame
  - One channel (Grayscale)
![](Classifier_5.png)


- [Download](https://downgit.github.io/#/home?url=https://github.com/MulticellularSystemsLab/MAPPER/tree/main/ILASTIKPixelClassifier_6) ILASTIK module 6
  - **Source:** Nilay Kumar, Zartman Lab, Univeristy of Notre Dame
  - Three channels (RGB)
![](Classifier_6.png)

# [U-Net](https://lmb.informatik.uni-freiburg.de/people/ronneber/u-net/) deep learning trained model
- Supplementary File 1 sections S1 and S2 of the manuscript references a U-Net trained model that is linked [here](https://drive.google.com/drive/folders/1fC3q7lHMR-LaxyUitUEArbPh4hyO9fXX?usp=sharing)
- The full folder contains:
	- Image training data in the "imagedata" subfolder
	- The python code for training the U-net in an iPython notebook labeled "Deep learning-Unet-CrossEntropy-Four_classes"
	- The python code for using the U-net in an iPython notebook labeled "Model Usage"
	- A presentation on utiizing U-Net for *Drosophila* wing segmentation in a Microsoft Powerpoint labeled "wingSegmentation"	
- For training the intervein classifier, MATLAB's image labeler app was used and the training resources can be found [here](https://github.com/MulticellularSystemsLab/MAPPER/tree/main/Supplmentary S2 Training Resources)
	- More information for this is explained in section S2 of Supplementary File 1

# Supplementary File 2 R Notebook
- Figures 3 and 6 of the main text reference a supplementary file for statistical calculations
- The supplementary file is in the form of an [R Notebook](https://rmarkdown.rstudio.com/lesson-10.html) and can be found [here](https://fjhuizar.github.io/MAPPER/RNotebook/)
- Plots generated from the notebook were exported as SVG files and modified in [Inkscape](https://inkscape.org/) vector graphics software for final versions of the manuscript plots

# Raw Data Sheets
- Data for Figures 3, 6, S7, and S8 can be found [here](https://github.com/MulticellularSystemsLab/MAPPER/tree/main/RNotebook). Explicit operations on the data sheets are found within [Supplementary File 2](https://fjhuizar.github.io/MAPPER/RNotebook/)
- Data for Figures 4, 5, S9, and S10 can be found [here](https://github.com/MulticellularSystemsLab/MAPPER/blob/main/Raw%20Data%20Sheets/samarkData.csv) for wing features and [here](https://github.com/MulticellularSystemsLab/MAPPER/blob/main/Raw%20Data%20Sheets/samarkEFD.csv) for EFD coefficients
- Data for Figures 7, S11, and S12 can be found [here](https://github.com/MulticellularSystemsLab/MAPPER/raw/main/Raw%20Data%20Sheets/MAPPER_SPECIES_DATA.xlsx)


# Acknowledgements
We would like to thank the South Bend Medical Foundation for generous access to their Apero Slide Scanner. We would like to thank [Dr. Ramezan Paravi Torghabeh](https://www.linkedin.com/in/ramezan-paravi-torghabeh-phd-b432baa0/), [Vijay Kumar Naidu Velagala](https://in.linkedin.com/in/vijay-kumar-naidu-velagala-34462429), [Dr. Megan Levis](https://scholar.google.com/citations?user=SY2-XTgAAAAJ&hl=en), and [Dr. Qinfeng Wu](https://www.linkedin.com/in/qinfengwu) for technical assistance and scientific discussions related to the project. The work in this manuscript was supported in part by NIH Grant R35GM124935, NSF award CBET-1553826, NSF-Simons Pilot award through Northwestern University, the Notre Dame International Mexico Faculty Grant Program, and grant CB-014-01-236685 from the Concejo Nacional de Ciencia y Tecnología of Mexico.

# Repository last updated: January 12, 2022 04:00PM EST
