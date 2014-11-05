From: =?UTF-8?Q?David_G=C3=A1lvez?= <dgalvez75@gmail.com>
Subject: Re: [PATCH v2 00/36] Fixes, cleanups and modernization for NCR5380 drivers
Date: Wed, 5 Nov 2014 08:56:29 +0100
Message-ID: <CAL4YKD5fqhZKZG3_cOTxasqTSdb5oC3g0aUKnnxzE3Q4MJyxGQ@mail.gmail.com>
References: <20141027052607.105914311@telegraphics.com.au>
	<5455C107.6040500@gmail.com>
	<alpine.LNX.2.00.1411021710210.27266@nippy.intranet>
	<5455E340.7080305@gmail.com>
	<CAOmrzkKVYBcznyEaUX7Ta9z3P+B9=BTSj3kCZTjx-euZ2gannQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-scsi-owner@vger.kernel.org>
In-Reply-To: <CAOmrzkKVYBcznyEaUX7Ta9z3P+B9=BTSj3kCZTjx-euZ2gannQ@mail.gmail.com>
Sender: linux-scsi-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, "James E.J. Bottomley" <JBottomley@parallels.com>, Sam Creasey <sammy@sammy.net>, scsi <linux-scsi@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

2014-11-05 0:36 GMT+01:00 Michael Schmitz <schmitzmic@gmail.com>:
> Hi Finn,
>
>
>> Thanks for testing.
>>
>> "No regressions over v1" means "no regressions", right?
>>
>>
>>
>> Well, what would I compare the driver performance to? With your patches to
>> sort out locking races, the driver is more stable than I've ever seen it in
>> years. That's a definite win. Big improvement over the driver in its current
>> state in m68k and mainstream (which locks up quite reliably with even
>> moderate concurrent IDE and SCSI I/O for me). No regression over v1 or
>> patches that you sent for me to test off-list.
>>
>> On the other hand, I've seen warnings about lost bytes (stuck in the DMA
>> fifo) for the first time _ever_ with the new driver - we've discussed that
>> at length, and it is still unclear why these happen. This is a known NCR5380
>> issue, and pretty much anything could have precipitated that. Must have
>> happened for other Falcon users before in the past, because the interrupt
>> handler explicitly checks for this condition.
>

Do you know about the Falcon's disturbance in the SDMA clock signal
hardware problem?
Most Falcons, specially those used in music studios, have a hardware
patch to fix this, it's normally called SCSI patch.

Some more info:

http://didierm.pagesperso-orange.fr/doc/eng/c_0a.htm
