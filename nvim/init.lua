local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("config.options")
require("lazy").setup("plugins")
require("config.keymap")
require("config.ui")
require("config.function")

-- [1] 	string? 	Short plugin url. Will be expanded using config.git.url_format
-- dir 	string? 	A directory pointing to a local plugin
-- url 	string? 	A custom git url where the plugin is hosted
-- name 	string? 	A custom name for the plugin used for the local plugin directory and as the display name
-- dev 	boolean? 	When true, a local plugin directory will be used instead. See config.dev
-- lazy 	boolean? 	When true, the plugin will only be loaded when needed. Lazy-loaded plugins are automatically loaded when their Lua modules are required, or when one of the lazy-loading handlers triggers
-- enabled 	boolean? or fun():boolean 	When false, or if the function returns false, then this plugin will not be included in the spec
-- cond 	boolean? or fun(LazyPlugin):boolean 	When false, or if the function returns false, then this plugin will not be loaded. Useful to disable some plugins in vscode, or firenvim for example.
-- dependencies 	LazySpec[] 	A list of plugin names or plugin specs that should be loaded when the plugin loads. Dependencies are always lazy-loaded unless specified otherwise. When specifying a name, make sure the plugin spec has been defined somewhere else.
-- init 	fun(LazyPlugin) 	init functions are always executed during startup
-- opts 	table or fun(LazyPlugin, opts:table) 	opts should be a table (will be merged with parent specs), return a table (replaces parent specs) or should change a table. The table will be passed to the Plugin.config() function. Setting this value will imply Plugin.config()
-- config 	fun(LazyPlugin, opts:table) or true 	config is executed when the plugin loads. The default implementation will automatically run require(MAIN).setup(opts). Lazy uses several heuristics to determine the plugin's MAIN module automatically based on the plugin's name. See also opts. To use the default implementation without opts set config to true.
-- main 	string? 	You can specify the main module to use for config() and opts(), in case it can not be determined automatically. See config()
-- build 	fun(LazyPlugin) or string or a list of build commands 	build is executed when a plugin is installed or updated. Before running build, a plugin is first loaded. If it's a string it will be ran as a shell command. When prefixed with : it is a Neovim command. You can also specify a list to executed multiple build commands. Some plugins provide their own build.lua which is automatically used by lazy. So no need to specify a build step for those plugins.
-- branch 	string? 	Branch of the repository
-- tag 	string? 	Tag of the repository
-- commit 	string? 	Commit of the repository
-- version 	string? or false to override the default 	Version to use from the repository. Full Semver ranges are supported
-- pin 	boolean? 	When true, this plugin will not be included in updates
-- submodules 	boolean? 	When false, git submodules will not be fetched. Defaults to true
-- event 	string? or string[] or fun(self:LazyPlugin, event:string[]):string[] 	Lazy-load on event. Events can be specified as BufEnter or with a pattern like BufEnter *.lua
-- cmd 	string? or string[] or fun(self:LazyPlugin, cmd:string[]):string[] 	Lazy-load on command
-- ft 	string? or string[] or fun(self:LazyPlugin, ft:string[]):string[] 	Lazy-load on filetype
-- keys 	string? or string[] or LazyKeys[] or fun(self:LazyPlugin, keys:string[]):(string | LazyKeys)[] 	Lazy-load on key mapping
-- module 	false? 	Do not automatically load this Lua module when it's required somewhere
-- priority 	number? 	Only useful for start plugins (lazy=false) to force loading certain plugins first. Default priority is 50. It's recommended to set this to a high number for colorschemes.
-- optional 	boolean? 	When a spec is tagged optional, it will only be included in the final spec, when the same plugin has been specified at least once somewhere else without optional. This is mainly useful for Neovim distros, to allow setting options on plugins that may/may not be part of the user's plugins
--
--

-- packer --> lazy
-- setup ➡️ init
-- requires arrow_right dependencies
-- as ➡️ name
-- opt arrow_right lazy
-- run arrow_right build
-- lock arrow_right pin
-- disable=true arrow_right enabled = false
-- tag='*' arrow_right version="*"
-- after information_source not needed for most use-cases. Use dependencies otherwise.
-- wants ℹ️ not needed for most use-cases. Use dependencies otherwise.
-- config don't support string type, use fun(LazyPlugin) instead.
-- module is auto-loaded. No need to specify
-- keys spec is different
-- rtp can be accomplished with: