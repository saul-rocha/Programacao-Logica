/*passe como parametro as iniciais (km,m,cm,mm) das unidades para sererm convertidas

ex:.
converter(cm,m,100).
converter(km,m,100).
converte(m,mm,100).
etc etc.
*/

converter('km','m',Valor):- Res is (Valor * 1000),
			    write(Res),
			    write(' m'),!.

converter('km','cm',Valor):- Res is (Valor * 100000),
			     write(Res),
			     write(' cm'),!.

converter('km','mm',Valor):- Res is (Valor * 1000000),
			     write(Res),
			     write(' mm'),!.

converter('cm','km',Valor):- Res is (Valor / 100000),
			     write(Res),
			     write(' km'),!.

converter('cm','m',Valor):- Res is (Valor / 100),
			     write(Res),
			     write(' m'),!.
converter('cm','mm',Valor):- Res is (Valor * 10),
			     write(Res),
			     write(' mm'),!.

converter('mm','km',Valor):- Res is (Valor / 1000000),
			     write(Res),
			     write(' km'),!.

converter('mm','m',Valor):- Res is (Valor / 1000),
			     write(Res),
			     write(' m'),!.

converter('mm','cm',Valor):- Res is (Valor / 10),
			     write(Res),
			     write(' cm'),!.

converter('m','km',Valor):- Res is (Valor / 1000),
			     write(Res),
			     write(' km'),!.

converter('m','cm',Valor):- Res is (Valor * 100),
			     write(Res),
			     write(' cm'),!.

converter('m','cm',Valor):- Res is (Valor * 1000),
			     write(Res),
			     write(' mm'),!.