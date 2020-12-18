addpath('fdmap/matlab')

hf=init("hydrofrac", "simulation");

p = loadfast(hf, "I_p");

pcolored(p.p);
