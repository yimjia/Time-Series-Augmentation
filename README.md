# Time-Series-Augmentation
We developed a convolutional variational autoencoder (CVAE) to efficiently augment the time series of extratropical cyclone severity measures (wind speed and flood elevation). 
As a generative model, the developed CVAE learns the probability distribution of latent features (here, low-dimensional underlying characteristics of the time series) as a multivariate normal distribution. 
The augmented severity measure time series are then obtained in two steps: 1) randomly sampling data from the learned multivariate normal distribution, and 2) using the randomly sampled data as the input to the decoder of the trained CVAE to generate time series of severity measures.

The develoepd CVAE is not limited to augmenting the time series of extratropical cyclone’s wind speeds and flood elevations, it can also be applied to augment any time series data (one-dimensional or multidimensional), which would be benefit from augmentation. 
<br/><br/>

For more information, please refer to the manuscript:
"Convolutional Variational Autoencoder for Northeast US Coastal Wind and Flood Hazard Data Augmentation".
<br/><br/>

As **prerequisites**, users need to have basic knowledge of machine learning or deep learning and have access to run Python and Matlab codes.

To **download** the codes, please navigate to the main page of this repository. From the top menu, click on **Download Repository**. 

The **Model** folder includes the *codes* to perform the developed CVAE for time series augmentation and a *step-by-step instruction*. 

The **Example** folder includes the *codes*, *data*, and an *instruction* to reproduce the augmentation for the time series of extratropical cyclone severity measures presented in Section 3.1 of the above-mentioned paper.
<br/>

Note that the codes were run on Python 3.10.14 (TensorFlow 2.13.1 required) and Matlab R2023b. The authors recommend running the Python codes on Jupyter Notebook. Running the codes on different versions of Python, TensorFlow, or Matlab may result in compatibility issues. However, most compatibility issues can be resolved by following the suggestions in the error messages.
