@echo Habilitando Usuario Administrador ...
net user Administrador /active:yes
@echo Usuario Administrador Ativado com Sucesso.

@echo Mapeando unidades de rede
net use z: servidor\compartilhamento/persistent:yes
z:

pause
exit;
