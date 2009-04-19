From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC 01/16] platform: Make platform resources input
	parameters const
Date: Sun, 19 Apr 2009 20:23:30 +0200
Message-ID: <10f740e80904191123w64e951beya329e4e91aa7765@mail.gmail.com>
References: <1240080744-14995-1-git-send-email-geert@linux-m68k.org>
	 <1240080744-14995-2-git-send-email-geert@linux-m68k.org>
	 <20090418232533.GB23201@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.24]:23777 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752948AbZDSSXc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 19 Apr 2009 14:23:32 -0400
In-Reply-To: <20090418232533.GB23201@kroah.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>

On Sun, Apr 19, 2009 at 01:25, Greg KH <greg@kroah.com> wrote:
> On Sat, Apr 18, 2009 at 08:52:09PM +0200, Geert Uytterhoeven wrote:
>> Make the platform resources input parameters of platform_device_add_=
resources()
>> and platform_device_register_simple() const, as the resources are co=
pied and
>> never modified.
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Cc: Greg Kroah-Hartman <gregkh@suse.de>
>
> If you need this for your other patches, no objection from me, feel f=
ree

Yes, my other patches depend on it.

> to take it through your tree (or I can take it through mine if you
> want.)

OK, will take it. Thanks!

> Either way, feel free to add:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Greg Kroah-Hartman <gregkh@=
suse.de>
>
> to it.

Acked-by, I assume...

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
