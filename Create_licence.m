function Create_licence();

%% Programme de creation de licence pour SimuDem
[FileName,PathName]=uigetfile('*.txt','Donn�es pour cr�er la licence');

fid = fopen([PathName '/' FileName],'r');
DataLicence.Bios = fget(fid);
DataLicence.CarteMere = fget(fid);
DataLicence.DisqueDur = fget(fid);
DataLicence.Hostname = fget(fid);
DataLicence.UserName = fget(fid);
fclose(fid);

Word_Key = 