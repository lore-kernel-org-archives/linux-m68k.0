From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [git pull] m68k updates for 3.16 (take 2)
Date: Sun, 13 Jul 2014 02:34:38 -0700
Message-ID: <20140713093438.GA3115@infradead.org>
References: <alpine.DEB.2.02.1407131105390.7520@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1407131105390.7520@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Sun, Jul 13, 2014 at 11:08:07AM +0200, Geert Uytterhoeven wrote:
>       m68k: Fix boot regression on machines with RAM at non-zero
>       m68k: Export mach_random_get_entropy to modules

What modular user of random_get_entropy is this for?  Can't find one in
the current tree, and I don't really think this is something that should
be exported either.
