function Create_licence();

%% Programme de creation de licence pour SimuDem
[FileName,PathName]=uigetfile('*.txt','Données pour créer la licence');

fid = fopen([PathName '/' FileName],'r');
DataLicence.Bios = fget(fid);
DataLicence.CarteMere = fget(fid);
DataLicence.DisqueDur = fget(fid);
DataLicence.Hostname = fget(fid);
DataLicence.UserName = fget(fid);
fclose(fid);

Word_Key = 