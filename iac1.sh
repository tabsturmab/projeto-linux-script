#!/bin/bash

echo "Criando diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários..."

useradd andre -m -s /bin/bash -p $(openssl passwd -crypt Senha789) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -crypt Senha789) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt Senha789) -G GRP_ADM

useradd mayara -m -s /bin/bash -p $(openssl passwd -crypt Senha789) -G GRP_VEN
useradd felipe -m -s /bin/bash -p $(openssl passwd -crypt Senha789) -G GRP_VEN
useradd aline -m -s /bin/bash -p $(openssl passwd -crypt Senha789) -G GRP_VEN

useradd marco -m -s /bin/bash -p $(openssl passwd -crypt Senha789) -G GRP_SEC
useradd paula -m -s /bin/bash -p $(openssl passwd -crypt Senha789) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt Senha789) -G GRP_SEC

echo "Especificando permissões dos diretórios...."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Finalizado"

