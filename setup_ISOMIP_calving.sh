echo 'Beginning setup...'

cd ISOMIP_Calving/python_scripts

#Creating mosaic files using script
echo 'Creating mosaic files...'
./Create_mosaic.py -coupled_run -nx=240 -ny=40 -nz=36  -L=80.0 -W=480.0 
echo 'Creating mosaic files complete'

#Copying mosaic files to INPUT directory  (Files created by python script Create_mosaic)
cp output_files/atmos_mosaic_tile1Xland_mosaic_tile1.nc ../INPUT/
cp output_files/atmos_mosaic_tile1Xocean_mosaic_tile1.nc ../INPUT/
cp output_files/land_mosaic_tile1Xocean_mosaic_tile1.nc ../INPUT/
cp output_files/grid_spec.nc ../INPUT/
cp output_files/ocean_hgrid.nc ../INPUT/
cp output_files/ocean_mask.nc ../INPUT/
cp output_files/ocean_mosaic.nc ../INPUT/
cp output_files/ocean_topog.nc ../INPUT/
cp output_files/topog.nc ../INPUT/

#Creating iceberg and bond restart files, and ice shelf file
echo 'Creating iceberg restart files...'
./initialize_bergs_in_pattern.py -Make_icebergs_non_static_later=False -Run_plotting_subroutine=False
echo 'Creating iceberg restart files complete'

#Copying iceberg restarts and iceshelf file to INPUT directory  (Files created by python script initialize_bergs_in_pattern_Tech.py)
cp output_files/ISOMIP_icebergs.res.nc ../INPUT/icebergs.res.nc
cp output_files/ISOMIP_bonds_iceberg.res.nc ../INPUT/bonds_iceberg.res.nc
cp output_files/ISOMIP_Ice_Shelf_clipped.nc ../INPUT/isomip_ice_shelf1_clipped.nc

#Copying 3D_LAYER_WARM_TPY_IC.nc to INPUT
cp input_files/3D_LAYER_WARM_TPY_IC.nc ../INPUT/
cd ..
echo 'Setup complete!'
