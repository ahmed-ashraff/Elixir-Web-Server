<h1>
 <picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github.com/elixir-lang/elixir-lang.github.com/raw/main/images/logo/logo-dark.png">
  <img alt="Elixir logo" src="https://github.com/elixir-lang/elixir-lang.github.com/raw/main/images/logo/logo.png" width="200">
 </picture>
</h1>

# Installing Elixir: A Step-by-Step Guide


## **Step 1: Install Erlang**

Elixir runs on the Erlang Virtual Machine (VM), so the first step is to install Erlang on your Windows machine. Follow these steps:

1. Visit the official [_Erlang_](https://www.erlang.org/) website, _“_[_Download_](https://www.erlang.org/downloads.html)_”_ section:  
2. Choose the Windows installer based on your system architecture (32-bit or 64-bit).  
3. Run the installer and follow the on-screen instructions.  
4. After the installation is complete, you may need to add the Erlang binaries to your system’s PATH. To do this, find the installation directory (commonly _C:\Program Files\Erlang OTP\bin_) and add it to the PATH environment variable.

## **Step 2: Install Elixir**

Now that Erlang is installed, let’s proceed with installing Elixir:

1. Visit the official [_Elixir_](https://elixir-lang.org/) website, _“_[_Download_](https://elixir-lang.org/install.html#windows)_”_ section.  
3. Choose the Windows installer.  
4. Run the installer and follow the on-screen instructions.  
5. Similar to Erlang, you may need to add the Elixir binaries to your system’s PATH. Find the installation directory (commonly _C:\Program Files\Elixir\bin_) and add it to the PATH environment variable.
   
## **Step 3: Install mix tool**
This is a simple tool to automatically update the version number of an Elixir project in the `mix.exs`, commit the change and create and create a git tag based on the new version.

Check out [version_tasks](https://hex.pm/packages/version_tasks) for a more versatile solution.
## Installation

Although this tool can be set as a dependency in you mix projects, is is rather intended to be used as a globally available command line tool.

```shell
mix archive.install hex mix_version
```

   ## Usage

Call the command from within a mix project. With no options, you will be prompted for the new version number.

```shell
mix version [options]
```


#### Now you can open a new terminal and try to run:

```
$ iex -S mix run
Compiling 1 file (.ex)

00:39:56.784 [info] Accepting connections on port 8080

Erlang/OTP 26 [erts-14.2.2] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit:ns]

Interactive Elixir (1.16.1) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> 
```
#### Open a new terminal and connect to this server by `telnet [OPTION...] [HOST [PORT]]`:

```
$ telnet 127.0.0.1 8080
Compiling 1 file (.ex)

Trying 127.0.0.1...
Connected to 127.0.0.1.
Escape character is '^]'.
Ahmed
From Server: Ahmed
```

and type a message to send to the server and it will be respond like this and we DID IT.
