From: Simon Horman <horms@verge.net.au>
Subject: Re: Preliminary kexec support for Linux/m68k
Date: Thu, 19 Sep 2013 14:00:37 -0700
Message-ID: <20130919210037.GG2918__11199.2522179664$1379634779$gmane$org@verge.net.au>
References: <1379412095-7213-1-git-send-email-geert@linux-m68k.org>
 <CAMuHMdW8y9_=LXQ1PXjFaPyq-nYTPe+FodE5hQh4P3QSdnP_dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdW8y9_=LXQ1PXjFaPyq-nYTPe+FodE5hQh4P3QSdnP_dg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Anton Blanchard <anton@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, kexec@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Sep 19, 2013 at 11:20:22AM +0200, Geert Uytterhoeven wrote:
> On Tue, Sep 17, 2013 at 12:01 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > This is a preliminary set of patches to add kexec support for m68k.
> 
> >   - [PATCH 1/3] m68k: Add preliminary kexec support
> >   - [PATCH 2/3] m68k: Add support to export bootinfo in procfs
> >   - [PATCH 3/3] [RFC] m68k: Add System RAM to /proc/iomem
> >
> > Notes:
> >   - The bootinfo is now saved and exported to /proc/bootinfo, so kexec-tools
> >     can read it and pass it (possibly after modification) to the new kernel.
> >     This is similar to /proc/atags on ARM.
> 
> >   - I based [PATCH 3/3] on the PowerPC version, but it's no longer needed as we
> >     now get this information from the bootinfo.
> >     Does anyone think this is nice to have anyway?
> 
> It seems kexec/kdump on ppc don't use /proc/iomem anymore, and only rely on
> /proc/device-tree these days?

I think thats entirely a matter for the m68k kernel maintainers to decide.
But my personal opinion is that it is nice not to add it if it isn't needed.
