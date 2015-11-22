From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/4] m68knommu: Add missing initialization of max_pfn and {min,max}_low_pfn
Date: Sun, 22 Nov 2015 11:38:08 +0100
Message-ID: <CAMuHMdWzJq5yrchmRSc3_W7-7VZ7zbvU4mwhzWDdjdXndr0mWw__15760.7891982936$1448188713$gmane$org@mail.gmail.com>
References: <1447585455-19671-1-git-send-email-geert@linux-m68k.org>
	<1447585455-19671-5-git-send-email-geert@linux-m68k.org>
	<564A6CA4.9000206@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <564A6CA4.9000206@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: Sam Creasey <sammy@sammy.net>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Linux-Arch <linux-arch@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Greg,

On Tue, Nov 17, 2015 at 12:54 AM, Greg Ungerer <gerg@uclinux.org> wrote:
> On 15/11/15 21:04, Geert Uytterhoeven wrote:
>> If max_pfn is not initialized, the block layer may use wrong DMA masks.
>>
>> Replace open-coded shifts by PFN_DOWN() while we're at it.
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Tested and working fine on m68knommu. So:
>
> Tested-By: Greg Ungerer <gerg@uclinux.org>
>
> If you respin this patch for any reason I wouldn't object
> to removing the "/* 0 on coldfire */" comment...

Thanks, done, applied, and queued for v4.4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
