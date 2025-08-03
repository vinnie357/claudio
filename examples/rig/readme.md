# (war)rig 

rig is a command line interface written in rust as a client to the Max api.

`rig login`

rig communicates to max using websockets to phoenix channels after authenticating with a api token exchange to max.

`rig create network`

rig creates a user network on max that allows new applications to run there
the network name becomes the sub domain in network.domain.example
if no name is passed, max assigns one, network names are unqiue

`rig create app`

rig manages apps on max, the apps relate to a network
the app name becomes the hostname in app.network.domain.example

`rig create var`

rig can create or update environment variable sets related to an app the context are not considered sensitive

`rig create secret`

rig can create or update a secret value presented to a related app as an environment variable the contents are considered sensitive 

`rig deploy`

rig bundles up local source code into an archive to upload to max
the command can refrence an existing app or create a new one

`rig status app`

rig displays the status of an application

`rig status network`

rig displays the status of a network

`rig status dashboard`

rig displays the status of all the users apps

`rig logs app`
 
rig displays the logs for a particular app, by default this live tails the logs in interactive mode, in -o json this returns the most recent events

`rig logs build app`

rig displays any logs for build tasks related to a particluar app
by default this live tails the logs in interactive mode, in -o json this returns the most recent events

`rig logs network`

rig displays logs for a specific network 
by default this live tails the logs in interactive mode, in -o json this returns the most recent events

`rig shell`

rig creates a webssh connection to max for either an app instance or the network controlplane

`rig command`
rig sends a shell command to max that is executed on an app and returns the output to rig

`rig details`
rig requests the configuration details of an app or network


## outputs
the default output is interactive, but a -o json makes rig return json formatted responses so users can use rig in scripting

## name constraints
names should be compatible with rfc1035

https://www.ietf.org/rfc/rfc1035.txt

app network, become app.network , host.subdomain

app names are unqiue for each network
networks are unique in the system



