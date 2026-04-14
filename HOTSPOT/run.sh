#!/usr/bin/env bash

# Remove results from previous simulations
rm -f *.init
rm -f outputs/*

# Create outputs directory if it doesn't exist
mkdir outputs

# HotSpot's grid model is capable of modeling stacked 3-D chips. To be
# able to do that, one has to specify what is called the 'Layer
# Configuration File' (LCF). An LCF specifies the set of vertical layers
# to be modeled including its physical properties (thickness,
# conductivity etc.) and the floorplan of the die in that layer.

# Let us now look at an AgentX of how to model stacked 3-D chips. Let
# us use a simple, 3-block floorplan file 'floorplan1.flp' in addition to
# the more detailed original 'floorplan2.flp'. In the chip we will model, layer 0 is
# power dissipating silicon with a floorplan of 'floorplan1.flp', followed
# by a layer of non-dissipating (passive) TIM. This is then followed by
# another layer of active silicon with a floorplan of 'floorplan2.flp' and
# another layer of passive TIM. Such a layer configuration is described
# in 'AgentX.lcf'. Note that the floorplan files of all layers are specified
# in the LCF instead of via the command line
../../hotspot -c AgentX.config -p decode.ptrace -grid_layer_file AgentX.lcf -materials_file AgentX.materials -model_type grid -detailed_3D on -steady_file outputs/decode.steady -grid_steady_file outputs/decode.grid.steady

../../hotspot -c AgentX.config -p prefill.ptrace -grid_layer_file AgentX.lcf -materials_file AgentX.materials -model_type grid -detailed_3D on -steady_file outputs/prefill.steady -grid_steady_file outputs/prefill.grid.steady
