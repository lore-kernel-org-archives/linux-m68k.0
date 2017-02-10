From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: Fix typos in Coldfire 5272 DMA debug code
Date: Fri, 10 Feb 2017 14:04:09 +0100
Message-ID: <CAMuHMdVAAiyJe9X9DJgGGaojLQv8=2DmELQLKyFr_-WHE36pJQ__12853.7638498985$1486732370$gmane$org@mail.gmail.com>
References: <1486644269-7571-1-git-send-email-geert@linux-m68k.org> <cb83d128-5012-8902-1094-4f9a1d99c27d@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <cb83d128-5012-8902-1094-4f9a1d99c27d@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Greg,

On Fri, Feb 10, 2017 at 1:50 PM, Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 09/02/17 22:44, Geert Uytterhoeven wrote:
>> If DEBUG_DMA is defined:
>>
>>     include/asm/dma.h: In function =E2=80=98set_dma_mode=E2=80=99:
>>     include/asm/dma.h:392: error: =E2=80=98dmabp=E2=80=99 undeclared (fi=
rst use in this
>> function)
>>     include/asm/dma.h:392: error: (Each undeclared identifier is reporte=
d
>> only once
>>     include/asm/dma.h:392: error: for each function it appears in.)
>>     include/asm/dma.h: In function =E2=80=98set_dma_addr=E2=80=99:
>>     include/asm/dma.h:423: error: =E2=80=98dmawp=E2=80=99 undeclared (fi=
rst use in this
>> function)
>>
>> Reported-by: kbuild test robot <fengguang.wu@intel.com>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Acked-by: Greg Ungerer <gerg@linux-m68k.org>
>
> Ultimately I think that all the DEBUG_DMA could just be removed.
> There is only 4 cases of it, and it doesn't look particularly
> useful as-is.

I reworked it as part of "m68k/coldfire: Modernize printing of kernel
messages", but that needs an update for the received review comments.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
