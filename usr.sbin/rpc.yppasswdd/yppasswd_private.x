/*
 * Copyright (c) 1995, 1996
 *	Bill Paul <wpaul@ctr.columbia.edu>.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *	This product includes software developed by Bill Paul.
 * 4. Neither the name of the author nor the names of any co-contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY Bill Paul AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL Bill Paul OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 *	$Id: yppasswd_private.x,v 1.1.1.1 1996/02/12 15:09:01 wpaul Exp $
 */

#ifndef RPC_HDR
%#ifndef lint
%static const char rcsid[] = "$Id: yppasswd_private.x,v 1.1.1.1 1996/02/12 15:09:01 wpaul Exp $";
%#endif /* not lint */
#endif

/*
 * This protocol definition file is only used to
 * generate some XDR functions. We don't actually
 * define any RPC services here.
 */

struct x_master_passwd {
	string pw_name<>;	/* username */
	string pw_passwd<>;	/* encrypted password */
	int pw_uid;		/* user id */
	int pw_gid;		/* group id */
	unsigned long pw_change;/* password change time */
	string pw_class<>;	/* user access class */
	string pw_gecos<>;	/* in real life name */
	string pw_dir<>;	/* home directory */
	string pw_shell<>;	/* default shell */
	unsigned long pw_expire;/* account expiration */
	unsigned long pw_fields;/* internal: fields filled in */
};

const _YPMAXDOMAIN = 64;

struct master_yppasswd {
	string oldpass<>;		/* unencrypted old password */
	string domain<_YPMAXDOMAIN>;	/* domain we want to operate on */
	x_master_passwd newpw;		/* new passwd entry */
};
