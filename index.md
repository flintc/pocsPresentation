
<!-- .slide: data-background-image="static/pocsVsMagFactor/estImSFNN_mFac16.png" data-background-repeat="repeat" data-background-size="45%"  data-background-opacity="0.15"-->

<!-- .element: class="banner" -->

# Multi-Frame Super-resolution: A Set Theoretic Approach
## Carrie Flint

    
 
Note: test note

<!--s-->
<!-- .element: class="banner" -->           
<!-- .slide: data-background-image="static/noAlias.png" data-background-repeat="repeat" data-background-size="40%"  data-background-opacity="0.15"-->
# Introduction
         
<!--v-->
     
## The problem 

Discrete sampling of continuous signals imposes geometrical resolution limit, i.e. <!-- .element: class="fragment" data-fragment-index="0" --> _aliasing_ <!-- .element: class="fragment" data-fragment-index="1" -->


<img src='static/noAlias.png' style="width:30vw;" />   <!-- .element: class="fragment" data-fragment-index="2"-->
<img src='static/alias.png' style="width:30vw;" />  <!-- .element: class="fragment" data-fragment-index="2"-->

<!--v-->
## Fequency Spectrum
Low frequency information is misrepresented in the high frequencies <!-- .element: class="fragment" data-fragment-index="1" --->

<img src='static/fftNoAlias2.png' style="width:30vw;" /> <!-- .element: class="fragment" data-fragment-index="2"--->
<img src='static/fftAlias2.png' style="width:30vw;" /> <!-- .element: class="fragment" data-fragment-index="2"--->

<!--v-->

## Definition

> Super-resolution imaging (SR) is a class of techniques that enhance the resolution of an imaging system. In some SR techniques—termed optical SR—the diffraction limit of systems is transcended, while in others—geometrical SR—the resolution of digital imaging sensors is enhanced.

<!--v-->
## Goals

* Overcome the image resolution limit imposed by discrete sampling grid, i.e. <!-- .element: class="fragment" data-fragment-index="0"--> _geometrical SR_ <!-- .element: class="fragment" data-fragment-index="1" -->
* Reconstruct high resolution image from a series of <!-- .element: class="fragment" data-fragment-index="2"--> _non-redundant_ low resolution images <!-- .element: class="fragment" data-fragment-index="2"-->
* Study reconstruction performance metrics on <!-- .element: class="fragment" data-fragment-index="3"--> _simulated_ data as a function of: <!-- .element: class="fragment" data-fragment-index="3"-->
    * number of iterations <!-- .element: class="fragment" data-fragment-index="4"-->
    * number of low resolution images <!-- .element: class="fragment" data-fragment-index="5"-->
    * magnification factor <!-- .element: class="fragment" data-fragment-index="6"-->
* Demonstrate performance on real-world video sequence <!-- .element: class="fragment" data-fragment-index="7"-->

<!--s-->

# Approach
<!-- .slide: class="banner" -->
<!-- .slide: data-background-image="static/convex_sets.png" data-background-repeat="repeat" data-background-size="45%"  data-background-opacity="0.15"-->

<!--v-->

## Constraint sets
* A variety of constraints can be applied to the problem:
    * Amplitude, data consistency, bounded energy, bandlimitedness, etc
* Amplitude constraint: <!-- .element: class="fragment" -->
  $$C_A = \left\\{x(l_1,l_2): A_1 \leq x(l_1,l_2) \leq A_2 \right\\}~\forall(l_1,l_2)$$  <!-- .element: class="fragment" -->
* Data consistency constraint: <!-- .element: class="fragment" -->
  $$ \begin{aligned} C\_k(m_1,m_2) &= \left\\{ \underline{X}: \left| r_k(m_1,m_2) \right| \leq \delta_k(m_1,m_2) \right\\}~~1 \leq k \leq N;~\forall(m_1,m_2)~\epsilon~\theta_k & \\\\
   r_k(m_1,m_2) &= y_k(m_1,m_2) - \hat{y}_k(m_1,m_2) & \\\\ \hat{y}\_k(m_1,m_2) &= [D\_kB\_kG\_k\underline{X}]\_{(m_1,m_2)} &  \end{aligned}$$ <!-- .element: class="fragment" -->
* The most difficult part of POCS involves the complexity of the projection operator <!-- .element: class="fragment" -->
* The above constraints result in <!-- .element: class="fragment" --> _convex_ sets of high-dimensional cubes <!-- .element: class="fragment" -->
  
<!--v-->

## Projections onto convex sets
* Guaranteed to converge! <!-- .element: class="fragment" data-fragment-index="0" -->
* Solution <!-- .element: class="fragment" data-fragment-index="1" --> _not_ guaranteed to be unique <!-- .element: class="fragment" data-fragment-index="1" -->
  
  
<!--v-->
    
## Modeling the Problem

<img src='static/imagingModel.png' style="width:85vw;" />  

<!--v-->

## Metrics 

* Residual Error: how well does the reconstructed image match the observations <!-- .element: class="fragment" -->
  $$ E^2\_{res} = \frac{\sum |\hat{y}(m\_1,m\_2,k)-y(m\_1,m\_2,k)|^2}{\sum |y(m\_1,m\_2,k)|^2} $$
* Reconstruction Error: how well does the reconstructed image match the ground truth image <!-- .element: class="fragment" -->
  $$ E^2\_{rec} = \frac{\sum |\hat{x}(l\_1,l\_2)-x(l\_1,l\_2)|^2}{\sum |x(l\_1,l\_2)|^2} $$
* Sharpness: how much high-frequency information is reconstructed image <!-- .element: class="fragment" -->
  $$ S\_1 = \frac{\sum |\hat{x}(l\_1,l\_2)|^4}{\sum |x(l\_1,l\_2)|^4} $$
<!--s-->
<!-- .slide: class="banner" -->
<!-- .slide: data-background-image="static/pocsVsNumIters/imGT.png" data-background-repeat="repeat" data-background-size="45%"  data-background-opacity="0.15"-->

# Results 
## Number of Iterations 

<!--v--> 
<!-- .slide: id="clockGT" data-transition="None" data-transition-speed="fast" data-background-opacity="0.25" -->

| <font color="yellow">ground truth</font>	| [low resolution](#/clockNN)	| [bilinear](#/clockBL) 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [10](#/clock10) 	| [50](#/clock50) 	|[100](#/clock100) 	| [1000](#/clock1000)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumIters/imGT.png' style="width:37vw;" />  

<!--v-->
<!-- .slide: id="clockNN" data-transition="None" data-transition-speed="fast" -->

| [ground truth](#/clockGT)	| <font color="yellow">low resolution</font>	| [bilinear](#/clockBL) 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [10](#/clock10) 	| [50](#/clock50) 	|[100](#/clock100) 	| [1000](#/clock1000)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumIters/imNN.png' style="width:37vw;" />  

<!--v-->
<!-- .slide: id="clockBL" data-transition="None" data-transition-speed="fast" -->

| [ground truth](#/clockGT)	| [low resolution](#/clockNN)	| <font color="yellow">bilinear</font> 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [10](#/clock10) 	| [50](#/clock50) 	|[100](#/clock100) 	| [1000](#/clock1000)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumIters/imBL.png' style="width:37vw;" />  

<!--v-->
<!-- .slide: id="clock10" data-transition="None" data-transition-speed="fast" -->

| [ground truth](#/clockGT) 	| [low resolution](#/clockNN)	| [bilinear](#/clockBL) 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| <font color="yellow">10</font>	| [50](#/clock50) 	|[100](#/clock100) 	| [1000](#/clock1000)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumIters/imHR_numIters10.png' style="width:37vw;" />  

<!--v-->
<!-- .slide: id="clock50" data-transition="None" data-transition-speed="fast" center="false" -->

| [ground truth](#/clockGT) 	| [low resolution](#/clockNN)	| [bilinear](#/clockBL) 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [10](#/clock10) 	| <font color="yellow">50</font>	| [100](#/clock100) 	|  [1000](#/clock1000)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumIters/imHR_numIters50.png' style="width:37vw;" />  

<!--v-->
<!-- .slide: id="clock100" data-transition="None" data-transition-speed="fast" center="false" -->

| [ground truth](#/clockGT) 	| [low resolution](#/clockNN)	| [bilinear](#/clockBL) 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [10](#/clock10)  	| [50](#/clock50)  	| <font color="yellow">100</font>  	| [1000](#/clock1000)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumIters/imHR_numIters100.png' style="width:37vw;" />   

<!--v-->
<!-- .slide: id="clock1000" data-transition="None" data-transition-speed="fast" center="false" -->
| [ground truth](#/clockGT) 	| [low resolution](#/clockNN)	| [bilinear](#/clockBL) 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [10](#/clock10)  	| [50](#/clock50) 	| [100](#/clock100) 	| <font color="yellow">1000</font>	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumIters/imHR_numIters1000.png' style="width:37vw;" />  

<!--s-->
<!-- .slide: class="banner" -->
<!-- .slide: data-background-image="static/pocsVsNumObs/imGT.png" data-background-repeat="repeat" data-background-size="45%"  data-background-opacity="0.15"-->
# Results
## Number of Observations

<!--v-->
<!-- .slide: id="rheesGT4" data-transition="None" data-transition-speed="fast" -->

| <font color="yellow">ground truth</font>	| [low resolution](#/rheesNN4)	| [bilinear](#/rheesBL4) 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [*4*](#/rhees4) 	| [8](#/rheesGT8) 	|[16](#/rheesGT16) 	| [32](#/rheesGT32)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumObs/imGT.png' style="width:37vw;" />  

<!--v-->

<!-- .slide: id="rhees4" data-transition="None" data-transition-speed="fast" -->

| [ground truth](#/rheesGT4)	| [low resolution](#/rheesNN4)	| [bilinear](#/rheesBL4) 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| <font color="yellow">4</font> 	| [8](#/rhees8) 	|[16](#/rhees16) 	| [32](#/rhees32)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumObs/estImHR_nObs4.png' style="width:37vw;" />  

<!--v-->

<!-- .slide: id="rhees8" data-transition="None" data-transition-speed="fast" -->

| [ground truth](#/rheesGT8)	| [low resolution](#/rheesNN8)	| [bilinear](#/rheesBL8) 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [4](#/rhees4) 	| <font color="yellow">8</font>  	|[16](#/rhees16) 	| [32](#/rhees32)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumObs/estImHR_nObs8.png' style="width:37vw;" />  

<!--v-->

<!-- .slide: id="rhees16" data-transition="None" data-transition-speed="fast" -->

| [ground truth](#/rheesGT16)	| [low resolution](#/rheesNN16)	| [bilinear](#/rheesBL16) 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [4](#/rhees4) 	| [8](#/rhees8)  	| <font color="yellow">16</font> 	| [32](#/rhees32)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumObs/estImHR_nObs16.png' style="width:37vw;" />  

<!--v-->

<!-- .slide: id="rhees32" data-transition="None" data-transition-speed="fast" -->

| [ground truth](#/rheesGT32)	| [low resolution](#/rheesNN32)	| [bilinear](#/rheesBL32) 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [4](#/rhees4) 	| [8](#/rhees8)  	|[16](#/rhees16) 	| <font color="yellow">32</font> 	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumObs/estImHR_nObs32.png' style="width:37vw;" />  

<!--v-->
<!-- .slide: id="rheesNN4" data-transition="None" data-transition-speed="fast" -->

| [ground truth](#/rheesGT4)	| <font color="yellow">low resolution</font>	| [bilinear](#/rheesBL4) 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [*4*](#/rhees4) 	| [8](#/rheesNN8) 	|[16](#/rheesNN16) 	| [32](#/rheesNN32)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumObs/estImSFNN_nObs4.png' style="width:37vw;" />  

<!--v-->
<!-- .slide: id="rheesBL4" data-transition="None" data-transition-speed="fast" -->

| [ground truth](#/rheesGT4)	| [low resolution](#/rheesNN4)	| <font color="yellow">bilinear</font> 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [*4*](#/rhees4) 	| [8](#/rheesBL8) 	|[16](#/rheesBL16) 	| [32](#/rheesBL32)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumObs/estImMFBL_nObs4_shift.png' style="width:37vw;" /> 

<!--v-->
<!-- .slide: id="rheesGT8" data-transition="None" data-transition-speed="fast" -->

| <font color="yellow">ground truth</font>	| [low resolution](#/rheesNN8)	| [bilinear](#/rheesBL8) 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [4](#/rheesGT4) 	| [*8*](#/rhees8) 	|[16](#/rheesGT16) 	| [32](#/rheesGT32)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumObs/imGT.png' style="width:37vw;" />  

<!--v-->
<!-- .slide: id="rheesNN8" data-transition="None" data-transition-speed="fast" -->

| [ground truth](#/rheesGT8)	| <font color="yellow">low resolution</font>	| [bilinear](#/rheesBL8) 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [4](#/rheesNN4) 	| [*8*](#/rhees8) 	|[16](#/rheesNN16) 	| [32](#/rheesNN32)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumObs/estImSFNN_nObs8.png' style="width:37vw;" />  

<!--v-->
<!-- .slide: id="rheesBL8" data-transition="None" data-transition-speed="fast" -->

| [ground truth](#/rheesGT8)	| [low resolution](#/rheesNN8)	| <font color="yellow">bilinear</font> 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [4](#/rheesBL4) 	| [*8*](#/rhees8) 	|[16](#/rheesBL16) 	| [32](#/rheesBL32)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumObs/estImMFBL_nObs8_shift.png' style="width:37vw;" /> 

<!--v-->
<!-- .slide: id="rheesGT16" data-transition="None" data-transition-speed="fast" -->

| <font color="yellow">ground truth</font>	| [low resolution](#/rheesNN16)	| [bilinear](#/rheesBL16) 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [4](#/rheesGT4) 	| [8](#/rheesGT8) 	|[*16*](#/rhees16) 	| [32](#/rheesGT32)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumObs/imGT.png' style="width:37vw;" />  

<!--v-->
<!-- .slide: id="rheesNN16" data-transition="None" data-transition-speed="fast" -->

| [ground truth](#/rheesGT16)	| <font color="yellow">low resolution</font>	| [bilinear](#/rheesBL16) 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [4](#/rheesNN4) 	| [8](#/rheesNN8) 	|[*16*](#/rhees16) 	| [32](#/rheesNN32)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumObs/estImSFNN_nObs16.png' style="width:37vw;" />  

<!--v-->
<!-- .slide: id="rheesBL16" data-transition="None" data-transition-speed="fast" -->

| [ground truth](#/rheesGT16)	| [low resolution](#/rheesNN16)	| <font color="yellow">bilinear</font> 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [4](#/rheesBL4) 	| [8](#/rheesBL8) 	|[*16*](#/rhees16) 	| [32](#/rheesBL32)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumObs/estImMFBL_nObs16_shift.png' style="width:37vw;" /> 

<!--v-->
<!-- .slide: id="rheesGT32" data-transition="None" data-transition-speed="fast" -->

| <font color="yellow">ground truth</font>	| [low resolution](#/rheesNN32)	| [bilinear](#/rheesBL32) 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [4](#/rheesGT4) 	| [8](#/rheesGT8) 	|[16](#/rheesGT16) 	| [*32*](#/rhees32)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumObs/imGT.png' style="width:37vw;" />  

<!--v-->
<!-- .slide: id="rheesNN32" data-transition="None" data-transition-speed="fast" -->

| [ground truth](#/rheesGT32)	| <font color="yellow">low resolution</font>	| [bilinear](#/rheesBL32) 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [4](#/rheesNN4) 	| [8](#/rheesNN8) 	|[16](#/rheesNN16) 	| [*32*](#/rhees32)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumObs/estImSFNN_nObs32.png' style="width:37vw;" />  

<!--v-->
<!-- .slide: id="rheesBL32" data-transition="None" data-transition-speed="fast" -->

| [ground truth](#/rheesGT32)	| [low resolution](#/rheesNN32)	| <font color="yellow">bilinear</font> 	| 	
|:------------:	|:--:	|:--:	|

| # Iterations: 	| [4](#/rheesBL4) 	| [8](#/rheesBL8) 	|[16](#/rheesBL16) 	| [*32*](#/rhees32)	|
|:------------:	|:--:	|:--:	|:---:	|:---:	|

<img src='static/pocsVsNumObs/estImMFBL_nObs32_shift.png' style="width:37vw;" /> 

<!--s-->
<!-- .slide: class="banner" -->
<!-- .slide: data-background-image="static/pocsVsMagFactor/imHR_GT.png" data-background-repeat="repeat" data-background-size="45%"  data-background-opacity="0.15"-->
# Results
## Magnification Factor

<!--s-->

# Results
## Video Sequence

<!--v-->

<!-- .slide: data-state="textonvideo" data-background-video="static/Book_case1_small.avi" -->

<!--s-->

# Conclusion

* POCS approach is appealing for its relative simplicity and guaranteed convergence <!-- .element: class="fragment" -->
* More observations results in: <!-- .element: class="fragment" --> 
    *  slower processing <!-- .element: class="fragment" --> 
    *  slower convergence <!-- .element: class="fragment" --> 
    *  not necessarily result in better reconstruction <!-- .element: class="fragment" --> 
* Limitations exist even when motion and PSF are known exactly <!-- .element: class="fragment" -->
* Edge artifacts are very pronounced when motion is not known exactly <!-- .element: class="fragment" -->
* Improvements to POCS: <!-- .element: class="fragment" -->
    * Adaptive edge psf (such as bilateral filter) <!-- .element: class="fragment" -->
    * Better initial guess <!-- .element: class="fragment" -->
