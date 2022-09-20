Minimalistic setup of pvpgn/d2gs/docker. I can't say whether this would work good for a real game server, I just wanted to play around w/ D2GS and this was the easiest setup I could get working. Still some bugs to work out.

### Steps

1. Update `.env` to point to your local IP. (think this is needed for the address_translation.conf stuff...)
2. `docker-compose build`
3. `docker run --rm -v $PWD/pvpgn/etc:/usr/local/pvpgn/etc pvpgn-pro:1.99.7.2.1 cp -vnpr /pvpgn/etc/pvpgn/ /usr/local/pvpgn/etc/`
4. `docker run --rm -v $PWD/pvpgn/var:/usr/local/pvpgn/var pvpgn-pro:1.99.7.2.1 cp -vnpr /pvpgn/var/pvpgn/ /usr/local/pvpgn/var/`
5. Run `./download.sh`. Copy D2 1.13c dlls/mpqs/exe to d2gs folder.
6. `docker-compose run`
