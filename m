From: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
Subject: Re: [PATCH 1/3] Add support to broadcom 5222 PHY
Date: Thu, 23 Aug 2012 17:25:12 +0200
Message-ID: <CA+mBkFUzvcMLpSCMVuUfexOML5Nwoi45ZK=iS1gh2sRLR1mK_Q@mail.gmail.com>
References: <1345551531-15348-1-git-send-email-stany.marcel@novasys-ingenierie.com>
	<CAMuHMdUo5UPLtUhf6_GafMj_kEnM25k+XYszdwsGwkGyCUC6zw@mail.gmail.com>
	<5036234A.7060102@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <5036234A.7060102@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Thu, Aug 23, 2012 at 2:34 PM, Greg Ungerer <gerg@snapgear.com> wrote:
> Hi Stany,
>
>
> On 08/23/2012 08:47 PM, Geert Uytterhoeven wrote:
>>
>> On Tue, Aug 21, 2012 at 2:18 PM, Stany MARCEL
>> <stany.marcel@novasys-ingenierie.com> wrote:
>>>
>>> Signed-off-by: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
>>> ---
>>>
>>>   This driver is an adaption of the one given by freescale for kernel
>>> 2.6.25.
>>>
>>>   Tested with kernel 3.4.8 with arch/m68k backported from linux-m68k head
>>>   2 FEC configured with shared phy
>>>
>>>   drivers/net/phy/Kconfig        |    7 +-
>>>   drivers/net/phy/Makefile       |    1 +
>>>   drivers/net/phy/broadcom522x.c |  171
>>> ++++++++++++++++++++++++++++++++++++++++
>>
>>
>> This patch and "[PATCH 3/3] Add support to M54xx DMA FEC Driver" need to
>> go
>> through the netdev tree, or collect acks there.
>
>
> And patch 2/3 never made it to the linux-m68k list. Though I can see
> that it made it onto the linux-kernel list.
>
> I would suggest running them through checkpatch, there is a number of
> formating and the like issues that need cleaning up.
>
> Also you will want to break up patch 2. It is a bit large to be reviewed
> the way it is.
>
> Regards
> Greg

Hi Greg

I will rework my patches and resend them.

Regards,

Stany
