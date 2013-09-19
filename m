From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Preliminary kexec support for Linux/m68k
Date: Thu, 19 Sep 2013 11:20:22 +0200
Message-ID: <CAMuHMdW8y9_=LXQ1PXjFaPyq-nYTPe+FodE5hQh4P3QSdnP_dg__30037.7951273278$1379582443$gmane$org@mail.gmail.com>
References: <1379412095-7213-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1379412095-7213-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Anton Blanchard <anton@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, kexec@lists.infradead.org, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>

On Tue, Sep 17, 2013 at 12:01 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> This is a preliminary set of patches to add kexec support for m68k.

>   - [PATCH 1/3] m68k: Add preliminary kexec support
>   - [PATCH 2/3] m68k: Add support to export bootinfo in procfs
>   - [PATCH 3/3] [RFC] m68k: Add System RAM to /proc/iomem
>
> Notes:
>   - The bootinfo is now saved and exported to /proc/bootinfo, so kexec-tools
>     can read it and pass it (possibly after modification) to the new kernel.
>     This is similar to /proc/atags on ARM.

>   - I based [PATCH 3/3] on the PowerPC version, but it's no longer needed as we
>     now get this information from the bootinfo.
>     Does anyone think this is nice to have anyway?

It seems kexec/kdump on ppc don't use /proc/iomem anymore, and only rely on
/proc/device-tree these days?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
