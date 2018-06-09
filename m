From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v4 9/9] net-next: New ax88796 platform driver for Amiga
 X-Surf 100 Zorro board (m68k)
Date: Sun, 10 Jun 2018 08:09:33 +1200
Message-ID: <a8f015b8-fc74-63e9-42c2-8a3ef12e2553@gmail.com>
References: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
 <1524103526-12240-10-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdWsibY4h5zwBC4qs8ZLq_1-627qjpeDLGzVjaGjG_A4PA@mail.gmail.com>
 <643cf1a7-b91c-bda6-d5b0-52b7f84377e6@gmail.com>
 <56235.87.122.27.167.1528450090.webmail@webmail.zedat.fu-berlin.de>
 <8144eec6-7bc1-95e0-e762-8b5af1c18583@gmail.com>
 <16480.46.183.103.8.1528535711.webmail@webmail.zedat.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <16480.46.183.103.8.1528535711.webmail@webmail.zedat.fu-berlin.de>
Sender: netdev-owner@vger.kernel.org
To: Michael Karcher <michael.karcher@fu-berlin.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, netdev <netdev@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Finn Thain <fthain@telegraphics.com.au>, Florian Fainelli <f.fainelli@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Hi Michael,

Am 09.06.2018 um 21:15 schrieb Michael Karcher:
> Michael Schmitz schrieb:
>> Hi Michael,
>>> actually, the the block_input / block_output functions were the reason I
>>> included the lib8390.c file. Except for xs100_write / xs100_read, they
>>> are
>>> a verbatim copy from ax88796.c I'm not that enthusiastic about that idea
>>> anymore, but did not get around to improve it. I added a customization
>>> point to ax88796 for a custom block_input / block_output, because the
>>> 8390
>>> core already provides that customization point. What I really need is a
>>> customization point just for the 8390-remote-DMA-via-MMIO functions
>>> (i.e.
>>> xs100_write, xs100_read) instead of the whole block transfer core that
>>> also sets up the remote DMA engine and tries to re-initialize the card
>>> in
>>> case of unexplained problems.
>>
>> OK, so essentially change
>>
>>          if (ei_local->word16) {
>>                  ioread16_rep(nic_base + NE_DATAPORT, buf, count >> 1);
>>                  if (count & 0x01)
>>                          buf[count-1] = ei_inb(nic_base + NE_DATAPORT);
>>
>>          } else {
>>                  ioread8_rep(nic_base + NE_DATAPORT, buf, count);
>>          }
>>
>> to something like
>>
>>          if (ax->block_read) {
>> 		ax->block_read(dev, buf, count);
>> 	} else if (ei_local->word16) {
>>                  ioread16_rep(nic_base + NE_DATAPORT, buf, count >> 1);
>>                  if (count & 0x01)
>>                          buf[count-1] = ei_inb(nic_base + NE_DATAPORT);
>>
>>          } else {
>>                  ioread8_rep(nic_base + NE_DATAPORT, buf, count);
>>          }
>>
>> and populate ax->block_read() and ax_block_write() from platform data,
>> instead of substituting ax_block_input() / ax_block_output() wholesale?
>
> That's basically how I think the whole lib8390.c story should in fact be
> tackled. Less code duplication, no second include of lib8390 and constrain
> xsurf100.c to the pieces that make this piece of hardware unique.

OK, I'll try that.

>> I must be missing something here.
>
> I don't think so.
>
>> Adds one test for
>> ax->block_read on the critical path but we already have the test for
>> ei_local->word16 there. May need rearranging the tests so the majority
>> of ax88796 users isn't impacted.
> Rearranging sounds like a good idea. As I understand, the only valid
> rearrangement is putting it inside the 16-bit branch, because the xs100
> uses 16-bit transfers and needs the extra byte for odd counts. The code

Thanks, I missed that.

> checks word16 at the beginning of xs100_block_output for that. This has
> the advantage of not hurting users of the 8 bit interface, which might be
> the slowest users of the ax88796, but comes at the cost of not being able
> to customize the block_input/block_output for 8-bit users. As this "cost"
> is not a problem now (no one can customize block_input/block_output
> currently), lets put the block_read check into the word16 block. You might
> want to name the member block_read16 instead of just block_read to convey
> the information, that it is only used if word16 is set.

Fair enough - since any block_input/block_output function always needs 
to duplicate quite a bit of 8390 control code, this might be easier.

I'll have to ask Adrian to set up something for me to run speed tests on 
though, to see any eventual impact of these changes.

Cheers,

	Michael



>> Anyway, your code, your call.
> On the other hand: Your polishing, your call. Thank you for your work on
> gettting the code in good shape for merging.
>
> Kind regards,
>   Michael Karcher
>
