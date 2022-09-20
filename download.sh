# Downloads "most" of the dependencies for running.
#!/bin/bash

VERSION=1.13c

cd d2gs

curl -OL "http://cdn.pvpgn.pro/diablo2/${VERSION}/D2Client.dll"
curl -OL "http://cdn.pvpgn.pro/diablo2/${VERSION}/D2CMP.dll"
curl -OL "http://cdn.pvpgn.pro/diablo2/${VERSION}/D2Common.dll"
curl -OL "http://cdn.pvpgn.pro/diablo2/${VERSION}/D2Game.dll"
curl -OL "http://cdn.pvpgn.pro/diablo2/${VERSION}/D2gfx.dll"
curl -OL "http://cdn.pvpgn.pro/diablo2/${VERSION}/D2Lang.dll"
curl -OL "http://cdn.pvpgn.pro/diablo2/${VERSION}/D2MCPClient.dll"
curl -OL "http://cdn.pvpgn.pro/diablo2/${VERSION}/D2Net.dll"
curl -OL "http://cdn.pvpgn.pro/diablo2/${VERSION}/D2sound.dll"
curl -OL "http://cdn.pvpgn.pro/diablo2/${VERSION}/D2Win.dll"
curl -OL "http://cdn.pvpgn.pro/diablo2/${VERSION}/Fog.dll"
curl -OL "http://cdn.pvpgn.pro/diablo2/${VERSION}/Storm.dll"
curl -OL "http://cdn.pvpgn.pro/diablo2/${VERSION}/Patch_D2.mpq"
curl -OL "http://cdn.pvpgn.pro/diablo2/ijl11.dll"
curl -OL "http://cdn.pvpgn.pro/diablo2/d2speech.mpq"
curl -OL "http://cdn.pvpgn.pro/diablo2/d2data.mpq"
curl -OL "http://cdn.pvpgn.pro/diablo2/d2sfx.mpq"
curl -OL "http://cdn.pvpgn.pro/diablo2/d2exp.mpq"

curl -OL "https://raw.githubusercontent.com/pvpgn/pvpgn-magic-builder/master/module/include/d2gs/${VERSION}/D2GE.exe"
curl -OL "https://raw.githubusercontent.com/pvpgn/pvpgn-magic-builder/master/module/include/d2gs/${VERSION}/D2GS.exe"
curl -OL "https://raw.githubusercontent.com/pvpgn/pvpgn-magic-builder/master/module/include/d2gs/${VERSION}/d2gs.script"
curl -OL "https://raw.githubusercontent.com/pvpgn/pvpgn-magic-builder/master/module/include/d2gs/${VERSION}/d2server.dll"
curl -OL "https://raw.githubusercontent.com/pvpgn/pvpgn-magic-builder/master/module/include/d2gs/${VERSION}/d2server.ini"
curl -OL "https://raw.githubusercontent.com/pvpgn/pvpgn-magic-builder/master/module/include/d2gs/${VERSION}/d2warden.dll"
curl -OL "https://raw.githubusercontent.com/pvpgn/pvpgn-magic-builder/master/module/include/d2gs/${VERSION}/d2warden.ini"
curl -OL "https://raw.githubusercontent.com/pvpgn/pvpgn-magic-builder/master/module/include/d2gs/${VERSION}/README.txt"
curl -OL "https://raw.githubusercontent.com/pvpgn/pvpgn-magic-builder/master/module/include/d2gs/${VERSION}/filelist.txt"
curl -OL "https://raw.githubusercontent.com/pvpgn/pvpgn-magic-builder/master/module/include/d2gs/${VERSION}/ItemConfig.dat"

touch d2gs.log