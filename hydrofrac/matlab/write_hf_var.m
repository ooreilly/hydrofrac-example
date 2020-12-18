function write_hf_var(name,y,verbose,endian)

% write_hf_var(name,hf,verbose,endian)
%               name : name of the file
%                  y : grid point positions 
% verbose (optional) : display messages (on/off)
%  endian (optional) : endian

% Write variable grid spacing to file 
% The grid s


  if nargin<4,verbose = true; endian = 'n'; end
  
  prec = 'real*8';
  nx = length(y);
  h = 1/(nx-1);
  [Pinv D] = sbp_op(2,nx-1,h);

  assert(abs(min(y)) < 4*eps,'must have: min(y) = 0');
  assert(abs(max(y)-1) < 4*eps,'must have: max(y) = 1');
  dydeta =  D*y';
  dydetai =  1./dydeta;
  fid = fopen([name],'w',endian);
  fwrite(fid,dydetai,prec);
  fwrite(fid,y,prec);
  fclose(fid);

  if(verbose) 
      disp(['Wrote variable grid spacing file: '  name ]);
  end

end
