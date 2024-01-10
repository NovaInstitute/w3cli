# Create a package with convenience functions to use the
# w3 CLI from within R. Make Use system2 to call the CLI.
# here is the output of w3 --help:
# Usage
# $ w3 <command> [options]
#
# Available Commands
# login                Authenticate this agent with your email address to gain access to all capabilities that have been delegated to it.
# plan get             Displays plan given account is on
# account ls           List accounts this agent has been authorized to act on behalf of.
# up                   Store a file(s) to the service and register an upload.
# open                 Open CID on https://w3s.link
# ls                   List uploads in the current space
# rm                   Remove an upload from the uploads listing.
# whoami               Print information about the current agent.
# space create         Create a new w3 space
# space provision      Associating space with a billing account
# space add            Add a space to the agent.
# space ls             List spaces known to the agent
# space info           Show information about a space.
# space use            Set the current space in use by the agent
# coupon create
# delegation create    Create a delegation to the passed audience for the given abilities with the _current_ space as the resource.
# delegation ls        List delegations created by this agent for others.
# delegation revoke    Revoke a delegation by CID.
# proof add            Add a proof delegated to this agent.
# proof ls             List proofs of capabilities delegated to this agent.
# usage report         Display report of current space usage in bytes.
# can access claim     Claim delegated capabilities for the authorized account.
# can store add        Store a CAR file with the service.
# can store ls         List CAR files in the current space.
# can store rm         Remove a CAR shard from the store.
# can upload add       Register an upload - a DAG with the given root data CID that is stored in the given CAR shard(s), identified by CAR CIDs.
# can upload ls        List uploads in the current space.
# can upload rm        Remove an upload from the uploads listing.
# can filecoin info    Get filecoin information for given PieceCid.
# help                 Show help text
#
# For more info, run any command with the `--help` flag
# $ w3 login --help
# $ w3 plan get --help
#
# Options
# -v, --version    Displays current version
# -h, --help       Displays this message
#
# Examples
# $ w3 login user@example.com
# $ w3 up path/to/files

#' w3_login
#' @title w3_login
#' @description Authenticate this agent with your email address to gain access to all capabilities that have been delegated to it.
#' @param email Character. email address to authenticate with
#'
#' @return
#' @export
#'
#' @examples
#' w3login('user@mail.com')

w3_login <- function(email) {
  system2("w3", args = c("login", email))
}

