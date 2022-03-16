#!/usr/bin/python3

# trace generated using paraview version 5.7.0

import sys
import os
import glob

#import and install missing packages
try:
  from natsort import natsorted
except ImportError:
  print("Trying to Install required module: natsort\n")
  os.system('python3 -m pip install natsort')
# -- above lines try to install requests module if not present
# -- if all went well, import required module again ( for global access)

from natsort import natsorted

#get current working directory and VTK files in cwd
cwd = os.getcwd()
vtkfiles=sorted(sys.argv[2:])
vtkfiles=natsorted(vtkfiles)

#get project name
projectname=sys.argv[1]

#### import the simple module from the paraview
from paraview.simple import *

#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# create a new 'Legacy VTK Reader'
time_ = LegacyVTKReader(registrationName='time_*', FileNames=vtkfiles)

# get animation scene
animationScene1 = GetAnimationScene()

# get the time-keeper
timeKeeper1 = GetTimeKeeper()

# update animation scene based on data timesteps
animationScene1.UpdateAnimationUsingDataTimeSteps()

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [907, 736]

# show data in view
time_Display = Show(time_, renderView1)

# get color transfer function/color map for 'CONC_C'
cONC_CLUT = GetColorTransferFunction('CONC_C')

# get opacity transfer function/opacity map for 'CONC_C'
cONC_CPWF = GetOpacityTransferFunction('CONC_C')

# trace defaults for the display properties.
time_Display.Representation = 'Slice'
time_Display.ColorArrayName = ['POINTS', 'CONC_C']
time_Display.LookupTable = cONC_CLUT
time_Display.OSPRayScaleArray = 'CONC_C'
time_Display.OSPRayScaleFunction = 'PiecewiseFunction'
time_Display.SelectOrientationVectors = 'CONC_A'
time_Display.ScaleFactor = 51.1
time_Display.SelectScaleArray = 'CONC_C'
time_Display.GlyphType = 'Arrow'
time_Display.GlyphTableIndexArray = 'CONC_C'
time_Display.GaussianRadius = 2.555
time_Display.SetScaleArray = ['POINTS', 'CONC_C']
time_Display.ScaleTransferFunction = 'PiecewiseFunction'
time_Display.OpacityArray = ['POINTS', 'CONC_C']
time_Display.OpacityTransferFunction = 'PiecewiseFunction'
time_Display.DataAxesGrid = 'GridAxesRepresentation'
time_Display.PolarAxes = 'PolarAxesRepresentation'
time_Display.ScalarOpacityUnitDistance = 11.306338002762537
time_Display.ScalarOpacityFunction = cONC_CPWF
time_Display.IsosurfaceValues = [0.10000000149011612]

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
time_Display.ScaleTransferFunction.Points = [0.09000000357627869, 0.0, 0.5, 0.0, 0.10999999940395355, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
time_Display.OpacityTransferFunction.Points = [0.09000000357627869, 0.0, 0.5, 0.0, 0.10999999940395355, 1.0, 0.5, 0.0]

# reset view to fit data
renderView1.ResetCamera()

#changing interaction mode based on data extents
renderView1.InteractionMode = '2D'
renderView1.CameraPosition = [255.5, 255.5, 10000.0]
renderView1.CameraFocalPoint = [255.5, 255.5, 0.0]

# show color bar/color legend
time_Display.SetScalarBarVisibility(renderView1, True)

# update the view to ensure updated data information
renderView1.Update()

# hide color bar/color legend
time_Display.SetScalarBarVisibility(renderView1, False)

# Hide orientation axes
renderView1.OrientationAxesVisibility = 0

# set scalar coloring
ColorBy(time_Display, ('POINTS', 'PHASE_INDEX'))

# Hide the scalar bar for this color map if no visible data is colored by it.
HideScalarBarIfNotNeeded(cONC_CLUT, renderView1)

# rescale color and/or opacity maps used to include current data range
time_Display.RescaleTransferFunctionToDataRange(True, False)

# show color bar/color legend
time_Display.SetScalarBarVisibility(renderView1, True)

# get color transfer function/color map for 'PHASE_INDEX'
pHASE_INDEXLUT = GetColorTransferFunction('PHASE_INDEX')

# get opacity transfer function/opacity map for 'PHASE_INDEX'
pHASE_INDEXPWF = GetOpacityTransferFunction('PHASE_INDEX')

# hide color bar/color legend
time_Display.SetScalarBarVisibility(renderView1, False)

# current camera placement for renderView1
renderView1.InteractionMode = '2D'
renderView1.CameraPosition = [255.5, 255.5, 1396.0779626676965]
renderView1.CameraFocalPoint = [255.5, 255.5, 0.0]
renderView1.CameraParallelScale = 298.62112825316177

# save animation

if not os.path.exists('images'):
    os.makedirs('images')

SaveAnimation(cwd + '/images/'+projectname+'.png', renderView1, ImageResolution=[800, 800],
    TransparentBackground=1,
    FrameWindow=[0, 10], 
    # PNG options
    CompressionLevel='0',
    SuffixFormat='_%02d')
