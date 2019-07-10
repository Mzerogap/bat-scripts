::---------------------------------------------------------------------
:: Author                : Carlos S. 
:: Date                  : 5-1-19
:: Purpose               : removal of all old print queues utilizing the Canon ADV 5235/5240
:: Usage                 : must be run as user
:: Notes                 : ideal for push deployments

rundll32 printui.dll,PrintUIEntry /q /dn /n\\sfohyp01\Berkeley
rundll32 printui.dll,PrintUIEntry /q /dn /n\\sfohyp01\Emeryville
rundll32 printui.dll,PrintUIEntry /q /dn /n\\sfohyp01\Oakland
exit