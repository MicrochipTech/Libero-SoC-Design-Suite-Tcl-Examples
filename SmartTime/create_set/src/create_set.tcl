# Creates a set (named "set1") of path (from {DFN1_0:CLK} to {DFN1_1:D}) to be analyzed.
create_set -name {set1} -from {DFN1_0:CLK} -to {DFN1_1:D}

# Creates a set (named "set2") of path (from {AND2_0:A} to {DFN1_1:D}) to be analyzed.
create_set -name {set2} -from {AND2_0:A} -to {DFN1_1:D}

# Creates a set (named "set3") of path (from {D} to {DFN1_1:D}) to be analyzed.
create_set -name {set3} -from {D} -to {DFN1_0:D}

# Save after "create_set" usage
save


