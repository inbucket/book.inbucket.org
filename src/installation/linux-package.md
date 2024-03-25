# Linux Package Installation

## Obtain Package File

Inbucket releases are published on GitHub:
<https://github.com/inbucket/inbucket/releases>

For a Debian or Ubuntu based distribution, download the appropriate `.deb` file
for your CPU architecture.

If you are running a RedHat or Fedora based distribution, download the
appropriate `.rpm` file for your CPU architecture.

## Install Package

The commands below should be run as the `root` user.

### Debian

```sh
dpkg -i inbucket_VER_linux_amd64.deb
```

### RedHat

```sh
rpm -ivh inbucket_VER_linux_amd64.rpm
```

## Enable & Start Inbucket

As `root`, start the daemon and check for errors:

```sh
# Set the daemon to start at boot
systemctl enable inbucket

# Manually start the daemon
systemctl start inbucket

# Confirm Inbucket stayed running
systemctl status inbucket

# Check system logs for startup errors
journalctl -u inbucket
```

## Access Web Interface

Confirm that Inbucket is listening on the default port:
<http://localhost:9000/>.

## Customize Inbucket Configuration

Inbucket is configured via environment variables, please see [config.md] for
more information; or try our [Configurator] web app.  You'll need to modify the
`Environment=` statements in
`/etc/systemd/system/multi-user.target.wants/inbucket.service` for the
configuration changes to become permanent.

If something goes wrong, you may refer to the default [systemd unit] on GitHub.

[Configurator]: https://inbucket.org/configurator/
[config.md]:    https://github.com/inbucket/inbucket/blob/main/doc/config.md
[systemd unit]: https://github.com/inbucket/inbucket/blob/main/etc/linux/inbucket.service
