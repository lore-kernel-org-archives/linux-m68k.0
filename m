From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: mvme147 status
Date: Mon, 12 Sep 2016 09:43:48 +0200
Message-ID: <CAMuHMdUFxc_OBR8L84gbgNW8u0aArQNxMGf5P4mPSj56xQXeNQ@mail.gmail.com>
References: <20160911171618.GA13380@infradead.org> <CACz-3rgtA0pvSZV38ezRWAxDsgcEa_+_teQ3-1dvY4Cf22hfyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CACz-3rgtA0pvSZV38ezRWAxDsgcEa_+_teQ3-1dvY4Cf22hfyQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Kars de Jong <nacirrut@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Stephen N Chivers <schivers@csc.com.au>

Hi Kars, Christoph,

On Sun, Sep 11, 2016 at 7:49 PM, Kars de Jong <nacirrut@gmail.com> wrote:
> Op zondag 11 september 2016 heeft Christoph Hellwig <hch@infradead.org> het
> volgende geschreven:
>> do you know what the status of the mvme147 board support / SCSI driver
>> is?  The mvme147 scsi driver is one of the few remaining drivers still
>> using the scsi_module infrastructure thay I'd like to finally kill off.
>>
>> Unlike some other drivers it should be fairly trivial to convert, but
>> I'd like to first know if there is any point in investing that work.
>
> I still have some MVME147 hardware, but I haven't run anything more recent
> than 2.6 kernels on it. I doubt anyone is still using it.
>
> Are there still other users of the chipset driver?  Does CONFIG_MVME147

The wd33c93 chipset driver is also used on various Amigas and on SGI MIPS
systems. Those no longer use scsi_module, though (IIRC I converted most of
them in 2009).

> still build?

Of course it does ;-)

> I personally don't have a big issue with just killing the board support
> code, it can always be revived when needed.

Killing board support doesn't gain us that much...

Stephen, are you still using them?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
