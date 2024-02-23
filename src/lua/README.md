# Lua API

Lua scripting is the primary way to extend Inbucket's server-side functionality.
Lua event handling functions can react to incoming messages, or alter the way
Inbucket processes them.

<div class="warning">

Lua scripting support is new for Inbucket version 3.1.

We will work to avoid breaking changes, but given the API is incomplete, that
may be unavoidable.

</div>

At startup, Inbucket will attempt to read the file `inbucket.lua` from the
current directory. The `INBUCKET_LUA_PATH` environment variable may be used to
override both the path and script filename.
