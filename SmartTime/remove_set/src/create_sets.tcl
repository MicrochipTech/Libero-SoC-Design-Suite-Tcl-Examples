# Creates a set of path (from {DFN1_0:CLK} to {DFN1_1:D) to be analyzed.
create_set -name {set1} -from {DFN1_0:CLK} -to {DFN1_1:D}

# Creates a set of path (from {AND2_0:A} to {DFN1_1:D) to be analyzed.
create_set -name {set2} -from {AND2_0:A} -to {DFN1_1:D}

# Creates a set of path (from {D} to {DFN1_0:D) to be analyzed.
create_set -name {set3} -from {D} -to {DFN1_0:D}
save


