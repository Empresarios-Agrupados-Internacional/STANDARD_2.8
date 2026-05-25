/*-----------------------------------------------------------------------------------------
 LIBRARY: THERMAL
 FILE: TH_material_prop_ref
 AUTHOR: 
 COMPANY: 
 DESCRIPTION: 
 CREATION DATE: 16/01/2025
-----------------------------------------------------------------------------------------*/
-- REFERENCES:
       /*  Materials Property References*/
       /*
                     -  Inconel 718 from Thermophysical properties of Inconel 718 alloy, A Sh Agazhanov et al 2019 J. Phys.: Conf. Ser. 1382 012175
                     -  Carbon/Epoxy from Measurements of Thermal Properties of Carbon/Epoxy and Glass/Epoxy using Modulated Temperature Differential Scanning Calorimetry, G. Kalogiannakis et al 2003 J. of Composite Materials, Vol. 38, No. 02/2004 
                     -  SiC from Measurements of Properties and Characteristics of SiC and SiC/SiC Composites, J. Lamon 2012 J. of Comprehensive Nuclear Materials, Vol. 2 
                     -  UO2 J.K. Fink, (2000) Thermophysical properties of uranium dioxide,Journal of Nuclear Materials,Volume 279, Issue 1, 2000, Pages 1-18,ISSN 0022-3115 
                     -  UC https://mooseframework.inl.gov/source/solidproperties/ThermalUCProperties.html 
                     -  Graphite IG 110 https://mooseframework.inl.gov/bison/source/materials/GraphiteMatrixThermal.html 
                     -  UN    Hayes, S. L., Thomas, J. K., and Peddicord, K. L. (1990)  “Material property correlations for uranium mononitride. I. Physical properties”, Journal of Nuclear Materials, vol. 171, no. 2, pp. 262–270, 
                              S.L. Hayes, J.K. Thomas, K.L. Peddicord, (1990) Material property correlations for uranium mononitride: IV. Thermodynamic properties, Journal of Nuclear Materials, Volume 171. 
                     -  ZrH   Thermophysical properties of ZrH m.Uno 2003 
                              B. Tsuchiya, J. Huang, K. Konashi, M. Teshigawara, M. Yamawaki. (2001) Thermophysical properties of zirconium hydride and uranium–zirconium hydride. Journal of Nuclear Materials. Volume 289, Issue 3. Pages 329-333. ISSN 0022-3115. 
                     -  ZrC   R. W. Harrison & W. E. Lee (2016) Processing and properties of ZrC, ZrN and ZrCN ceramics: a review, Advances in Applied Ceramics, 115:5, 294-307, DOI: 10.1179/1743676115Y.0000000061  
                              Zuckerman, J. J. (2009). Inorganic reactions and methods, formation of ceramics. John Wiley & Sons 
                     -  Be    Dai, Zhiwen & Wang, Chenglong & Zhang, Dalin & Tian, XI & Qiu, S.Z. & Su, Guanghui. (2020). Numerical simulation on thermal-hydraulic and thermoelectric characteristics of the TOPAZ-II reactor core. International Journal of Energy Research. 45 
                                                      NIST National Institute of Standards and Technology. Beryllium, (accessed October 25, 2023), https://webbook.nist.gov/cgi/inchi?ID=C7440417&Type=JANAFS&Table=on 
                     -  Zr1Nb Kolev, Nikolay. (2015). Multiphase Flow Dynamics 5. 10.1007/978-3-319-15156-4. 
                              Agazhanov, A. & Samoshkin, Dmitrii & Stankus, Sergei. (2021). Caloric and transport properties of zirconium alloy E-110 in a wide temperature range. Thermophysics and Aeromechanics. 28. 577-581. 
                     - BeO   Thermal conductivity of beryllium oxide from (1957), Ditmars, David A and Ginnings, Defoe C, J. Res. Natl Bur. Stand. 59, 93. 
                              Ming-dong Hou, Xiang-wen Zhou, Bing Liu (2022). Beryllium oxide utilized in nuclear reactors: Part I: Application history, thermal properties, mechanical properties, corrosion behavior and fabrication methods, Nuclear Engineering and Technology, Volume 54, Issue 12,Pages 4393-4411, ISSN 1738-5733, 
                     - W      Tao Meng, Kun Cheng, Fulong Zhao, Chenchao Xia, Sichao Tan, (2020) Computational flow and heat transfer design and analysis for 1/12 gas-cooled space nuclear reactor, Annals of Nuclear Energy, Volume 135 
                              Arblaster, J.. (2018). Thermodynamic Properties of Tungsten. Journal of Phase Equilibria and Diffusion. 39.  
                              Tao Meng, Kun Cheng, Fulong Zhao, Chenchao Xia, Sichao Tan, (2020) Computational flow and heat transfer design and analysis for 1/12 gas-cooled space nuclear reactor, Annals of Nuclear Energy, Volume 135 
                     - Mo     Kolev, Nikolay. (2015). Multiphase Flow Dynamics 5. 10.1007/978-3-319-15156-4. 
                     - Re     NIST National Institute of Standards and Technology. Rhenium, (accessed October 24, 2023), https://webbook.nist.gov/cgi/inchi/InChI%3D1S/Re 
                              Shabalin, Igor. (2014). Ultra-High Temperature Materials.  
                              R.W Powell, R.P Tye, Margaret J Woodman (1963), The thermal conductivity and electrical resistivity of rhenium, Journal of the Less Common Metals, Volume 5, Issue 1, Pages 49-56, ISSN 0022-5088. 
                     - MoRe   Tao Meng, Kun Cheng, Fulong Zhao, Chenchao Xia, Sichao Tan, (2020) Computational flow and heat transfer design and analysis for 1/12 gas-cooled space nuclear reactor, Annals of Nuclear Energy, Volume 135 
                     - B4C    Tsuneo Matsui, Yuji Arita, Keiji Naito, Hisashi Imai (1991). High temperature heat capacities and electrical conductivities of boron carbides. Journal of Nuclear Materials, Volume 186, Issue 1, Pages 7-12, ISSN 0022-3115, 
                              Perevislov, Sergey & Motaylo, Evgeniy & Novoselov, Evgeny & Nesmelov, Dmitriy. (2020). Thermal conductivity of SiC-B4C materials obtained by reaction-sintering method. IOP Conference Series: Materials Science and Engineering. 848. 012066.  
                              Rumble, J. (Ed.). (2017). CRC handbook of chemistry and physics. 
                     - B2O3   Kolev, Nikolay. (2015). Multiphase Flow Dynamics 5. 10.1007/978-3-319-15156-4.
                     - ZrCp   Milner, J. L., Karkos, P., & Bowers, J. J. (2024). Space Nuclear Propulsion (SNP) Material Property Handbook (No. SNP-HDBK-0008). National Aeronautics and Space Administration.
					 - LiH    Poeth, D. (2005). The Evaluation of Lithium Hydride for Use in a Space Nuclear Reactor Shield, Including a Historical Perspective (No. MDO-723-0048). Knolls Atomic Power Lab.(KAPL), Niskayuna, NY (United States).
			  */