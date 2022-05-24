# BH3Models
Modelling for Cloete et al BH3 Modeling paper
 

Julia notebooks, module definition files and other extra files are contained in the folder **apoptosis-master**
The reaction file, corresponding parameter file and the rate laws for each cell line is contained within cell line-specific folders within the folder **moduleDefinitionFiles**
Separate cell line model files were created for cell with and without the mutations considered in section 2.5

### INSTRUCTIONS FOR RUNNING MODEL FILES, OBTAINING DATA AND GENERATING THE FIGURES. ###

1. To generate the protein monomer and heterodimer expression profiles (Fig. 2 in the paper)
Load the Julia notebook, **Protein_expression.ipynb**. The data collected from the simulation run is imported into MatLab for plotting.

2. To generate the MOMP profile in response to changes in apoptotic signalling and BCL2 inhibitors (Fig. S1), run the Julia notebook **Averaged_model.ipynb**.

3. To generate the cell line-specific response to BCL2 inhibitors (Fig. S3), run the Julia notebook **Apoptosis_inhibition.ipynb**.

4.1 To generate the cell population response to BCL2 inhibitors (Figs. 3-5), run the Julia notebook **Cell_population.ipynb**.
4.2 **Cell_population.ipynb** is divided into subsections to run blocks of code individually. For example, to generate the response to BCL2 inhibitors when mutations are considered, intialise the run then run the blocks of code following the subheading _Cell line_+mutations.
4.3 To generate the molecular state of each cell population in response to BCL2 inhibitors (Figs. S4-S11), in **Cell_population.ipynb**, first set "numberOfCells=100", then in the third block of code following the subheading for each inhibitor uncomment the lines beginning with "allInitCond=zeros(length(syms)..." and "allInitCond[:,cellIndex]=sol[:,1]"

5 Synergy plots (Fig. 5b) were generated using synergy finder. The data files to generate those figs can be find in Apoptosis_modelFiles.
