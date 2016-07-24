From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v5 12/15] binfmt_flat: allow compressed flat binary format
 to work on MMU systems
Date: Sun, 24 Jul 2016 16:25:16 -0400 (EDT)
Message-ID: <alpine.LFD.2.20.1607241612480.1594@knanqh.ubzr>
References: <1469374229-21585-1-git-send-email-nicolas.pitre@linaro.org> <1469374229-21585-13-git-send-email-nicolas.pitre@linaro.org> <4262519.L4vdOGcrh0@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4262519.L4vdOGcrh0@wuerfel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>, linux-fsdevel@vger.kernel.org, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, linux-m68k@lists.linux-m68k.org, Alexander Viro <viro@zeniv.linux.org.uk>

On Sun, 24 Jul 2016, Arnd Bergmann wrote:

> On Sunday, July 24, 2016 11:30:26 AM CEST Nicolas Pitre wrote:
> > +#else
> > +                       /*
> > +                        * This is used on MMU systems mainly for testing.
> > +                        * Let's use a kernel buffer to simplify things.
> > +                        */
> > +                       long unz_text_len = text_len - sizeof(struct flat_hdr);
> > +                       long unz_len = unz_text_len + full_data;
> > +                       char *unz_data = vmalloc(unz_len);
> > +                       if (!unz_data) {
> > +                               result = -ENOMEM;
> > 
> 
> Is there a risk of a malicious user exhausting vmalloc space with a
> binary that has forged headers? If there is, maybe put an upper bound on
> the size of allocation.

Patch #3 enforces a cap on all parameters to avoid overflows and 
unreasonable section sizes.

Then vmalloc space is used here only for decompressing the binary into, 
after which the whole thing is copied to user space and the vmalloc area 
is freed right away.

> More broadly speaking, are there any other attacks that may get enabled
> through forged binaries? We've had a couple of vulnerabilities in
> binfmt_elf over the years, and I wonder how dangerous it might be
> if distros turn on binfmt_flat support by default.

That was Alan's concern too which prompted patch #3. But with a clamp on 
all parameters, everything else is done via user accessors.  So an 
executable still can crap onto itself or generate a segfault but I doubt 
we really care at that point.


Nicolas
