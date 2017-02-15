From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/3] ata: add m68k/Atari Falcon PATA support
Date: Wed, 15 Feb 2017 09:45:53 +0100
Message-ID: <CAMuHMdWX-PT_8a==rqAvc5Hx_1PNWPwvLGPeERUXvsMcEarziQ__38612.9452534535$1487148368$gmane$org@mail.gmail.com>
References: <CGME20161230140139epcas5p160eda5a6a77be084e21f12002c85cc2a@epcas5p1.samsung.com>
 <1483106478-1382-1-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1483106478-1382-1-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Tejun Heo <tj@kernel.org>, Michael Schmitz <schmitzmic@gmail.com>, "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jens Axboe <axboe@fb.com>

On Fri, Dec 30, 2016 at 3:01 PM, Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
> This patchset adds m68k/Atari Falcon PATA support to libata.
> The major difference in the new libata's pata_falcon host
> driver when compared to legacy IDE's falconide host driver is
> that we are using polled PIO mode and thus avoiding the need
> for STDMA locking magic altogether.
>
> Tested under ARAnyM emulator.
>
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
>
>
> Bartlomiej Zolnierkiewicz (3):
>   ata: allow subsystem to be used on m68k arch
>   ata: pass queued command to ->sff_data_xfer method
>   ata: add Atari Falcon PATA controller driver

drivers/ata/pata_falcon.c:57:18: error: 'struct request' has no member
named 'cmd_type'
drivers/ata/pata_falcon.c:57:32: error: 'REQ_TYPE_FS' undeclared
(first use in this function)

http://kisskb.ellerman.id.au/kisskb/buildresult/12936876/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
