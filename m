From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: remove six unused headers
Date: Tue, 12 Jun 2012 16:06:33 +1000
Message-ID: <4FD6DC69.2090008@snapgear.com>
References: <1339059427.25798.3.camel@x61.thuisdomein> <4FD19B29.4050904@snapgear.com> <CAMuHMdXisLvXAPbbkuYsYH2UZ_DJSyEhKZOL6_4qwuwLzFcEoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXisLvXAPbbkuYsYH2UZ_DJSyEhKZOL6_4qwuwLzFcEoQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Bolle <pebolle@tiscali.nl>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Geert,

On 10/06/12 18:40, Geert Uytterhoeven wrote:
> On Fri, Jun 8, 2012 at 8:26 AM, Greg Ungerer<gerg@snapgear.com>  wrote:
>> On 07/06/12 18:57, Paul Bolle wrote:
>>> There are six entirely unused headers in arch/m68k/include/asm. Nothing
>>> includes these headers. And a few tests found no hits for the things
>>> they provide (which makes sense).
>>>
>>> MC68332.h, mac_mouse.h, mcfmbus.h, and mcfne.h are all unused since at
>>> least v2.6.12-rc2 (I didn't bother looking further back than that).
>>
>>
>> Although mcfne.h has been unused for a while I am working on some patches
>> that do use it. No problem for the others.
>
> If I'm not mistaken, that should become mcf8390.h, as "NE2000" means
> "NE2000-compatible 8390-based Ethernet"? Cfr. the mac8390 and zorro8390
> discussions in the previous millennium.

I guess I missed those :-(
I think I see from the code for those under ~/drivers/net/ethernet/8390/
what this may have been about though.

Interestingly one of the ColdFire platforms (the Arnewsh 5206 board)
really did have an ISA NE2000 card fitted to it. Most of the follow
ons that where similar use a Davicom/9000.

I'll modify my work a little to follow the other examples.

Thanks
Greg



------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
