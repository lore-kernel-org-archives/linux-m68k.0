From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] Keys: KEYCTL_SESSION_TO_PARENT needs TIF_NOTIFY_RESUME
	architecture support
Date: Sun, 13 Dec 2009 20:49:42 -0500
Message-ID: <8bd0f97a0912131749j3fc1d539m8b65c960026d3535__17156.3239921399$1260755734$gmane$org@mail.gmail.com>
References: <alpine.DEB.2.00.0912132013050.26173@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0912132013050.26173@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Chris Zankel <chris@zankel.net>, Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-security-module@vger.kernel.org

On Sun, Dec 13, 2009 at 14:21, Geert Uytterhoeven wrote:
> As of commit ee18d64c1f632043a02e6f5ba5e045bb26a5465f ("KEYS: Add a keyctl to
> install a process's session keyring on its parent [try #6]"), CONFIG_KEYS=y
> fails to build on architectures that haven't implemented TIF_NOTIFY_RESUME yet:
>
> security/keys/keyctl.c: In function 'keyctl_session_to_parent':
> security/keys/keyctl.c:1312: error: 'TIF_NOTIFY_RESUME' undeclared (first use in this function)
> security/keys/keyctl.c:1312: error: (Each undeclared identifier is reported only once
> security/keys/keyctl.c:1312: error: for each function it appears in.)
>
> Make KEYCTL_SESSION_TO_PARENT depend on TIF_NOTIFY_RESUME until blackfin,
> m68k, and xtensa have implemented it.

i'll be pushing a patch for 2.6.32 to add notify support to Blackfin ;)

but othewise, Acked-by: Mike Frysinger <vapier@gentoo.org>
-mike
