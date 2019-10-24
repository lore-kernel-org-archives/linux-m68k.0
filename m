Return-Path: <SRS0=jZwo=YR=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2411DCA9EAF
	for <linux-m68k@archiver.kernel.org>; Thu, 24 Oct 2019 20:56:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF04C21929
	for <linux-m68k@archiver.kernel.org>; Thu, 24 Oct 2019 20:56:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbfJXU4u (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 24 Oct 2019 16:56:50 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:39771 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbfJXU4u (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Oct 2019 16:56:50 -0400
Received: from [172.27.42.23] ([92.116.126.230]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mzhar-1i2D8C12v3-00viVC for <linux-m68k@vger.kernel.org>; Thu, 24 Oct 2019
 22:56:49 +0200
To:     linux-m68k <linux-m68k@vger.kernel.org>
From:   Andreas 'count' Kotes 
        <count-vger.kernel.org+linux-m68k@flatline.de>
Subject: Amiga PCMCIA network card support
Openpgp: preference=signencrypt
Autocrypt: addr=count-vger.kernel.org+linux-m68k@flatline.de;
 prefer-encrypt=mutual; keydata=
 mQGiBDx7418RBADbLQ3BQDTV6IQE4gKU+0hq55+JVGOGiFws71xXbCiiQueMFj4b+AI9W5qp
 wz6BAFuJJAEzL4UWas2qm/LcMCKO5RSoeYuBZViEn3LCtQabETpN3CUzqOwPRJFjz8VgEI/q
 w6kh1MqC1pEDsdtZHHRAZfsmzBbJTKbPI+BzH7zbcwCgl764P77Vv9wILgZmRl76QvsgudsD
 /1tIVNkOvyEltKYqgIVv/F0M3bC9sonouUlsVJvFFEdbPxFaYIoLq4Ur66vlZFyuRfHFSvfP
 F91bRxYUVg/+mtHpn9N0wQ6eo7CGn3ZWaPoz0yhgQAv15HO5jrlqVCrRe9/CWq0KRhRPDFhX
 50XShcG/0unPPzmjJLij81fXorrcA/0fMSWCzZectQtpCd6InrsbXvPVOzmr6N2WpfEDLSdJ
 Bc5JgQ0NsA5ODhVFQ2J/qqVgMvJYcn/szvIsCxLWr6OHJIyNCO7TXuxtZhaR9Z+xwMTQ6FYL
 l70zY0feAA28c1yGZBfSg8hr0uJq25Khr/A8yjOoYwh4dwXeVOcEh6jy9LQpQW5kcmVhcyAn
 Q291bnQnIEtvdGVzIDxjb3VudEBmbGF0bGluZS5kZT6IaAQTEQoAIAULBwoDBAMVAwIDFgIB
 AheAAhkBBQJXHCz2BQkcgX0UABIHZUdQRwABAQkQ8dsojI+Uwig/IACdGqDU9uw4bvfsjXfH
 0MmsALhVp/kAn29XZAitNC1hyp90nfPeB3L69yr7
Message-ID: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de>
Date:   Thu, 24 Oct 2019 22:56:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Bi8GazLoIAZRnteOFZMxs1S8zKQkLm7LilRUpMkEnt/g0PqwbjE
 kh6Gmkskyxsds7WtGM7gUI0Mp7ZqVYNA4NXQ026v3aLfrgShdip8b9F6vR0BQWsIuxJY2Zc
 2XP/uSDd5eAhWvSE3nhXCgL31PeSjSobb7I+iANZhVKFX6lo086F2aKOu3kpHV7qa5V5dio
 wj0tiZrFS9KhtD8nbWY1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fq+jfAYMe70=:9zoDLmh6PwR/ts7xJX/7Mc
 9+g2gKrplYtW3uFCheNOnEtqM0eeFo6eU4/6Qy7mNGP3XC4oojIRywoZ//jszz9YbXPtFgPXx
 ZZsUwPA4KFyhUwljTl+6D6KRnMmBk7UO4DeKHy0ad4e3LpA4NW+hrb3j17SGcXZd8JZNHVgN7
 PaaZYehcSrMmlcAep1ZMyu4mjuRisr6O8t1+xLMS7Si35vAwsvNl259BsTmjedzpFKl1eEWU5
 gs8c3/EVF3j/QbkFCdBJi1Z4TnOHev4+xa6fYsvMttBOnPL7lYW/7e/fKydPfnxC/zj6xBn0B
 JyYCRgs01jrjtC9zDUhLxezt9e8fhKOx/h1ERylGZvqo/+UVTv7+X719urd/jB3vQ7l7ydg8N
 6NkShoOCms4uUInFnnanJecR1qnYtQTkFih7GdpRmuvzkspAUG10hRCYBmZ7nmzsXclmmOu02
 sePgYkf7eCHyblDk5d/2GXnbyYU4avY4lLTx7xA5bk7kvGdwShWMGR5CvljmRwkHguYnMns1c
 7VXbicX1OOzhYan1TJgL/qZTFjWqH8jAG6l1anEiKdNx7eEdBab2wARjFwfsQj4pqQly2Qyhm
 N8PF57UT0DgbOT0jc3bLgNHvbagh7MEAKYgS/CiwdeLlOlQzTj/yOw7QoIopJ+gnasHWF1Efd
 nhDVfjkFv0hv60ywrq0t8PJaT74gG+54YSqRsnDvtHTsfsZjmE4n5sGHmmkqMGPPDTzN8poat
 hBg7mGFKc+95t5BXmRkvU61o6SdZ/4Fjp0IDpjp7zO4EgQ8CiwklqVs/2iHx0IUWzKMHTJ1FQ
 lp7M5zNlO6tu3v8zVNlIxZ1m2975f945/CtAoPtOdkKywjYPjMFASwKEhPY0ZiZZPSxLqJ7YV
 yg00w/+H6pyy9CtQMxdmMRw5oFimCqMwFkA7+t9nUWHhAiZXFjGClQpWq1qmWw
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hello dear list,

I'm new to the party, so please bear with my with stupid questions and
infractions on policy or anything else - I'm willing to learn, and am
receptive to change, please just poke me if needed :)

Replying to a somewhat older (but not too old) mail:

On Fri, 21 Dec 2018, Michael Schmitz wrote:
>+if APNE
>+config APNE100MBIT
>+	bool "PCMCIA NE2000 100MBit support"
>+	default n
>+	depends on NE2000=n && PCMCIA_AXNET=n
>+	depends on PCMCIA_PCNET=n && STNIC=n && ULTRA=n && WD80x3=n
>
>In all honesty, I doubt anyone could ever use the stnic, ultra and wd
>drivers on m68k (Geert?) so these could be omitted as well. Not sure
>pcnet_cs or axnet_cs are possible to use on the Amiga PCMCIA slot, so
>all that remains in practice is the ne driver (which is used on Atari).

what is the underlying problem here anyway?

Looking at http://www.g-mb.de/pcmcia_e.html, there are quite a few cards
supported by cnet.device under AmigaOS, and seem to be working well.

I've got an Apollo RE450CT (at least I think it is - FCC ID: MQ4EC2T)
which works just fine under AmigaOS, but isn't detected by apne.ko at
all - the AmigaOS driver has had the last change to it in August 2007.

One very common card amongst AmigaOS developers with PCMCIA seems to be
the 3Com Etherlink III (3c589), which seems have had a sufficient driver
update in February 2010.

So, the situation is "ok" under AmigaOS ... but Linux support isn't there.

Looking at various forums and mailing lists, people willing to use (or
at least try) to try Linux on an A1200 or A600 seems to fail at this
stage on a regular basis, and some report rather desperate searches for
supported PCMCIA cards on various sites where people trade this kind of
stuff - usually, to no success.

If I look at the amount of people who do report success, consider the
amount of people who talk about this issue at all, and then wildly guess
how many people might have tried and failed and not said a thing, I
think there might be a quite reasonable userbase unlockable by improving
support for PCMCIA cards. The A1200 and A600 are small and sweet boxes,
and companies like Individual Computer are still building accelerators
that make them quite usable for surprising amount of tasks.

Individual Computers also created the RapidRoad extension, which adds
USB support - and AmigaOS software support is also surprisingly good.
I added a Mouse and a Keyboard and they "just worked", same as a USB
network device (ASIX AX88772), which also "just works".

I'd like to work on support for RapidRoad (shouldn't be too much work,
it uses a ST-Ericsson's isp1763 for which Android support already exists
(although probably not for the 8-bit mode it uses), and supporting it
when connected to an X-Surf should afterwards also be possible, if I
read http://wiki.icomp.de/wiki/RapidRoad correct ...

... but, all of this is no fun at all without network support under
Linux :( .. I'll order a GuruNet/Plipbox style device and shall see how
that helps me, but ...

What needs to happen for stable, reliable support for existing PCMCIA
network cards people already have? How can we unblock those possible
Linux users?

cheers from Berlin,

  count
