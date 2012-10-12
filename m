From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [GIT PULL] Disintegrate UAPI for m68k [ver #2]
Date: Fri, 12 Oct 2012 19:16:39 +0200
Message-ID: <CAMuHMdXYg+GGHwpYZmVff79SU_MhX+uiLtbmY5UH+BObiHvrXw@mail.gmail.com>
References: <21143.1349774135@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:48774 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932695Ab2JLRQl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 12 Oct 2012 13:16:41 -0400
In-Reply-To: <21143.1349774135@warthog.procyon.org.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 9, 2012 at 11:15 AM, David Howells <dhowells@redhat.com> wrote:
>  arch/m68k/include/asm/ptrace.h                 |  72 +----

This leaves the following empty construct:

    #ifdef CONFIG_COLDFIRE
    #else
    #endif

I'll remove it in a subsequent patch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
