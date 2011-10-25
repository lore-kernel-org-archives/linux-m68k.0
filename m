From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [git pull] m68k updates for 3.2
Date: Tue, 25 Oct 2011 09:38:15 +0200
Message-ID: <CA+55aFxK-OJXDNsJ37wSN+MGhGp-j50BX-52eEjBHVSepTTm9w__15783.5488477305$1319528343$gmane$org@mail.gmail.com>
References: <alpine.DEB.2.00.1110242118500.9114@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1110242118500.9114@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, Greg Ungerer <gerg@snapgear.com>, Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Mon, Oct 24, 2011 at 9:26 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> =A0git://git.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.gi=
t for-linus

Please fix your pull script. There's an extraneous ":" there. Spot it?

Also, while I see these commits in linux-next, I also see that they
have been rebased in the last day, which means that looking for them
in linux-next is actually much harder than they need to be.

In other words - WHY DID YOU REBASE? It just generates more work for
me, and adds absolutely zero value.

I pulled it, but some of the silly details annoyed me.

             Linus
