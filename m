From: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 13/35] Disintegrate asm/system.h for M68K [ver #2]
Date: Mon, 19 Mar 2012 10:49:01 +0000
Message-ID: <4774.1332154141@redhat.com>
References: <4F6698C1.3070105@snapgear.com> <4F608A15.9030609@snapgear.com> <20120312233602.13888.27659.stgit@warthog.procyon.org.uk> <20120312233816.13888.142.stgit@warthog.procyon.org.uk> <17434.1331905343@redhat.com>
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <4F6698C1.3070105@snapgear.com>
Sender: linux-arch-owner@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: dhowells@redhat.com, paul.gortmaker@windriver.com, hpa@zytor.com, torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, arnd@arndb.de, linux-m68k@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Greg Ungerer <gerg@snapgear.com> wrote:

> > How about if I insert the attached patch prior?
> 
> Yep, that fixes it. Builds on its own, and with the asm/system.h
> disintegration patch applied (and rejects fixed) as well.

Can I add your Acked-by to them?

David
