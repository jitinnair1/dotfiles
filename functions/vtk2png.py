#!/usr/bin/python3

# trace generated using paraview version 5.9.0

import sys
import os
import glob

#get current working directory and VTK files in cwd
cwd = os.getcwd()
vtkfiles=sorted(sys.argv[2:])

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

# update animation scene based on data timesteps
animationScene1.UpdateAnimationUsingDataTimeSteps()

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')

# show data in view
time_Display = Show(time_, renderView1, 'StructuredGridRepresentation')

# hide color bar/color legend
time_Display.SetScalarBarVisibility(renderView1, False)

# Hide orientation axes
renderView1.OrientationAxesVisibility = 0

# current camera placement for renderView1
renderView1.InteractionMode = '2D'
renderView1.CameraPosition = [127.5, 127.5, 696.6729559300638]
renderView1.CameraFocalPoint = [127.5, 127.5, 0.0]
renderView1.CameraParallelScale = 180.31222920256963

# save animation
if not os.path.exists('images'):
    os.makedirs('images')
SaveAnimation(cwd + '/images/'+projectname+'.png', renderView1, ImageResolution=[600, 600],
    OverrideColorPalette='WhiteBackground',
    TransparentBackground=1,
    FrameWindow=[0, 36], 
    # PNG options
    SuffixFormat='_%02d')