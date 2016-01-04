# p-kraszewski Gentoo ovarlay

Misc fixes for `Gentoo` - mainly early access to Erlang and Elixir related tools.

* Upgraded `dev-lang/erlang` to 18.2.1
* Upgraded `dev-lang/elixir` to 1.2.0
* Upgraded `dev-util/rebar` to 2.6.1
* Initial port of `dev-util/rebar3` as beta-4

You may import it by creating file `/etc/portage/repos.conf/pkraszewski.conf` as follows:
```ini
[Pawel-Kraszewski-Private-Repo]
location = /PATH/ON/YOUR/DISK/TO/STORE/REPO/IN
masters = gentoo
sync-type = git
sync-uri = git://github.com/p-kraszewski/portage.git
auto-sync = yes
```
