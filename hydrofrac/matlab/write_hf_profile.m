function write_hf_profile(name,hf,verbose,endian)

% write_hf_profile(name,hf,verbose,endian)
%               name : name of the file
%                 hf : hydrofrac struct containing xm,xp,w0p,w0m,normal
% verbose (optional) : display messages (on/off)
%  endian (optional) : endian

% Write hydraulic profile to file 
% The following three files are created:
% [name]_fluid.geom : wall position for upper wall and lower wall. 
% todo: ?
% [name]_solid_w0p.geom : wall position for upper wall. 
% [name]_solid_w0m.geom : wall position for lower wall. 
% Files denoted by 'fluid' are loaded in the hydrofrac section of the fdmap
% input file using w0pfile or w0mfile.
% Files denoted by 'solid' are loaded in the block section of the fdmap input
% file.


  if nargin<4,verbose = true; endian = 'n'; end
  
  prec = 'real*8';
  
  fid = fopen([name],'w',endian);
  fwrite(fid,hf.w0m,prec);
  fwrite(fid,hf.w0p,prec);
  fwrite(fid,hf.dw0mdx,prec);
  fwrite(fid,hf.dw0pdx,prec);
  fclose(fid);

  if(verbose) 
      disp(['Wrote geometry file: '  name ]);
  end

end
