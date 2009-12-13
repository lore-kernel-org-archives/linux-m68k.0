From: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH] Keys: KEYCTL_SESSION_TO_PARENT needs TIF_NOTIFY_RESUME architecture support
Date: Sun, 13 Dec 2009 22:36:16 +0000
Message-ID: <21796.1260743776@redhat.com>
References: <alpine.DEB.2.00.0912132013050.26173@ayla.of.borg>
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0912132013050.26173@ayla.of.borg>
Sender: linux-security-module-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Mike Frysinger <vapier@gentoo.org>, Chris Zankel <chris@zankel.net>, Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-security-module@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> +#warning TIF_NOTIFY_RESUME not implemented
> +	return -EOPNOTSUPP;

I wonder if it should printk() too.

David
