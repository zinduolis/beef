//
// Copyright (c) 2006-2025 Wade Alcorn - wade@bindshell.net
// Browser Exploitation Framework (BeEF) - https://beefproject.com
// See the file 'doc/COPYING' for copying permission
//

/**
 * Sometimes there are timing issues and looks like beef_init
 * is not called at all (always in cross-origin situations,
 * for example calling the hook with jquery getScript,
 * or sometimes with event handler injections).
 * 
 * To fix this, we call again beef_init after 1 second.
 * Cheers to John Wilander that discussed this bug with me at OWASP AppSec Research Greece
 * antisnatchor
 * @namespace beef.timeout
 */

 /**
  * @memberof beef.timeout 
  * @function setTimeout 
  */
setTimeout(beef_init, 1000);
