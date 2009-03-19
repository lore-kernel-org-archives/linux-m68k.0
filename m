From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: make headers_install broken for ARCH=m68k in 2.6.29-rc7.
Date: Thu, 19 Mar 2009 08:59:45 +0100
Message-ID: <10f740e80903190059qae0629bs8658cad8f3ad8761@mail.gmail.com>
References: <200903120437.03837.rob@landley.net>
	 <200903172304.00157.rob@landley.net> <49C087F3.3080507@snapgear.com>
	 <200903181312.02047.rob@landley.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f169.google.com ([209.85.218.169]:61407 "EHLO
	mail-bw0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751165AbZCSH7t convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 19 Mar 2009 03:59:49 -0400
In-Reply-To: <200903181312.02047.rob@landley.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Rob Landley <rob@landley.net>
Cc: Greg Ungerer <gerg@snapgear.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, dwmw2@infradead.org, linux-next@vger.kernel.org, linux-m68k@vger.kernel.org

On Wed, Mar 18, 2009 at 19:12, Rob Landley <rob@landley.net> wrote:
> On Wednesday 18 March 2009 00:34:43 Greg Ungerer wrote:
>> Rob Landley wrote:
>> > On Monday 16 March 2009 18:10:45 Greg Ungerer wrote:
>> >>>> =C2=A0 =C2=A0git://git.kernel.org/pub/scm/linux/kernel/git/gerg=
/m68knommu.git
>> >>>> fix-includes
> ...
>> > What _should_ I have done?
>>
>> The git clone you have done will just get the master branch,
>> and put it in a directory named fix-includes.
>>
>> Which is ok, but you still won't have the "fix-includes" branch.
>> Do this after the clone:
>>
>> =C2=A0 =C2=A0git pull
>> git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
>> fix-includes
>
> Ah, that did something interesting... =C2=A0And the resulting headers=
 built in
> uClibc. =C2=A0(Works for me!)
>
> confirmed-uClibc-builds-with-it-by: Rob Landley <rob@landley.net>

Does it boot on ARAnyM? ;-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
