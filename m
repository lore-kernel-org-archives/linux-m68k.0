From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Network died completely in 2.6.29 - also on m68k :)
Date: Sun, 19 Apr 2009 20:21:16 +0200
Message-ID: <10f740e80904191121x5f3ff25bh8577140a9f9971e1@mail.gmail.com>
References: <alpine.LNX.2.01.0904160950280.9424@halbrend.uninett.no>
	 <10f740e80904180228y222381e9sbbac7702b5624891@mail.gmail.com>
	 <alpine.DEB.1.00.0904190208550.7064@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f176.google.com ([209.85.219.176]:50557 "EHLO
	mail-ew0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751831AbZDSSVS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 19 Apr 2009 14:21:18 -0400
Received: by ewy24 with SMTP id 24so875407ewy.37
        for <linux-m68k@vger.kernel.org>; Sun, 19 Apr 2009 11:21:16 -0700 (PDT)
In-Reply-To: <alpine.DEB.1.00.0904190208550.7064@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>, linux-m68k@vger.kernel.org, Debian m68k <debian-68k@lists.debian.org>

On Sun, Apr 19, 2009 at 02:19, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>> > So, I tryed to pull out a m68k-v2.6.29.1 from git, but appearantly=
 there is no
>> > such thing. So=C2=B8 it is probably to add the "Disable GRO on leg=
acy netif_rx
>> > path" patch (in posting above) to the v2.6.29 branch, no?
>>
>> Usually I do not track stable myself, that's a distributor's issue ;=
-)
>> But I gave it a try, and did:
>>
>> =C2=A0 =C2=A0 git remote add stable
>> git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-2.6-stabl=
e.git
>> =C2=A0 =C2=A0 git remote update
>> =C2=A0 =C2=A0 git merge v2.6.29.1
>>
>> (git merge stable/linux-2.6.29.y should have worked, too)
>> and pushed the result to m68k-v2.6.29. However, I don't know if I
>> should keep on doing
>> this for each stable release, as you can easily do it yourself,
>> without having to wait for me.
>
> But it's so much easier if you do it :-) With that description, there=
's no
> reason why it could not be done by someone else, though. I don't thin=
k there is
> enough demand for a stable m68k kernel git tree to warrant that extra=
 tree. It
> would be a matter of setting up a separate git repository, right?

Yep.

>> Furthermore, it complicates the process of extracting patches for e.=
g.
>> the Debian kernel,
>> unless I would rebase the m68k-v2.6.29 branch on top of the latest
>> stable version.
>> But I prefer not to rebase long-lived branches like the stable branc=
h.
>>
>> What do people think?
>
> I think a distributor, i.e. Debian will pick up the patch in question=
 as part of
> the generic bugfixes anyway. Having it appear a second time as part o=
f the m68k
> patches would make things harder, really.

Indeed. And now I pulled stable into m68k-v2.6.29, `git format-patch
v2.6.29' will
give you the patches between .29 and .29.1, too.

> Don't rebase m68k-v2.6.29 unless absolutely necessary, please.

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
