From: Laurent Vivier <Laurent@lvivier.info>
Subject: Re: [PATCH] Add install target for m68k architecture.
Date: Sun, 2 Nov 2008 11:40:00 +0100
Message-ID: <77483457-4E75-4F82-8F7B-7E541AFDC4D1@lvivier.info>
References: <12253978673698-git-send-email-Laurent@lvivier.info> <Pine.LNX.4.64.0811021001530.5281@anakin>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:53568 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753352AbYKBKkO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 2 Nov 2008 05:40:14 -0500
In-Reply-To: <Pine.LNX.4.64.0811021001530.5281@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org


Le 2 nov. 08 =E0 10:02, Geert Uytterhoeven a =E9crit :

> On Thu, 30 Oct 2008, Laurent@lvivier.info wrote:
>> From: Laurent Vivier <Laurent@lvivier.info>
>>
>> This patch enables the use of "make install" on m68k architecture
>> to copy kernel to /boot.
>>
>> Signed-off-by: Laurent Vivier <Laurent@lvivier.info>
>> ---
>> arch/m68k/Makefile   |    3 ++
>> arch/m68k/install.sh |   52 ++++++++++++++++++++++++++++++++++++++++=
=20
>> ++++++++++
>
> It seems like we have lots of install.sh files in arch/*/{boot/}. No =
=20
> two of
> them are identical, but they're all very similar.
> Perhaps it's better to consolidate them?

I agree, but introducing a modification touching several architectures =
=20
and maintainers are harder to push into kernel.
But I'm going to try.

>> +# User may have a custom install script
>> +
>> +if [ -x ~/bin/${CROSS_COMPILE}installkernel ]; then exec ~/bin/$=20
>> {CROSS_COMPILE}installkernel "$@"; fi
>> +if [ -x /sbin/${CROSS_COMPILE}installkernel ]; then exec /sbin/$=20
>> {CROSS_COMPILE}installkernel "$@"; fi
>
> I know the original one has the same limitation, but shouldn't we =20
> check for
> all ${CROSS_COMPILE}installkernel in the user's $PATH?


I've copied the original one and though having a cross-compile install =
=20
kernel is a good idea, it's why I let these two lines.
Is there security issues by trying all installkernel scripts ?
Otherwise, I agree, and it's easy to to scan PATH to do that.

Regards,
Laurent
----------------------- Laurent Vivier ----------------------
"The best way to predict the future is to invent it."
- Alan Kay





--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
