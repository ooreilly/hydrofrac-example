function write_profile(name,x,y,n,verbose,endian)
% write_profile(name,x,y,n,verbose,endian)
% Write boundary curve file.
% x,y : coordinates
% n : unit normal evaluated at each coordinate
% n(:,1) : x-component
% n(:,2) : y-component
% verbose (optional) : display messages (on/off)
% endian (optional) : endian

  if nargin<5,verbose = true; endian = 'n'; end
  
  prec = 'real*8';
  
  fid = fopen(name,'w',endian);
  fwrite(fid,x,prec);
  fwrite(fid,y,prec);
  fwrite(fid,n(:,1),prec);
  fwrite(fid,n(:,2),prec);
  fclose(fid);
  

  if(verbose) 
      disp(['Wrote curve file: '  name ]);
  end

end
