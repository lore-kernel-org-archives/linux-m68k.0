From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] m68k RTC fixes
Date: Tue, 3 May 2016 16:07:05 +0200
Message-ID: <CAMuHMdVmfMbnNpUGvdVWa4fxOZjN5Dip0coaikUanCgdH+8fqw__22254.5830336914$1462284453$gmane$org@mail.gmail.com>
References: <1462178783-29294-1-git-send-email-geert@linux-m68k.org>
	<20160503134034.GK2335@piout.net>
	<1708606.ou3btFVZ5o@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1708606.ou3btFVZ5o@wuerfel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Alessandro Zummo <a.zummo@towertech.it>, RTCLINUX <rtc-linux@googlegroups.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 3, 2016 at 3:49 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 03 May 2016 15:40:34 Alexandre Belloni wrote:
>> > Queue strategy:
>> >   1. These are queued together with Arnd's series,
>> >   1. I queue them for v4.7 myself, but then the RTC tree must be mergest
>> >      after the m68k tree,
>> >   2. I queue them for v4.6.
>> >
>> > As I currently don't have any m68k patches queued for v4.7, perhaps it's
>> > easiest if these are included with Arnd's series?
>> >
>>
>> I suggest you take them for 4.7 anyway. I don't think I am confident
>> enough to merge Arnd's series for 4.7. Also, I doubt I'll get many acks
>> from some architecture maintainers.
>>
>> So, my plan is to apply it on top of 4.7-rc1 and let it sit in
>> linux-next for a while.
>
> Good idea. It's getting a bit late for 4.7 now, and there is nothing
> urgent in my series.

OK, I've applied the m68k preparatory fixes and pushed them out.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
