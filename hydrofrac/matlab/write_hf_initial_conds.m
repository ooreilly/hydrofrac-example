function write_hf_initial_conds(name,hf,verbose,endian)

% write_hf_profile(name,hf,verbose,endian)
%               name : name of the file
%                 hf : hydrofrac struct containing v,u,p
% verbose (optional) : display messages (on/off)
%  endian (optional) : endian

% Write nonuniform initial conditions to file
% The following file is created:
% [name]_fluid.ic : contains initial conditions for v,u,p


  if nargin<4,verbose = true; endian = 'n'; end
  
  prec = 'real*8';
  
  fid = fopen([name '.ic' ],'w',endian);

  for i=1:size(hf.v,1)
    fwrite(fid,hf.v(i,:),prec);
  end
  fwrite(fid,hf.u,prec);
  fwrite(fid,hf.p,prec);
  fclose(fid);

  if(verbose) 
      disp(['Wrote initial conditions file: '  name '.ic' ]);
  end

end
