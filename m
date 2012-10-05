From: David Howells <dhowells@redhat.com>
Subject: Re: [GIT PULL] Disintegrate UAPI for m68k
Date: Fri, 05 Oct 2012 13:50:21 +0100
Message-ID: <7854.1349441421@warthog.procyon.org.uk>
References: <CAMuHMdWYdKPgVR8hvcXN1qmm7nqCyjWV3NPHzdVHG_H8F20-3w@mail.gmail.com> <17383.1349380286@warthog.procyon.org.uk>
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWYdKPgVR8hvcXN1qmm7nqCyjWV3NPHzdVHG_H8F20-3w@mail.gmail.com>
Sender: linux-arch-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dhowells@redhat.com, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> I assume these c6x and asm-generic changes are the ones you just asked Linus
> to pull?

Yes.

> Doesn't it make more sense to ask us (the individual arch maintainers) to
> pull our parts after Linus has pulled the generic part?

I suppose so.

> Do you want this ("our parts") to go in 3.7 or 3.8?

3.7 would be nice, but I know not everyone is willing to pull in this merge
window.  It might also make sense to wait for (a) Linus to pull those and (b)
Arnd to pass the asm-generic changes along too.

The main reason I'd like to get things moved along asap is that the
preparatory patches get things into a known state upon which these commits can
be pulled.  However, the state is going to degrade over time as people make
changes which requires more preparatory patches:-/

David
